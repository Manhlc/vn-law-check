#!/usr/bin/env bash
# Quét nhanh một website để gợi ý mức độ audit (xem references/00-triage.md).
#
#   scripts/scan.sh [thư-mục-code]       quét source code (mặc định: thư mục hiện tại)
#   scripts/scan.sh https://ten-mien.vn  quét site đang chạy, khi không có source code
#
# Với thư mục: chỉ đọc file, không gọi mạng.
# Với URL: gọi scripts/fetch-site.sh để tải các trang công khai của chính site đó
# (trang chủ, trang chính sách/liên hệ/giỏ hàng, file JS cùng tên miền) về thư mục tạm,
# rồi quét như source code. Không gửi dữ liệu đi đâu khác.
#
# Kết quả là GỢI Ý kèm bằng chứng (file:dòng:đoạn khớp). Agent vẫn phải xem lại
# bằng chứng trước khi kết luận.

set -uo pipefail

TARGET="${1:-.}"
URL_MODE=0
if [[ "$TARGET" =~ ^https?:// ]]; then
  URL_MODE=1
  DIR="$(mktemp -d)"
  bash "$(dirname "$0")/fetch-site.sh" "$TARGET" "$DIR" || exit 1
  echo
else
  DIR="$TARGET"
  if [ ! -d "$DIR" ]; then
    echo "Không tìm thấy thư mục: $DIR" >&2
    exit 1
  fi
fi

# Chỉ quét file code/cấu hình, bỏ qua thư viện, build output, lockfile và chính bộ checklist
EXCLUDE_DIRS=(node_modules .git dist build out .next .nuxt .svelte-kit vendor coverage .vn-law-check)
INCLUDE=(--include='*.html' --include='*.htm' --include='*.js' --include='*.mjs' --include='*.cjs'
         --include='*.jsx' --include='*.ts' --include='*.tsx' --include='*.vue' --include='*.svelte'
         --include='*.astro' --include='*.php' --include='*.py' --include='*.rb' --include='*.erb'
         --include='*.liquid' --include='*.twig' --include='*.json' --include='*.toml'
         --include='*.yml' --include='*.yaml' --include='*.env.example')

# -o: chỉ in đoạn khớp, để bằng chứng vẫn đọc được với file JS đã minify (cả file nằm trên 1 dòng)
GREP_ARGS=(-rEIino "${INCLUDE[@]}" --exclude='package-lock.json' --exclude='*.lock' --exclude='*.min.js')
for d in "${EXCLUDE_DIRS[@]}"; do GREP_ARGS+=(--exclude-dir="$d"); done

# Mỗi tín hiệu: tên | regex. Có thêm mẫu cho JSX đã compile (jsx("form", createElement("form")
# vì site React/Next chỉ lộ form trong file JS.
SIGNALS=(
  "FORM|<form[ >]|jsxs?\(\"form\"|createElement\(\"form\"|formspree\.io|getform\.io|data-netlify=|docs\.google\.com/forms|type=[\"']email[\"']|type:[[:space:]]*[\"']email[\"']"
  "TRACKING|gtag\(|googletagmanager\.com|google-analytics\.com|fbq\(|connect\.facebook\.net|analytics\.tiktok\.com|clarity\.ms|hotjar|cdn\.segment\.com|plausible\.io|umami"
  "COMMERCE|add[-_ ]?to[-_ ]?cart|addToCart|/checkout|/cart[\"'/]|giỏ hàng|thêm vào giỏ|mua ngay|thanh toán|vnpay|momo|zalopay|\"stripe\"|stripe\.com|paypal|woocommerce|shopify"
  "AUTH|/login|/register|/signin|/signup|sign[-_ ]?in|đăng nhập|next-auth|nextauth|firebase/auth|supabase\.auth|passport|@clerk|auth0"
  "MARKETPLACE|multi[-_ ]?vendor|seller[-_ ]?(dashboard|register|signup|onboard)|vendor[-_ ]?(dashboard|register)|người bán|kênh người bán|đăng ký bán hàng"
  "AI|api\.openai\.com|\"openai\"|@anthropic-ai|api\.anthropic\.com|@ai-sdk|generativelanguage\.googleapis|@google/generative-ai|dialogflow|langchain|chatbot"
  "FOREIGN_HOST|amazonaws\.com|cloudfront\.net|firebaseio\.com|firebase\.json|\"firebase\"|firebase/firestore|vercel|netlify|wrangler|cloudflare|herokuapp|fly\.io|render\.com|azurewebsites"
)

# Dùng biến FOUND_<TÊN> thay cho mảng kết hợp, vì macOS mặc định là bash 3.2 (không có declare -A)
found() { local v="FOUND_$1"; [ "${!v:-0}" = 1 ]; }

echo "Quét: $([ "$URL_MODE" = 1 ] && echo "$TARGET" || echo "$DIR")"
echo

for entry in "${SIGNALS[@]}"; do
  name="${entry%%|*}"
  regex="${entry#*|}"
  hits="$(grep "${GREP_ARGS[@]}" -e "$regex" "$DIR" 2>/dev/null | awk '!seen[$0]++' | head -n 3)"
  if [ "$name" = "FOREIGN_HOST" ] && [ -z "$hits" ]; then
    # Source code: nhận diện qua file cấu hình hosting
    hits="$(find "$DIR" -maxdepth 2 \( -name vercel.json -o -name netlify.toml -o -name firebase.json \
             -o -name wrangler.toml -o -name fly.toml -o -name render.yaml -o -name app.yaml \) 2>/dev/null | head -n 3)"
    # URL: nhận diện qua response header của trang chủ
    if [ -z "$hits" ] && [ -f "$DIR/response-headers.txt" ]; then
      hits="$(grep -iE '^(server|via|x-vercel-id|cf-ray|x-amz-cf-id|x-nf-request-id|x-served-by|x-github-request-id|x-powered-by):.*' "$DIR/response-headers.txt" \
              | grep -iE 'vercel|cloudflare|cf-ray|cloudfront|amazon|netlify|firebase|github|fly|render|heroku|azure|google' \
              | tr -d '\r' | sed 's/^/response-headers: /' | head -n 3)"
    fi
  fi
  if [ -n "$hits" ]; then
    printf -v "FOUND_$name" 1
    echo "[có]    $name"
    echo "$hits" | sed "s#^$DIR/##" | cut -c1-160 | sed 's/^/          /'
  else
    echo "[không] $name"
  fi
done

# Gợi ý mức theo bảng trong references/00-triage.md
if found AUTH && found MARKETPLACE; then
  level=3; desc="nền tảng/SaaS quy mô. Áp dụng toàn bộ 01-08"
elif found COMMERCE; then
  level=2; desc="bán hàng/TMĐT. Áp dụng 01 + 02 + 04 (thêm 05/06 nếu có quảng cáo, hợp đồng điện tử)"
elif found FORM || found TRACKING || found AUTH || found AI; then
  # Chatbot AI nhận tin nhắn tự do của người dùng và gửi tới bên thứ ba → coi như có thu thập dữ liệu
  level=1; desc="thu thập nhẹ. Áp dụng 01 mục A, B, C"
else
  level=0; desc="tĩnh hoàn toàn. Không cần audit chi tiết"
fi

ai="no";   found AI && ai="yes"
host="no"; found FOREIGN_HOST && host="yes"

echo
echo "Gợi ý: mức $level, $desc"
[ "$ai" = yes ]   && echo "        + có dấu hiệu AI → thêm 07-ai-transparency"
# Site mức 0 không lưu dữ liệu cá nhân nên nhúng CDN/host nước ngoài không phát sinh nghĩa vụ chuyển dữ liệu
[ "$host" = yes ] && [ "$level" -ge 1 ] && echo "        + có dấu hiệu host/dịch vụ nước ngoài → xem 01 mục D nếu có lưu dữ liệu cá nhân"
if [ "$URL_MODE" = 1 ]; then
  echo
  echo "Các trang đã tải nằm ở: $DIR"
  echo "Đọc trang chính sách trong pages/ để audit nội dung."
  echo "Quét qua URL không thấy được code phía server (chatbot gọi AI qua server, nơi lưu dữ liệu),"
  echo "nên cần xem thêm trực tiếp trên trang, ví dụ có khung chat nào không."
fi
echo
echo "LEVEL=$level AI=$ai FOREIGN_HOST=$host"
