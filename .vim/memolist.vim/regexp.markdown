<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [regexp](#regexp)
  - [グループ化](#%E3%82%B0%E3%83%AB%E3%83%BC%E3%83%97%E5%8C%96)
  - [量指定子](#%E9%87%8F%E6%8C%87%E5%AE%9A%E5%AD%90)
  - [メタ文字](#%E3%83%A1%E3%82%BF%E6%96%87%E5%AD%97)
  - [アンカー](#%E3%82%A2%E3%83%B3%E3%82%AB%E3%83%BC)
  - [エスケープ](#%E3%82%A8%E3%82%B9%E3%82%B1%E3%83%BC%E3%83%97)
  - [Variable](#variable)
  - [利用サンプル](#%E5%88%A9%E7%94%A8%E3%82%B5%E3%83%B3%E3%83%97%E3%83%AB)
  - [リンク](#%E3%83%AA%E3%83%B3%E3%82%AF)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

regexp
===

## グループ化

| 構文  | 機能                                                         |
| ----: | :----------------------------------------------------------- |
| ()    | $nで参照可能。またグループ化で束ねる際にも使用。<br/>Vim: \n |

## 量指定子

| 構文   | 機能                 | 通常  |
| -----: | :------------------- | :---- |
| *      | 0回以上の繰返        | {0,}  |
| +      | 1回以上の繰返        | {1,}  |
| ?      | 0回か1回             | {0,1} |
| {n}    | n回の繰返            |       |
| {n,}   | n回以上の繰返        |       |
| {n,m}  | n回以上m回以下の繰返 |       |

## メタ文字

| 文字        | 機能                                                                | 通常                     |
| ----------: | :------------------------------------------------------------------ | :----------------------- |
| .(ドット)   | 任意の1文字にマッチする。                                           |                          |
| \d          | 数値                                                                | [0-9]                    |
| \D          | 数値以外                                                            | [^0-9] （改行文字を含む) |
| \u          | 任意の大文字                                                        | [A-Z]                    |
| \U          | 任意の大文字以外                                                    | [^A-Z]                   |
| \l          | 任意の小文字                                                        | [a-z]                    |
| \L          | 任意の小文字以外                                                    | [^a-z]                   |
| [\l\u]      | 任意の英字                                                          | [A-Za-z]                 |
| \w          | 任意の単語文字                                                      | [0-9A-Za-z_]             |
| \W          | 任意の単語文字以外                                                  | [^0-9A-Za-z_]            |
| \s          | ホワイトスペース。\s* or \s+ などでホワイトスペースの量を制御する。 | [ \t\r\n]                |
| \S          | ホワイトスペース以外                                                | [^ \t\r\n]               |
| \t          | タブ文字                                                            |                          |
| \r          | 改行                                                                |                          |
| \n          | 強制改行                                                            |                          |

## 大文字->小文字

| start | end |
| ----: | --: |
| \L    | \E  |

## 小文字->大文字

| start | end |
| ----: | --: |
| \U    | \E  |

## アンカー

メイン

| 文字         | 機能                                                                             |
| -----------: | :------------------------------------------------------------------------------- |
| \A           | 文字列の先頭にのみ一致します(複数行はサポートされません)。                       |
| \z           | 文字列の末尾にのみ一致します。                                                   |
| (?=pattern)  | 肯定先読み。patternが直後に続くパターンにマッチ。<br />Vim: \%(pattern\)\@=      |
| (?!pattern)  | 否定先読み。patternが直後に続かないパターンにマッチ。<br />Vim: \%(pattern\)\@!  |
| (?<=pattern) | 肯定後読み。patternが直後に続くパターンにマッチ。<br />Vim: \%(pattern\)\@<=     |
| (?<!pattern) | 否定後読み。patternが直後に続かないパターンにマッチ。<br />Vim: \%(pattern\)\@<! |


サブ(利用注意)

| 文字        | 機能                                                                               |
| ----------: | :--------------------------------------------------------------------------------- |
| ^           | 文字列または行の先頭に一致します。                                                 |
| $           | 文字列または行の末尾に一致するか、文字列または行の末尾にある \n の前に一致します。 |
| \Z          | 文字列の末尾に一致するか、文字列の末尾にある \n の前に一致します。                 |
| \G          | 前回の一致が終了した位置に一致します。                                             |
| \b          | ワード境界に一致します。                                                           |
| \B          | ワード境界以外に一致します。                                                       |

## エスケープ

| 文字 | 変換後 | 補足                                                                          |
| ---: | -----: | :---------------------------------------------------------------------------- |
| \\   | \      |                                                                               |
| \^   | ^      |                                                                               |
| \\.  | .      |                                                                               |
| \\(  | (      |                                                                               |
| \\)  | )      |                                                                               |
| \\{  | {      |                                                                               |
| \\}  | }      |                                                                               |
| \\[  | [      |                                                                               |
| \\]  | ]      |                                                                               |
| \\~  | ~      |                                                                               |
| \/   | /      | PHPのデリミタで使用しているため、パターンで使用する場合にはエスケープが必要。 |

## Variable

```php
<?php
/*
細かな制御90秒などはありえないなどの制御は未設定
*/
$date = '2015-02-25 22:52:25';
//if (preg_match("/\A(?<year>[\d]{4})-(?<month>[\d]{2})-(?<day>[\d]{2})\s(?<time>[\d:]{8})\z/u",                $date, $matches)) {
//if (preg_match("/\A(?<year>[\d]{4})-(?<month>[\d]{2})-(?<day>[\d]{2})\s(?<time>[\d]{2}:[\d]{2}:[\d]{2})\z/u", $date, $matches)) {
if (preg_match("/\A(?<year>[\d]{4})-(?<month>[\d]{2})-(?<day>[\d]{2})\s(?<time>[\d]{2}(?::[\d]{2}){2})\z/u",    $date, $matches)) {
    echo("{$matches['year']}年{$matches['month']}月{$matches['day']}日 {$matches['time']}\n");
}
echo(date('Y年m月d日 H:i:s',strtotime($date))."\n");

result:
2015年02月25日 22:52:25
2015年02月25日 22:52:25
```


## 利用サンプル

郵便番号
```php
<?php
/*
1. 数値部は前半3文字、後半4文字で固定である。
*/
$addressArray = [
    '123-1234',
    '1234-1234'];
foreach ($addressArray as $address) {
    if (preg_match("/\A[\d]{3}-[\d]{4}\z/u", $address)) {
        echo("{$address}:true\n");
    } else {
        echo("{$address}:false\n");
    }
}

result:
123-1234:true
1234-1234:false
```

電話番号
```php
<?php
/*
1. 数値部は2〜4文字で3構成である。
2. 先頭の数値部 + (-数値部) *2
*/
$telArray = [
    '03-1234-1234',
    '0120-123-123',
    '090-1234-1234',
    '00090-1234-1234'];
foreach ($telArray as $tel) {
    if (preg_match("/\A[\d]{2,4}(-[\d]{2,4}){2}\z/u", $tel)) {
        echo("{$tel}:true\n");
    } else {
        echo("{$tel}:false\n");
    }
}

result:
03-1234-1234:true
0120-123-123:true
090-1234-1234:true
00090-1234-1234:false
```

[Best practice URL](http://qiita.com/mpyw/items/1e422848030fcde0f29a)
```php
<?php
$urlArray = [
    'https://www.google.co.jp/',
    'http://localhost/',
    'ftp://sample.com/'];
foreach ($urlArray as $url) {
    if (preg_match("/\A(https?|ftp):\/\/[\w\/\$_-~*();:@!?&=+.,%#]+\z/u", $url)) {
        echo("{$url}:true\n");
    } else {
        echo("{$url}:false\n");
    }
}

result:
https://www.google.co.jp/:true
http://localhost/:true
ftp://sample.com/:true
```

[Better Mailaddress](http://www.w3.org/TR/html5/forms.html#valid-e-mail-address)
```php
<?php
$mailaddressArray = [
    'sample@localhost.com',
    'dev_info@gmail.com'];
foreach ($mailaddressArray as $mailaddress) {
    if (preg_match("/\A[\w.!#$%&'*+\/=?^_`{|}~-]+@[\w](?:[\w-]{0,61}[\w])?(?:\.[\w](?:[\w-]{0,61}[\w])?)*\z/u", $mailaddress)) {
        echo("{$mailaddress}:true\n");
    } else {
        echo("{$mailaddress}:false\n");
    }
}

result:
sample@localhost.com:true
dev_info@gmail.com:true
```

## リンク

* [正規表現技術入門 最新エンジン実装と理論的背景](http://gihyo.jp/book/2015/978-4-7741-7270-5)
* [PCRE 正規表現](http://php.net/manual/ja/pcre.pattern.php)

