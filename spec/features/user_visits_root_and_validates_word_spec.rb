require 'rails_helper'

describe 'User' do
  describe 'visits root and enters a word to validate' do
    it 'validates as a real word' do
      # Feature:
      # As a guest user (no sign in necessary)

      # When I visit "/"
      visit '/'
      # And I fill in a text box with "foxes"
      fill_in 'q', with: 'foxes'
      # And I click "Validate Word"
      click_on 'Validate Word'
      # Then I should see a message that says "'foxes' is a valid word and its root form is 'fox'."
      expect(page).to have_content("'foxes' is a valid word and its root form is 'fox'.")
      #
    end

    xit 'invalidates due to not being a word' do
      # As a guest user
      # When I visit "/"
      visit '/'
      # And I fill in a text box with "foxez"
      fill_in 'q', with: 'foxez'
      # And I click "Validate Word"
      click_on 'Validate Word'
      # Then I should see a message that says "'foxez' is not a valid word."
      expect(page).to have_content("'foxez' is not a valid word.")
    end
  end
end

# Background:
# * This story should use the Oxford Dictionaries API https://developer.oxforddictionaries.com/documentation
# * Use endpoint "GET /inflections/{source_lang}/{word_id}" under the "Lemmatron" heading
#

# As a guest user
# When I visit "/"
# And I fill in a text box with "foxez"
# And I click "Validate Word"
# Then I should see a message that says "'foxez' is not a valid word."
