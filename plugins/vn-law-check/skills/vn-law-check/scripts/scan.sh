#!/usr/bin/env bash
# Quét nhanh source code của một website để gợi ý mức độ audit (xem references/00-triage.md).
#
#   scripts/scan.sh [thư-mục]      (mặc định: thư mục hiện tại)
#
# Script chỉ đọc file, không gửi gì ra ngoài. Kết quả là GỢI Ý kèm bằng chứng
# (file:dòng). Agent vẫn phải xem lại bằng chứng trước khi kết luận.
# Với site chỉ có URL: lưu HTML trang chủ và vài trang chính vào một thư mục rồi quét thư mục đó.

set -uo pipefail

DIR="${1:-.}"
if [ ! -d "$DIR" ]; then
  echo "Không tìm thấy thư mục: $DIR" >&2
  exit 1
fi

# Chỉ quét file code/cấu hình, bỏ qua thư viện, build output, lockfile và chính bộ checklist
EXCLUDE_DIRS=(node_modules .git dist build out .next .nuxt .svelte-kit vendor coverage .vn-law-check)
INCLUDE=(--include='*.html' --include='*.htm' --include='*.js' --include='*.mjs' --include='*.cjs'
         --include='*.jsx' --include='*.ts' --include='*.tsx' --include='*.vue' --include='*.svelte'
         --include='*.astro' --include='*.php' --include='*.py' --include='*.rb' --include='*.erb'
         --include='*.liquid' --include='*.twig' --include='*.json' --include='*.toml'
         --include='*.yml' --include='*.yaml' --include='*.env.example')

GREP_ARGS=(-rEIni "${INCLUDE[@]}" --exclude='package-lock.json' --exclude='*.lock' --exclude='*.min.js')
for d in "${EXCLUDE_DIRS[@]}"; do GREP_ARGS+=(--exclude-dir="$d"); done

# Mỗi tín hiệu: tên | regex
SIGNALS=(
  "FORM|<form[ >]|formspree\.io|getform\.io|data-netlify=|docs\.google\.com/forms|type=[\"']email[\"']"
  "TRACKING|gtag\(|googletagmanager\.com|google-analytics\.com|fbq\(|connect\.facebook\.net|analytics\.tiktok\.com|clarity\.ms|hotjar|cdn\.segment\.com|plausible\.io|umami"
  "COMMERCE|add[-_ ]?to[-_ ]?cart|addToCart|/checkout|/cart[\"'/]|giỏ hàng|thêm vào giỏ|mua ngay|thanh toán|vnpay|momo|zalopay|\"stripe\"|stripe\.com|paypal|woocommerce|shopify"
  "AUTH|/login|/register|/signin|/signup|sign[-_ ]?in|đăng nhập|next-auth|nextauth|firebase/auth|supabase\.auth|passport|@clerk|auth0"
  "MARKETPLACE|multi[-_ ]?vendor|seller[-_ ]?(dashboard|register|signup|onboard)|vendor[-_ ]?(dashboard|register)|người bán|kênh người bán|đăng ký bán hàng"
  "AI|api\.openai\.com|\"openai\"|@anthropic-ai|api\.anthropic\.com|@ai-sdk|generativelanguage\.googleapis|@google/generative-ai|dialogflow|langchain|chatbot"
  "FOREIGN_HOST|amazonaws\.com|cloudfront\.net|firebaseio\.com|firebase\.json|\"firebase\"|firebase/firestore|vercel|netlify|wrangler|cloudflare|herokuapp|fly\.io|render\.com|azurewebsites"
)

declare -A FOUND
echo "Quét: $DIR"
echo

for entry in "${SIGNALS[@]}"; do
  name="${entry%%|*}"
  regex="${entry#*|}"
  hits="$(grep "${GREP_ARGS[@]}" -e "$regex" "$DIR" 2>/dev/null | head -n 3)"
  # File cấu hình hosting nhận diện theo tên file, không cần nội dung
  if [ "$name" = "FOREIGN_HOST" ] && [ -z "$hits" ]; then
    hits="$(find "$DIR" -maxdepth 2 \( -name vercel.json -o -name netlify.toml -o -name firebase.json \
             -o -name wrangler.toml -o -name fly.toml -o -name render.yaml -o -name app.yaml \) 2>/dev/null | head -n 3)"
  fi
  if [ -n "$hits" ]; then
    FOUND[$name]=1
    echo "[có]    $name"
    echo "$hits" | cut -c1-160 | sed 's/^/          /'
  else
    FOUND[$name]=0
    echo "[không] $name"
  fi
done

# Gợi ý mức theo bảng trong references/00-triage.md
if [ "${FOUND[AUTH]}" = 1 ] && [ "${FOUND[MARKETPLACE]}" = 1 ]; then
  level=3; desc="nền tảng/SaaS quy mô. Áp dụng toàn bộ 01-08"
elif [ "${FOUND[COMMERCE]}" = 1 ]; then
  level=2; desc="bán hàng/TMĐT. Áp dụng 01 + 02 + 04 (thêm 05/06 nếu có quảng cáo, hợp đồng điện tử)"
elif [ "${FOUND[FORM]}" = 1 ] || [ "${FOUND[TRACKING]}" = 1 ] || [ "${FOUND[AUTH]}" = 1 ] || [ "${FOUND[AI]}" = 1 ]; then
  # Chatbot AI nhận tin nhắn tự do của người dùng và gửi tới bên thứ ba → coi như có thu thập dữ liệu
  level=1; desc="thu thập nhẹ. Áp dụng 01 mục A, B, C"
else
  level=0; desc="tĩnh hoàn toàn. Không cần audit chi tiết"
fi

ai="no";   [ "${FOUND[AI]}" = 1 ] && ai="yes"
host="no"; [ "${FOUND[FOREIGN_HOST]}" = 1 ] && host="yes"

echo
echo "Gợi ý: mức $level, $desc"
[ "$ai" = yes ]   && echo "        + có dấu hiệu AI → thêm 07-ai-transparency"
# Site mức 0 không lưu dữ liệu cá nhân nên nhúng CDN/host nước ngoài không phát sinh nghĩa vụ chuyển dữ liệu
[ "$host" = yes ] && [ "$level" -ge 1 ] && echo "        + có dấu hiệu host/dịch vụ nước ngoài → xem 01 mục D nếu có lưu dữ liệu cá nhân"
echo
echo "LEVEL=$level AI=$ai FOREIGN_HOST=$host"
