require 'json'

class Game < ApplicationRecord
  belongs_to :player_1, class_name: "User", foreign_key: :player_1_id
  belongs_to :player_2, class_name: "User", foreign_key: :player_2_id

  has_many :plays

  def game_stats
    player1 = User.find(self.player_1_id)
    player2 = User.find(self.player_2_id)
    stats = {"game_id": self.id ,"scores": [{"user_id": player1.id ,"score": player1.user_score},{"user_id": player2.id,"score": player2.user_score}] }
  end
end
