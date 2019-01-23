crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", "/h"
  parent :root
end

crumb :card do
  link "ログアウト", "/a"
  parent :mypage
end

crumb :card_add do
  link "支払方法", "/b"
  parent :mypage
end

crumb :detail do
  link "商品詳細ページ", "/c"
  parent :root
end

crumb :edit do
  link "本人情報の登録", "d"
  parent :mypage
end

crumb :identification do
  link "本人情報の入力", "e"
  parent :mypage
end

crumb :logout do
  link "ログアウト", "g"
  parent :mypage
end
