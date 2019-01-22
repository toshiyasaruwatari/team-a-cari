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

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
