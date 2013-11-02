Given /^the following articles exist/ do |table|
  table.hashes.each do |article|
    Article.create!(article)
  end
end

Given /the following users exist/ do |table|
  table.hashes.each do |user|
    User.create!(user)
  end
end

When /^I visit the edit page for "(.*)"$/ do |article|
  a_id = Article.find_by_title(article).id
  visit 'admin/content/edit/' + a_id.to_s
end

When /^the current user is "(.*)"$/ do |username|
  visit '/accounts/login'
  fill_in 'user_login', :with => username
  fill_in 'user_password', :with => username + "123"
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end

When /^I merge with "(.*)"$/ do |article|
  fill_in 'merge_with', :with => Article.find_by_title(article).id
  click_button 'Merge'
end