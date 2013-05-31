require 'spec_helper'

feature "user creates a new post", %q{
  As a User
  I want to create a new Post
  So that I can share my opinions with other readers
} do

  # Acceptance Criteria:
  # - I must specify a title
  # - I must specify some content
  # - I must specify an author

  let(:title) { "Awesome Post Title, DUDE" }
  let(:content) { "Superb content, this post has." }
  let(:author) { "Yoda" }

  scenario "user creates a post with valid attributes" do
    visit root_path
    click_on "Add Post"
    fill_in_form_with_valid_attributes
    click_on "Create Post"
    expect(page).to have_content "Post created successfully!"
  end

  scenario "user attempts to create a Post without valid attributes" do
    visit root_path
    click_on "Add Post"
    click_on "Create Post"
    expect(page).to have_content "You need to provide valid attributes!"
  end

  def fill_in_form_with_valid_attributes
    fill_in "Title", with: title
    fill_in "Author", with: author
    fill_in "Content", with: content
  end
end
