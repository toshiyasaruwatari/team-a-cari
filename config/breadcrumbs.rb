crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", "/users/show"
  parent :root
end

crumb :card do
  link "ログアウト", "/users/:id/pay_way"
  parent :mypage
end

crumb :card_add do
  link "支払方法", "/users/:id/add_card"
  parent :mypage
end

crumb :detail do
  link "商品詳細ページ", "/items/show"
  parent :root
end

crumb :edit do
  link "本人情報の登録", "/users/:id/~"
  parent :mypage
end

crumb :identification do
  link "本人情報の入力", "/users/:id/identify"
  parent :mypage
end

crumb :logout do
  link "ログアウト", "/users/:id/logout"
  parent :mypage
end
