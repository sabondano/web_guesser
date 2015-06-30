require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params["guess"]
  message, background = check_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message, :background => background}
end

def check_guess(guess)
  if guess == nil
    ["Choose a number between 0 - 99!", "#FFFFFF"]
  elsif (guess.to_i + 5) < SECRET_NUMBER
    ["Way too low!", "#FF0000"]
  elsif guess.to_i < SECRET_NUMBER
    ["Too Low!", "#FF9999"]
  elsif (guess.to_i - 5) > SECRET_NUMBER
    ["Way too high!", "#FF0000"]
  elsif guess.to_i > SECRET_NUMBER
    ["Too high!", "#FF9999"]
  elsif guess.to_i == SECRET_NUMBER
    ["You got it right! The SECRET NUMBER is #{SECRET_NUMBER}", "#008000"]
  end
end
