#!/usr/bin/env bash
# Chạy scripts/scan.sh trên từng site mẫu trong tests/fixtures/ và so với file EXPECTED.
#   tests/run.sh
#
# Site mẫu có file URL_ONLY được phục vụ qua một server local rồi quét bằng URL,
# để kiểm tra chế độ quét site đang chạy (scripts/fetch-site.sh).

set -uo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
PORT=8765
fail=0

for dir in "$ROOT"/tests/fixtures/*/; do
  name="$(basename "$dir")"
  expected="$(cat "$dir/EXPECTED")"

  if [ -f "$dir/URL_ONLY" ]; then
    python3 -m http.server "$PORT" --directory "$dir" >/dev/null 2>&1 &
    server=$!
    sleep 1
    got="$(bash "$ROOT/scripts/scan.sh" "http://localhost:$PORT/" | grep '^LEVEL=' | awk '{print $1, $2}')"
    kill "$server" 2>/dev/null
    wait "$server" 2>/dev/null
    mode="url"
  else
    got="$(bash "$ROOT/scripts/scan.sh" "$dir" | grep '^LEVEL=' | awk '{print $1, $2}')"
    mode="dir"
  fi

  if [ "$got" = "$expected" ]; then
    echo "PASS  $name [$mode]  ($got)"
  else
    echo "FAIL  $name [$mode]  mong đợi: $expected  nhận được: $got"
    fail=1
  fi
done

exit $fail
