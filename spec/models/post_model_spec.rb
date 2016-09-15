require "rails_helper"

RSpec.describe Post, type: :model do
  describe ".create" do
    it "create Post" do
      post = Post.create!(title: "test", body: "test_test")
      #expect (Post.count).should eq(1)
    end
  end
end