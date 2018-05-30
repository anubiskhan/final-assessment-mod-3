require 'rails_helper'

describe Play do
  context "Instance methods" do
    context "#score_word" do
      it "scores the word" do
        the_play = create(:play, word: "assess")
        expect(the_play.score).to eq(6)
      end
    end
  end
end
