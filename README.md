dotfiles
===

Files are setting my development environments.

## Mac

### sudo

```bash
$ pwd
/Users/<Account>
$ sudo visudo

   <Account> ALL=(root) NOPASSWD: /usr/local/bin/htop,/usr/bin/find
```

### Install packages

App
* [Growl](https://itunes.apple.com/jp/app/growl/id467939042?mt=12)
* [TweetDeck](https://itunes.apple.com/jp/app/tweetdeck-by-twitter/id485812721?mt=12)
* [Xcode](https://developer.apple.com/jp/xcode/downloads/)
* [Wireshark](https://www.wireshark.org/download.html)

[homebrew](https://brew.sh/index_ja.html)
```bash
$ sudo chown -R $USER:staff /usr/local
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$ mkdir -p $HOME/work
$ git clone https://github.com/KazuakiM/dotfiles.git $HOME/work/dotfiles
$ sudo cp -f $HOME/work/dotfiles/etc/paths /etc/paths
$ cd $HOME/work/dotfiles/lib/Homebrew/
$ brew update
$ brew upgrade
$ brew doctor

$ open -a safari "https://gist.github.com/KazuakiM/a689e22ebd22e02fdbd2fdd878d12900"

$ brew doctor
$ cd /tmp
$ brew bundle dump
$ cp -p Brewfile $HOME/work/dotfiles/lib/Homebrew/
$ cd $HOME/work/dotfiles/
$ git status
```

Auto start
* /Applications/Growl.app
* /Applications/Karabiner.app
* /Applications/Vagrant Manager.app
* /Applications/XtraFinder.app
* /Users/xxxxx/Applications/Alfred 2.app
* /Users/xxxxx/Applications/BetterTouchTool.app
* /Users/xxxxx/Applications/CheatSheet.app
* /Users/xxxxx/Applications/Google Drive.app
* /Users/xxxxx/Applications/iTerm.app
* /Users/xxxxx/Applications/KeePassX.app

Dock
> Disabled none using app.

システム環境設定
> | 大項目                         | 小項目                                                 |                                     |
> |:-------------------------------|:-------------------------------------------------------|------------------------------------:|
> | 一般                           |                                                        |                                     |
> |                                | サイドバーのアイコンサイズ                             | 小                                  |
> |                                | アプリケーションを終了するときにウィンドウを閉じる     | チェック外し                        |
> | デスクトップとスクリーンセーバ |                                                        |                                     |
> |                                | 開始までの時間                                         | 開始しない                          |
> | Dock                           |                                                        |                                     |
> |                                | サイズ                                                 | 適当に小さく                        |
> |                                | 拡大                                                   | 適当に大きく                        |
> |                                | Dockを自動的に隠す/表示                                | チェック                            |
> | 省エネルギー                   |                                                        |                                     |
> |                                | ディスプレイをオフにするまでの時間                     | しない                              |
> | キーボード                     |                                                        |                                     |
> |                                | キーのリピート                                         | 速い                                |
> |                                | リピート入力認識までの時間                             | 速い                                |
> |                                | メニューバーにキーボードビューアと絵文字ビューアを表示 | 速い                                |
> | トラックパッド                 |                                                        |                                     |
> |                                | ポイントとクリック > 調べる&データ検出                 | 無効                                |
> |                                | ポイントとクリック > 副ボタンのクリック                | 2本指でクリックまたはタップ         |
> |                                | ポイントとクリック > タップでクリック                  | 1本指でタップ                       |
> |                                | ポイントとクリック > クリック & 軌跡の速さ             | 速い                                |
> |                                | その他のジェスチャ > ページ間をスワイプ                | チェック外し                        |
> |                                | その他のジェスチャ > アプリケーションExpose            | チェック                            |
> |                                | その他のジェスチャ > デスクトップを表示                | チェック外し                        |
> | iCloud                         |                                                        |                                     |
> |                                | 写真 > オプション                                      | 全チェック外し                      |
> |                                | 連絡先                                                 | チェック外し                        |
> |                                | カレンダー                                             | チェック外し                        |
> |                                | リマインダー                                           | チェック外し                        |
> |                                | Safari                                                 | チェック外し                        |
> |                                | メモ                                                   | チェック外し                        |
> |                                | Macを探す                                              | チェック外し                        |
> | App Store                      |                                                        |                                     |
> |                                | 設定 & ロック                                          | 適切に設定してロック                |
> | 機能拡張                       |                                                        |                                     |
> |                                | 共有メニュー                                           | 全チェック外し                      |
> |                                | 今日                                                   | iTunes                              |
> |                                |                                                        | 天気                                |
> |                                |                                                        | 計算機                              |
> | 共有                           |                                                        |                                     |
> |                                | コンピュータ名                                         | イカした名前                        |
> | ユーザとグループ               |                                                        |                                     |
> |                                | アイコン画像                                           | GitHubからDLして、ドラッグ&ドロップ |

Finder
> 環境設定
> | 大項目                             | 小項目                                                   |                               |
> |:-----------------------------------|:---------------------------------------------------------|------------------------------:|
> | 一般                               |                                                          |                               |
> |                                    | デスクトップに表示する項目                               | 全チェック外し                |
> |                                    | 新規Finderウィンドウで次を表示                           | デスクトップ                  |
> | タグ                               |                                                          |                               |
> |                                    | サイドバーに表示するタグ                                 | 全チェック削除                |
> | サイドバー                         |                                                          |                               |
> |                                    | マイファイル                                             | チェック外し                  |
> |                                    | AirDrop                                                  | チェック外し                  |
> |                                    | ホーム                                                   | チェック                      |
> |                                    | 共有                                                     | 全チェック外し                |
> |                                    | PC名                                                     | チェック                      |
> |                                    | 外部ディスク                                             | チェック外し                  |
> |                                    | CD、DVD、およびiPad                                      | チェック外し                  |
> |                                    | タグ                                                     | チェック外し                  |
> | 詳細                               |                                                          |                               |
> |                                    | すべてのファイル名拡張子を表示                           | チェック                      |

[Alfred](http://www.alfredapp.com/)
> Application設定
>
> |大項目     |小項目                            |                        |
> |:----------|:---------------------------------|-----------------------:|
> |Preferences|                                  |                        |
> |           |General >Where are you            |Japan                   |
> |Features   |                                  |                        |
> |           |Default Results > Essentials > Bookmarks - Safari |Check   |

[AppCleaner](http://www.freemacsoft.net/appcleaner/)

[BetterTouchTool](http://www.bettertouchtool.net/)
> Application設定
>
> |大項目                                                 |小項目                            |   |
> |:------------------------------------------------------|:---------------------------------|--:|
> |Action Settings(Window Snapping etc.) > Window Snapping|                                  |   |
> |                                                       |Normal Snapping / Moving          |   |
> |                                                       |Left width                        |24%|
> |                                                       |Right width                       |76%|
> |                                                       |Corner Snapping / Move to quarters|   |
> |                                                       |Left width                        |50%|
> |                                                       |Right width                       |50%|

[CheatSheet](http://www.cheatsheetapp.com/CheatSheet/)

[Chicken](http://sourceforge.net/projects/chicken/)

[FileZilla](https://filezilla-project.org/)

[FireFox](https://www.mozilla.org/ja/firefox/)
> Common setting

[GIMP](http://www.gimp.org)

[Google Chrome](https://www.google.com/chrome/)
> Common setting

[Google drive](https://drive.google.com/)

[Google 日本語IME](https://www.google.co.jp/ime/)

TODO: [GrowlNotify](http://growl.info/downloads)

[iTerm2](http://iterm2.com/)
> Application設定
>
> |大項目                             |小項目                                      |                              |
> |:----------------------------------|:-------------------------------------------|:-----------------------------|
> |Preferences > General > Preferences|                                            |                              |
> |                                   |Load preferences from a custom folder or URL|$HOME/work/dotfiles/lib/iTerm2|
> |Preferences > Keys > Key Mappings  |                                            |                              |
> |                                   |⌘w                                          |Ignore                        |


[Karabiner](https://pqrs.org/osx/karabiner/index.html.ja)
> Application設定
>
> |大項目                                       |小項目            |     |
> |:--------------------------------------------|:-----------------|----:|
> |Key Repeat > Basic Configurations > KeyRepeat|                  |     |
> |                                             |Delay Until Repeat|200ms|
> |                                             |Key Repeat        | 25ms|

[KeyCast](https://github.com/cho45/KeyCast)
> Application設定
>
> |大項目               |小項目|                                                                    |
> |:--------------------|:-----|-------------------------------------------------------------------:|
> |KeyCast > Preferences|      |                                                                    |
> |                     |Width |300                                                                 |
> |                     |Height|200                                                                 |
> |                     |Font  |[RictyDiminished](https://github.com/yascentur/RictyDiminished) 15px|

[KeePassX](http://www.keepassx.org/)

[Kindle](https://www.amazon.com/gp/digital/fiona/kcp-landing-page)

[LibreOffice](https://www.libreoffice.org/)

[LimeChat](http://limechat.net/mac/)
> Application設定
>
> |大項目                |小項目                       |                                                                     |
> |:---------------------|:----------------------------|:--------------------------------------------------------------------|
> |LimeChat > Preferences|                             |                                                                     |
> |                      |Log > Show job/leave events  |no check                                                             |
> |                      |Log > Show rename events     |no check                                                             |
> |                      |Log > Log transcripts        |Trashes                                                              |
> |                      |Theme > Current theme        |Spring Night                                                         |
> |                      |Theme > Override log font    |[RictyDiminished](https://github.com/yascentur/RictyDiminished) 13px |
> |                      |Theme > Override input font  |[RictyDiminished](https://github.com/yascentur/RictyDiminished) 13px |
> |Server > Add Server   |                             |                                                                     |
> |                      |General > Network name       |Lingr                                                                |
> |                      |General > Connect on start up|check                                                                |
> |                      |General > Server             |localhost                                                            |
> |                      |General > Port               |26667                                                                |
> |                      |General > Server Password    |\* \* \* \*                                                          |
> |                      |General > Nickname           |kazuakiM                                                             |
> |                      |General > Login name         |kazuakiM                                                             |
> |                      |General > Real name          |kazuakiM                                                             |
> |                      |Details > Encoding           |UTF-8                                                                |
> |                      |Details > Fallback encoding  |Don't Fallback                                                       |

[夜フクロウ(Night 0wl)](https://sites.google.com/site/yorufukurou/home-en)
> Application設定
>
> |大項目                               |小項目                                            |                   |
> |:------------------------------------|:-------------------------------------------------|:------------------|
> |環境設定 > 一般                      |                                                  |                   |
> |                                     |リアルタイム更新を有効化する                      |check              |
> |                                     |投稿した後リストに自動フォーカスする              |no check           |
> |                                     |更新時に一番上にスクロールする                    |check              |
> |環境設定 > アカウント                |                                                  |                   |
> |                                     |タイムラインタブを未読管理する                    |no check           |
> |環境設定 > 表示                      |                                                  |                   |
> |                                     |片思いバッジを表示する                            |check              |
> |                                     |ミニビューを使用する                              |check              |
> |                                     |リストに表示する名前                              |ユーザID           |
> |環境設定 > タブ                      |                                                  |                   |
> |                                     |起動時に取得したツイートを既読状態にする          |check              |
> |                                     |市場鵺にスクロールした際にツイートを既読状態にする|check              |
> |                                     |Favoritesタブを表示する(要再起動)                 |no check           |
> |環境設定 > テキスト入力              |                                                  |                   |
> |                                     |ツイート入力                                      |check              |
> |                                     |フォントサイズ                                    |11pt               |
> |                                     |投稿に使用するキー                                |⌘ + Return         |
> |環境設定 > 色                        |                                                  |                   |
> |                                     |リストの表示スタイル                              |ダーク             |
> |                                     |デフォルトの色設定                                |ダーク             |
> |環境設定 > 通知                      |                                                  |                   |
> |                                     |音量                                              |5%                 |
> |環境設定 > 詳細                      |                                                  |                   |
> |                                     |ダブルクリック時の挙動                            |会話ビューオン/オフ|
> |                                     |ツイートのコピー形式                              |ツイートのURL      |
> |表示                                 |                                                  |                   |
> |                                     |ツールバーを表示する/隠す                         |選択               |
> |                                     |縮小                                              |選択               |
> |ツイートボックス > ⚙                 |                                                  |                   |
> |                                     |ハッシュタグを保持                                |                   |

[RictyDiminished](https://github.com/yascentur/RictyDiminished)

[Safari](https://www.apple.com/jp/safari/)
> Application設定
>
> |大項目           |小項目                                                                             |                                        |
> |:----------------|:----------------------------------------------------------------------------------|:---------------------------------------|
> |Safari > 環境設定|                                                                                   |                                        |
> |                 |一般 > 新規ウィンドウを開く場合                                                    |ホームページ                            |
> |                 |一般 > 新規タブを開く場合                                                          |空のページ                              |
> |                 |一般 > ホームページ                                                                |file:///file/to/path/bookmark.html      |
> |ブックマーク     |ホームページの内容をブックマークに登録する([Alfred](http://www.alfredapp.com/)利用)|                                        |

[Skitch](http://evernote.com/skitch/)
> Application設定
>
> |大項目           |小項目                                                                        |        |
> |:----------------|:-----------------------------------------------------------------------------|:-------|
> |Skitch > 環境設定|                                                                              |        |
> |                 |一般設定 > Skitch Helper > コンピュータのログイン時に Skitch Helper を起動する|no check|
> |                 |同期 > 新しい Skitch ノートを Evernote に保存                                 |手動    |
> |                 |同期 > Evernote との動機頻度                                                  |手動    |

[Sony Ericsson Bridge for Mac](http://support.sonymobile.com/au/tools/bridge-for-mac/)

[The Unarchiver](http://unarchiver.c3.cx/)

[tunnelblick](https://tunnelblick.net/)

### Set dotfiles

```bash
$ ln -sf $HOME/work/dotfiles/.bash_logout         $HOME/.bash_logout
$ ln -sf $HOME/work/dotfiles/.bash_profile        $HOME/.bash_profile
$ ln -sf $HOME/work/dotfiles/.bashrc              $HOME/.bashrc
$ cp -f  $HOME/work/dotfiles/.bashrc.local        $HOME/
$ ln -sf $HOME/work/dotfiles/.cache               $HOME/.cache
$ ln -sf $HOME/work/dotfiles/.config              $HOME/.config
$ ln -sf $HOME/work/dotfiles/.ctags               $HOME/.ctags
$ cd $HOME/.config/git && ln -sf config.org          config
$ cd $HOME/.config/git && ln -sf gitconfig.local.org gitconfig.local
$ ln -sf $HOME/work/dotfiles/.htoprc              $HOME/.htoprc
$ ln -sf $HOME/work/dotfiles/.inputrc             $HOME/.inputrc
$ ln -sf $HOME/work/dotfiles/.lib                 $HOME/.lib
$ ln -sf $HOME/work/dotfiles/.log                 $HOME/.log
$ ln -sf $HOME/work/dotfiles/.mplayer             $HOME/.mplayer
$ ln -sf $HOME/work/dotfiles/.ssh                 $HOME/.ssh
$ cp -f  $HOME/.ssh/config.mac                    $HOME/.ssh/config
$ ln -sf $HOME/work/dotfiles/.vim                 $HOME/.vim
$ cp -f  $HOME/work/dotfiles/.vim/vimrc.local.org $HOME/.vim/vimrc.local
$ ln -sf $HOME/work/dotfiles/.w3m                 $HOME/.w3m
$ ln -sf $HOME/work/dotfiles/lib/Vagrant          /srv/vagrant
$ curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
$ sh ./installer.sh $HOME/.vim/dein.vim/
$ rm installer.sh
$ ssh-keygen -t rsa -b 4096 -C "xxxx@xxx"
$ wget http://jp2.php.net/distributions/manual/php_manual_ja.tar.gz -O /tmp/php_manual_ja.tar.gz
$ tar zxvf /tmp/php_manual_ja.tar.gz -C $HOME/.vim/vim-ref
$ wget http://get.sensiolabs.org/php-cs-fixer.phar -O $HOME/.vim/vim-php-cs-fixer/php-cs-fixer
$ chmod a+x $HOME/.vim/vim-php-cs-fixer/php-cs-fixer
$ php $HOME/work/dotfiles/src/phpDict.php
$ sh $HOME/work/dotfiles/src/htmlReference.sh
```

### Composer

```bash
$ curl -sS https://getcomposer.org/installer | php
$ composer global update
```
### npm

```bash
$ npm install -g
```

### Vagrant

```bash
$ cd /srv/vagrant
$ vagrant plugin install vagrant-cachier
$ vagrant plugin install vagrant-vbguest
$ vagrant up
$ vagrant ssh-config > ssh.config
$ scp -P 2222 -F /srv/vagrant/ssh.config /tmp/<file> default:/tmp/
$ scp -P 2222 -F /srv/vagrant/ssh.config default:/tmp/<file> /tmp/
```

### sudo

```bash
$ which htop
/usr/local/bin/htop
$ which find
/usr/bin/find
$ sudo visudo

   <Account> ALL=(root) NOPASSWD: /usr/local/bin/htop,/usr/bin/find
```

## Linux

I made Vagrantfile.

## Windows

### CMD

```
mkdir C:\usr\local\bin
```

### Install packages

> * [Cygwin](https://cygwin.com/install.html)
>  * tar
>  * gnupg
>  * gawk
>  * wget
> * [Executor](http://executor.dk/)
> * [FireFox](https://www.mozilla.org/ja/firefox/new/)
> * [Chrome](https://www.google.co.jp/chrome/browser/desktop/index.html)
> * [Kaoriya-Vim](http://www.kaoriya.net/software/vim/)
> * [Wireshark](https://www.wireshark.org/download.html)
> * [Sizer](http://www.brianapps.net/sizer/)
> * [WinMerge](http://www.geocities.co.jp/SiliconValley-SanJose/8165/winmerge.html)
> * [JSONViewer](http://jsonviewer.codeplex.com/)
> * [X-Finder](http://www.vector.co.jp/soft/win95/util/se320392.html)
> * [SQLFix](http://www.vector.co.jp/soft/dl/win95/business/se266921.html)
> * [XMLFix](http://www.vector.co.jp/soft/dl/winnt/net/se342840.html)
> * [Poderosa](https://osdn.jp/projects/sfnet_poderosa/)
> * [FileZilla](https://osdn.jp/projects/filezilla/)

### Set environment variables

|Name|Value                     |
|:---|:-------------------------|
|HOME|C:\cygwin64\home\<Account>|

### Operate Cygwin

TODO:wgetオプションの確認  
TODO:apt-cygのインストール状況を確認'apt-cyg show'
> ```bash
> $ cd /cygdrive/c/usr/local/bin/Poderosa/Protocols/Cygterm
> $ make
> $ wget https://raw.githubusercontent.com/transcode-open/apt-cyg/master/apt-cyg -O /usr/local/bin
> $ chmod 0755 /usr/local/bin/apt-cyg
> $ wget https://raw.githubusercontent.com/KazuakiM/dotfiles/master/lib/Cygwin/aptCyg.sh -O /tmp
> $ sh /tmp/aptCyg.sh
> $ cd $HOME/..
> $ tar zcvf <Account>.tar.gz <Account>
> $ mv <Account>.tar.gz /tmp
> $ rm -rf <Account>
> $ git clone https://github.com/KazuakiM/dotfiles.git <Account>
> $ curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
> $ sh ./installer.sh $HOME/.vim/dein.vim/
> $ rm installer.sh
> $ ssh-keygen -t rsa -b 4096 -C "xxxx@xxx"
> $ cd $HOME/.config/git && ln -sf config.org          config
> $ cd $HOME/.config/git && ln -sf gitconfig.local.org gitconfig.local
>  Update local setting.
>
> $ wget http://jp2.php.net/distributions/manual/php_manual_ja.tar.gz -O /tmp
> $ tar zxvf /tmp/php_manual_ja.tar.gz -C $HOME/.vim/vim-ref
> $ wget http://get.sensiolabs.org/php-cs-fixer.phar -O $HOME/.vim/vim-php-cs-fixer/php-cs-fixer
> $ chmod a+x $HOME/.vim/vim-php-cs-fixer/php-cs-fixer
> $ php $HOME/src/phpDict.php
> $ sh $HOME/src/htmlReference.sh
> $ git clone https://github.com/yascentur/RictyDiminished.git /tmp/RictyDiminished
>  Copy font directory
>
> $ exit
> ```

## Common setting

### Install packages

[Google Chrome](https://www.google.com/chrome/)
> Application設定
>
> |大項目                |小項目                                             |                                                                         |
> |:---------------------|:--------------------------------------------------|:------------------------------------------------------------------------|
> |Required sync setting |                                                   |                                                                         |
> |Chrome > 環境設定     |                                                   |                                                                         |
> |                      |設定 > デザイン > ホームボタンを表示する           |check                                                                    |
> |                      |設定 > デザイン > ホームボタンを表示する > 変更する|file:///file/to/path/bookmark.html                                       |
> |拡張機能              |                                                   |                                                                         |
> |                      |[Awesome Screenshot](https://chrome.google.com/webstore/detail/awesome-screenshot-screen/alelhddbbhepgpmgidjdcjakblofbmce)  ||
> |                      |[Text Link Plus](https://chrome.google.com/webstore/detail/text-link/ikfmghnmgeicocakijcebpkmbfljnogk)                      ||
> |                      |[User-Agent Switcher](https://chrome.google.com/webstore/detail/user-agent-switcher/lkmofgnohbedopheiphabfhfjgkhfcgf)       ||
> |                      |[はてなブックマーク](https://chrome.google.com/webstore/detail/%E3%81%AF%E3%81%A6%E3%81%AA%E3%83%96%E3%83%83%E3%82%AF%E3%83%9E%E3%83%BC%E3%82%AF-googlechrome-%E6%8B%A1%E5%BC%B5/dnlfpnhinnjdgmjfpccajboogcjocdla)||
> |設定                  |                                                   |                                                                         |
> |                      |ウェブコンテンツ                                   |フォント: [RictyDiminished](https://github.com/yascentur/RictyDiminished)|

[FireFox](https://www.mozilla.org/ja/firefox/)
> Application設定
>
> |大項目                |小項目                                 |                                                               |
> |:---------------------|:--------------------------------------|:--------------------------------------------------------------|
> |Required sync setting |                                       |                                                               |
> |Firefox > 環境設定    |                                       |                                                               |
> |                      |一般 > ホームページ                    |file:///file/to/path/bookmark.html                             |
> |                      |検索                                   |Google以外Remove                                               |
> |                      |コンテンツ > フォントとカラー > デフォルトフォント|[RictyDiminished](https://github.com/yascentur/RictyDiminished)|
> |                      |コンテンツ > 言語 > 言語設定           |Add Japanese[ja]                                               |
> |add-on                |                                       |                                                               |
> |                      |[Firebug](https://addons.mozilla.org/ja/firefox/addon/firebug/)                                       ||
> |                      |[FireMobileSimulator](https://addons.mozilla.org/ja/firefox/addon/firemobilesimulator/)               ||
> |                      |[Growl/GNTP](https://addons.mozilla.org/ja/firefox/addon/growlgntp/)                                  ||
> |                      |[Hatena Bookmark](https://addons.mozilla.org/ja/firefox/addon/hatena-bookmark/)                       ||
> |                      |[JSONView](https://addons.mozilla.org/ja/firefox/addon/jsonview/)                                     ||
> |                      |[Quick Translator](https://addons.mozilla.org/ja/firefox/addon/quick-translator/)                     ||
> |                      |[RESTClient](https://addons.mozilla.org/ja/firefox/addon/restclient/)                                 ||
> |                      |[The Addon Bar(restored)](https://addons.mozilla.org/ja/firefox/addon/the-addon-bar/?src=hp-btn-promo)||
> |                      |[Web Developer](https://addons.mozilla.org/ja/firefox/addon/web-developer/)                           ||
> |                      |[テキストリンク](https://addons.mozilla.org/ja/firefox/addon/text-link/)                              ||
> |about:config          |                                       |                                                               |
> |                      |browser.tabs.closeWindowWithLastTab    |false                                                          |

## TODO

* Try Chocolatey

