class Validation
  def initialize(word)
    @word = word
    validates_word
  end

  def validates_word
    conn = Faraday.new(url: 'https://od-api.oxforddictionaries.com/api/v1', headers: { app_id: '1147b3aa', app_key: 'adcf4ea870f603c0a5c507a901ab4f45' })
    response = conn.get "/inflections/en/#{@word}"
    binding.pry
  end
end
