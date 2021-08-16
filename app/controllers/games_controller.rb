require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = [*'A'..'Z'].sample(10)
  end

  def score
    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    word = URI.open(url).read
    user = JSON.parse(word)

    if user["found"] == true
      @score = "Congratulations, #{params[:word]} is a valid word!"
    else
      @score = 'This is not a valid word.'
    end
  end
end

# 1. create random array of letters
# 2. create a form and post to score action
# 3. use api to check if word is valid
# 4.
