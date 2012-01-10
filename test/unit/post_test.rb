require 'test_helper'

class PostTest < ActiveSupport::TestCase

  test "Post's content should be empty" do
    assert_equal("",Post.new(:content => "Content content tnetnoc").clear_post)
  end

end
