# SwiftUI_ScheduleManagement

#タイトル
時間割管理アプリ
　
##アプリケーション概要
時間割と一緒に自分が乗る電車の時間も確認することができ、「何時の電車に乗って何の時間割」が、わかるようになっています。

##GIF
![ezgif com-optimize](https://user-images.githubusercontent.com/109132975/232325969-55a950ff-924a-4370-8990-8e5a80b7ed29.gif)

##アプリケーションの機能一覧
+1限目から10限目までなら増減できます。それ以上、又は以下の場合alertが出ます。
+修正するときに「リセット」ボタンを配置しており、初期状態に戻します。
+DatePickerで電車の時刻を変更可能

##ライブラリ
+Realm Database(データベース)

##開発

###言語
Swift
 
###構成
UIの実装：　SwiftUI

###セットアップ
1. このプロジェクトをクローンします。
```
$ git clone https://github.com/KakizakiHayate/SwiftUI_ScheduleManagement.git
$ cd ScheduleManagement
```

2. ScheduleManagement.xcworkspaceファイルを開く
```
$ open ScheduleManagement.xcworkspace
```
3. 完了

##今後の計画
+時間割と電車の時刻が知りたい時と、「月〜日曜日」を一覧で全部見たいときがあったのでTabviewで分けて作る
+時間割が書いてある紙をかざすとAIが紙を読み取って文字を起こしてくれると、一々教科名入力しないくて楽にできるかも
+UI/UXも改善していきたい
