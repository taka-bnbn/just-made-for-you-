#!/bin/bash -xv
# SPDX-FileCopyrightText:
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo "${1}行目が違うよ"
    res=1
}
res=0

out=$(echo "60 140" | ./whiskey.py 2>&1)
[ "${out}" = "ハイボールのアルコール度数: 12.00%" ] || {
    echo "期待値: ハイボールのアルコール度数: 12.00%"
    echo "実際の出力: ${out}"
    ng "$LINENO"
}

out=$(echo "あ 140" | ./whiskey.py 2>&1)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "エラー: could not convert string to float: 'あ'" ] || {
    echo "期待値: エラー: could not convert string to float: 'あ'"
    echo "実際の出力: ${out}"
    ng "$LINENO"
}

out=$(echo "" | ./whiskey.py 2>&1)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "無効な入力: 入力が空です" ] || {
    echo "期待値: 無効な入力: 入力が空です"
    echo "実際の出力: ${out}"
    ng "$LINENO"
}

out=$(echo "60" | ./whiskey.py 2>&1)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "無効な入力: 60" ] || {
    echo "期待値: 無効な入力: 60"
    echo "実際の出力: ${out}"
    ng "$LINENO"
}

[ "${res}" = 0 ] && echo "すべてのテストが成功しました！" || echo "いくつかのテストが失敗しました。"
exit $res

