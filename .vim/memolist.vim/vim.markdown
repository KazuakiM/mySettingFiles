<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Vim](#vim)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

Vim
===

複数の行末に文字列を追加

1. 短形ヴィジュアルモードで範囲指定
1. $ で末尾移動
1. 【重要】Aで挿入モードに移行
1. 行末に文字追加
1. ESC

関数削除

1. vim-qfreplaceで関数を検索
1. 各行で関数の括弧にカーソルを合わせ、"ds("を実行
1. ```:%s/(function)//g```
1. ```:wq```

10個目のカンマで改行

1. ```:%s/\([^,]*,\)\{10\}/&^M/g```

9個目のカンマを置換

妙案がないため、一旦Excelで対処
