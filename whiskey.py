#!/usr/bin/env python3
# SPDX-FileCopyrightText:
# SPDX-License-Identifier: BSD-3-Clause
import sys

def calculate_alcohol_concentration(whiskey_amount, total_amount):
    if total_amount == 0:
        raise ValueError("全体の量が0です")
    return round((whiskey_amount / total_amount) * 40, 2)

def main():
    try:
        input_line = sys.stdin.read().strip()
        if not input_line:
            print("無効な入力: 入力が空です")
            sys.exit(1)

        input_data = input_line.split()
        if len(input_data) < 2:
            print(f"無効な入力: {' '.join(input_data)}")
            sys.exit(1)

        whiskey_volume_ml = float(input_data[0])
        soda_volume_ml = float(input_data[1])
        total_volume_ml = whiskey_volume_ml + soda_volume_ml

        highball_abv = calculate_alcohol_concentration(whiskey_volume_ml, total_volume_ml)
        print(f"ハイボールのアルコール度数: {highball_abv:.2f}%")

    except ValueError as e:
        print(f"エラー: {e}")
        sys.exit(1)
    except IndexError:
        print("無効な入力: 入力の形式が正しくありません")
        sys.exit(1)

if __name__ == "__main__":
    main()

