class User < ApplicationRecord
  has_many :plays

  def user_score
    plays.sum do |play|
      play.score
    end
  end
end
