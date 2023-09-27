require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  # image url
  include Rails.application.routes.url_helpers
  before(:each) do
    @post = assign(:post, FactoryBot.create(:post))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{Regexp.escape(@post[:title])}/)
    expect(rendered).to match(/#{Regexp.escape(@post[:content])}/)
  end

  it "renders the post image" do
    render
    assert_select "img[src=?]", rails_blob_path(@post.image, only_path: true), count: 1
  end
end
