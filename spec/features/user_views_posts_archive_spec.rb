require 'spec_helper'

feature "user views post archive", %q{
  As a User
  I want to view an archive of all of the Posts
  So that I can choose which Post I want to view
} do

  # Acceptance Criteria:
  # - I see a list of post titles
  # - Each Post title links me to the page for that Post

  let!(:post1) { FactoryGirl.create(:post) }
  let!(:post2) { FactoryGirl.create(:post) }

  scenario "user sees all post titles" do
    visit root_path
    expect(page).to have_content post1.title
    expect(page).to have_content post2.title
  end
end
