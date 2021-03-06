コード銀行：3年C組の成績表
====

使用例

`./academic_results.utf8.rb`


## 解答
[academic_results.utf8.rb.txt](academic_results.utf8.rb.txt) を参照してください。


## 問題文
###【問題】

愛求中学校の3年C組で、実力テストを行いました。国語・数学・英語・社会・理科5科目の採点結果が、CSVファイルに保存されています。このファイルを読み込み、個々の生徒について、科目ごとの順位と、5科目合計点の順位をそれぞれ算出し、結果をCSVファイルとして出力するプログラムを書いてください。
###【問題の詳細】

####順位づけの方法

点数が高い順に、1, 2, ...と順位をつけるだけですが、同じ得点が2人以上の場合は同じ順位になり、それより下の点数は順位がずれていきます。

たとえば、80点が5位で2人いたとすると、79点の人は6位ではなく7位になります。80点が3人いれば、8位になります。

####csvファイルについて

csvファイルの文字コードはShift_JIS、改行コードはCR+LFになっています。

出力データに関しては、文字コード・改行コードの指定は特にありません。

####出力データの項目名

国語・数学・英語・社会・理科の順位に加えて、合計点の順位も出力することになりますので、1行目の項目名に「合計」を追加してください。

####その他

本問の記述に関してあいまいな部分があると判断した場合は、どのように解釈・対応したかを、ソースコード内にコメントとして記述してください。

####テストデータ

[seiseki.zip]をダウンロード、展開すると、以下のファイルが含まれています。
sample_input.csv

sample_output.csv

サンプルのデータです。まずは、sample_input.csvを読み込んで、sample_output.csvの内容と完全に一致するデータを出力できるようにしましょう。
class_3c_input.csv

採点時には、このファイルを入力データとして使用します。提出前にこのデータを使って確認してみてください。

###【解答方法】

プログラムのソースコードを、テキストファイルとしてアップロードしてください。

また、ソースコードのコメントとして、次の3点を記入してください。

1・2は必須、3は任意です。記入漏れ、提出形式が指定と異なる場合は、評価が低くなります。
[必須] 1. 使用言語・動作環境

コンパイラ／インタプリタの名称・バージョン情報を必ず記入してください。
[必須] 2. プログラムの特長・工夫した点等、アピールポイント

あなたが書いたコードの内容や工夫した点をわかりやすく説明してください。
[任意] 3. もし企業からのスカウトメールがきたらどのくらい積極的にアクションすると思いますか？

「積極的に会ってみたいと思う」「社名や条件次第では会ってみたいと思う」「よほどのことがない限り返信しない」、他ありましたら記入してください。

※企業からスカウトがきたら困る人は挑戦しないでください。



## 【出題URL】
[https://codeiq.jp/q/712](https://codeiq.jp/q/712)

## Author
[MotokiMiyahara](https://github.com/MotokiMiyahara/)


