require 'test_helper'

class PlayersFlowTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:john)
    @place = places(:the_park)
    sign_in_as(@user)
  end
  test "the ability for a signed in user to create a game" do
    get new_game_path
    assert_response :success 
    @game = Game.new(user_id: @user.id , address: @place.address )
    assert @game.save
    assert_response :success
    get game_path(@game)
    
    assert_response :success
  end
  
  test "The ability for a signed in player to see all the games 1 km near by" do 
    get root_path
    assert_response :success
    games_near_user_current_location = Game.near(@user.location , 20 , :units => :km)
  end
end
