require 'spec_helper'

describe Post do
  it { should validate_presence_of :title }
  it { should validate_presence_of :content }
  it { should validate_presence_of :author }
  it { should validate_presence_of :state }

  describe "scopes" do
    describe "published" do
      let!(:published_post) { FactoryGirl.create(:post, state: "published")}
      let!(:drafted_post) { FactoryGirl.create(:post, state: "drafted")}

      it "returns published posts" do
        expect(Post.published).to include published_post
      end

      it "doesnt return drafted posts" do
        expect(Post.published).not_to include drafted_post
      end
    end
  end
end
