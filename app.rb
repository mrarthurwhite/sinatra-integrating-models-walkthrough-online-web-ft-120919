require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    text_from_user = params[:user_text]

    @analyzed_text = TextAnalyzer.new(text_from_user)
    @letter_hash = @analyzed_text.most_used_letter
    @letter_key = @letter_hash.keys.first
    @letter = @letter_key.capitalize
    #binding.pry
    @letter_count = @letter_hash[@letter_key]
    erb :results
  end
end
