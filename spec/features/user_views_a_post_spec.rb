require 'spec_helper'

feature "user views a post page", %q{
  As a User
  I want to view the page for a specific Post
  So that I can read all of the content for that Post
} do

  # Acceptance Criteria:
  # - I can see who wrote the Post
  # - I can see the Post's
  # - I can see the content of the Post that I am viewing

  let!(:post) { FactoryGirl.create(:post) }

  scenario "user views a Post from the archive" do
    visit root_path
    click_on post.title
    expect(page).to have_content post.title
    expect(page).to have_content post.author
    expect(page).to have_content post.content
  end
end
