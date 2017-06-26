require 'test_helper'

class InvitationTest < ActiveSupport::TestCase
  setup do
    @user = users(:john)
    @place = places(:the_park)
    @game = games(:john_game)
    login_as(@user)
  end
  # test "Logged in user can't invite himself to a game he has created" do
  #   new_invitation = Invitation.new(game_id: @game.id , user_id: @user.id)
  #   assert_not new_invitation.save! ,  "You can't be inviting yourself to the same game"
  # end
end
