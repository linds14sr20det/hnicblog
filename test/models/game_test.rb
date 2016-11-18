require 'test_helper'

class GameTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @location = locations(:l1)
    # This code is not idiomatically correct.
    @game = Game.new(win: true, user_id: @user.id, location_id: @location.id)
  end

  test "should be valid" do
    assert @game.valid?
  end

  test "user id should be present" do
    @game.user_id = nil
    assert_not @game.valid?
  end

  test "location id should be present" do
    @game.location_id = nil
    assert_not @game.valid?
  end
end
