# パステル

[![Product Name](image.png)](https://www.youtube.com/watch?v=G5rULR53uMk)

## 製品概要
### X Tech（見守り x Tech）

### 背景（製品開発のきっかけ、課題等）
ここに
- こんかいのプロダクトの開発に至った背景
多くのオフィスや研究室では、鍵の施錠を労働者が自分で行うが、
誰が行うかは、最初に来た人や、最後に職場を離れる人がその役目を担う。
多くの場合、最後に施錠を行う人は長時間の労働に疲弊しており、人気のない職場での仕事に心寂しさを持つ人も少なくない
対話ができ、入退室の情報を活用して、労いの言葉をかけたり人にとって受け入れやすい入退室管理システムを作成した


- 着目した顧客・顧客の課題・現状を記入してください
現状、誰がいま職場に残っているのかを確認し、鍵を閉めるかどうかの判断をすることがある
広い職場であれば様々な部署を周り確認する必要がある
あるいは高額な設備投資によりカードシステム等を導入するか警備員を巡回させる必要が出てくる
もっと簡易なシステムで導入しやすい入退室管理システムは望まれている


### 製品説明（具体的な製品の説明）
こちらに製品の概要・特徴について説明を記載してください。
カメラで人の画像の検出を行い、だれが入退室をしたのかの情報を取得する。
カメラ認識ができない場合は、LINE Clovaで話しかけを行い、人の判断を行なう。
退出の際、その人以外誰も残っていない場合は、鍵の開け閉めを促すような声掛けを行う。


### 特長

#### 1. 声紋と動画像を用いた個人の特定

#### 2. 入退室の履歴が一目で分かる

#### 3. 監視されている感じがしない

### 解決出来ること
職場から外出、帰宅する際に部屋に確認しに行く手間を省くことができる。
また、最後であるということを退出者に伝えることで、中に人がいるかどうかの確認作業を短縮することができ、効率よく戸締りを行うことができる。

### 今後の展望
LINE Clovaはトリガーとなる発話がないとスキルを起動しても数秒で落ちてしまう。そのため、人の接近を感知してトリガーとなる発話を他のスピーカから音声を流すことでスキルを起動させるのが良い。人の接近はセンサを用いて実装できる
声紋認証など、個々では完成しているが、全体の統合がうまくいっていない。
不審者の出現を写真として管理者や、社員のLINEへ通知するような拡張機能を追加することができる。
誰が建物内にいるかなどが明確にわかるようになると、家に人がいるかどうかを調べられ、防犯、洗濯物の取り込みなどへ応用できる。


## 開発内容・開発技術

* 機械学習を用いた顔画像からの個人識別技術とそのアプリケーション
* 新しいユーザを追加し再学習するアプリケーションの開発
* 機械学習を用いた音声からの個人識別技術とそのアプリケーション
* 動画からの人の移動方向ベクトルの取得と、入退室検出システムへの応用
* ユーザ登録、入退室履歴の参照等可能な管理者向けwebアプリケーション開発
* webアプリケーションとLINEClova、LINEbotの連携アプリケーション


### 活用した技術
ニューラルネットワーク
Optical Flow
顔画像認識(カスケード分類器)
オブジェクト抽出(YOLO)
サポートベクターマシン

#### API・データ
今回スポンサーから提供されたAPI、製品などの外部技術があれば記述をして下さい。

*LINE Clova
*LINE BOT


#### フレームワーク・ライブラリ・モジュール
* Opencv
* Keras
* Scikit-learnn
* Ruby on Rails

#### デバイス
* Clova
* USBカメラ
* スピーカー
