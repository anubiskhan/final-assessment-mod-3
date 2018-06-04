class Validation
  attr_reader :message
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
    if @resp.body.include?('404 Not Found')
      @message = "'#{@word}' is not a valid word."
    else
      @body = JSON.parse(@resp.body)
      @message = "'#{@body['results'][0]['id']}' is a valid word and its root form is '#{@body['results'][0]["lexicalEntries"][0]['inflectionOf'][0]['text']}'."
    end
  end
end
