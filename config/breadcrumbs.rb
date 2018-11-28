crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", user_mypage_path(current_user)
  parent :root
end

crumb :logout do
  link "ログアウト"
  parent :mypage
end


crumb :category do
  link "カテゴリー一覧", categories_path
  parent :root
end

crumb :category_list do |category|
  link "#{category.category_name}"
  parent :category
end




crumb :credit_card do
  link "支払い方法", credits_path(current_user)
  parent :mypage
end

crumb :credit_card_new do
  link "クレジットカード情報入力", new_credit_path
  parent :credit_card
end

crumb :address_edit do
  link "住所変更", new_user_path(current_user)
  parent :mypage
end




