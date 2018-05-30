class Validation
  def initialize(word)
    @word = word
    validates_word
  end

  def validates_word
    conn = Faraday.new(url: "https://od-api.oxforddictionaries.com/api/v1/inflections/en/#{@word}")
    @resp = conn.get do |conn|
      conn.headers['app_id'] = ENV['OXFORD_ID']
      conn.headers['app_key'] = ENV['SCRABBLE_KEY']
    end
  end
end
