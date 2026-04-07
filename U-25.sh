#!/bin/bash

# U-25: world writable 파일 점검

echo "=============================="
echo " U-25: world writable 파일 점검"
echo "=============================="

# world writable 파일 검색 (디렉터리 제외, 일반 파일만)
RESULT=$(find / -type f -perm -2 -xdev -ls 2>/dev/null)

if [ -z "$RESULT" ]; then
    echo "[양호] world writable 파일이 존재하지 않습니다."
else
    echo "[취약] world writable 파일이 발견되었습니다."
    echo ""
    echo "[발견된 파일 목록]"
    echo "$RESULT"
    echo ""
    echo "[조치 방법]"
    echo "  - 일반 사용자 쓰기 권한 제거: chmod o-w <파일명>"
    echo "  - 불필요한 파일 제거: rm <파일명>"
fi

echo "=============================="
