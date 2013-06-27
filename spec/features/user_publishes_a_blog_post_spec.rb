require 'spec_helper'

describe 'a user publishes a blog post' do

  let!(:published_post) { FactoryGirl.create(:post, state: 'published')}
  let!(:drafted_post) { FactoryGirl.create(:post, state: 'drafted')}

  it 'only displays published blog posts' do
    visit posts_path
    expect(page).to     have_content published_post.title
    expect(page).to_not have_content drafted_post.title
  end

  it 'allows a user to publish a post' do
    visit posts_path
    expect(page).to_not have_content drafted_post.title

    visit post_path(drafted_post)
    click_on 'Publish!'

    visit posts_path
    expect(page).to have_content drafted_post.title
  end

end
