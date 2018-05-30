class WelcomeController < ApplicationController
  def index

  end

  def new
    @word = params[:q]
    conn = Faraday.new(url: "https://od-api.oxforddictionaries.com/api/v1/inflections/en/#{@word}")
    @resp = conn.get do |conn|
      conn.headers['app_id'] = ENV['OXFORD_ID']
      conn.headers['app_key'] = ENV['SCRABBLE_KEY']
    end
    @body = JSON.parse(@resp.body)

    if @body['results']
      @message = "'#{@body['results'][0]['id']}' is a valid word and its root form is '#{@body['results'][0]["lexicalEntries"][0]['inflectionOf'][0]['text']}'."
    else
      @message = "'foxez' is not a valid word."
    end
    binding.pry
  end
end
