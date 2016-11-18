require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @game = games(:g1)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Game.count' do
      post games_path, params: { game: { win: true } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Game.count' do
      delete game_path(@game)
    end
    assert_redirected_to login_url
  end
end
