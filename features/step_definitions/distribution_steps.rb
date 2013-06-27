Then /^I should see the distribution information on the information page$/ do
  version_file = Rails.root.to_s + "/config/RELEASE_VERSION"
  File.open(version_file, 'w') {|f| f.write("3.0.0") }
  page.should have_content('Information')
  click_link("Information")
  File.delete(version_file)
  page.should have_content('Distribution')
  page.should have_content('Version 3.0.0')
  page.should have_content('Last update no release date')
end
