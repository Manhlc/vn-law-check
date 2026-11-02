#!/usr/bin/env bash
# Chạy scripts/scan.sh trên từng site mẫu trong tests/fixtures/ và so với file EXPECTED.
#   tests/run.sh

set -uo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
fail=0

for dir in "$ROOT"/tests/fixtures/*/; do
  name="$(basename "$dir")"
  expected="$(cat "$dir/EXPECTED")"
  got="$(bash "$ROOT/scripts/scan.sh" "$dir" | grep '^LEVEL=' | awk '{print $1, $2}')"
  if [ "$got" = "$expected" ]; then
    echo "PASS  $name  ($got)"
  else
    echo "FAIL  $name  mong đợi: $expected  nhận được: $got"
    fail=1
  fi
done

exit $fail
