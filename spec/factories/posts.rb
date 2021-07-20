FactoryBot.define do
  factory :post do
    content {Faker::Lorem.characters(number:10)} # 投稿内容がランダムで制限ギリギリの文字数
  end
end

# FactoryBot テスト用データの作成をサポートするgem
# (buildメソッド: DBに登録する前で止めて、未保存のオブジェクトを得られる。メモリ上にインスタンスを確保する。DBにアクセスする必要があるテストのときは使えない。)
# (createメソッド: DB上にインスタンスを永続化する。DB上にデータを作成する。DBにアクセスする処理のときは必須。)

# Faker ダミーデータを作成できるgem(factory Botを用いてspec用のダミーデータを作れる)
# 今回はランダムな文字１０文字でダミーテキストを生成しているが、他にもたくさんある