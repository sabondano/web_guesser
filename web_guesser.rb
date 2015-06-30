require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess.to_i)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message}
end

def check_guess(guess)
  if (guess + 5) < SECRET_NUMBER
    "Way too low!"
  elsif guess < SECRET_NUMBER
    "Too Low!"
  elsif (guess - 5) > SECRET_NUMBER
    "Way too high!"
  elsif guess > SECRET_NUMBER
    "Too high!"
  elsif guess == SECRET_NUMBER
    "You got it right! The SECRET NUMBER is #{SECRET_NUMBER}"
  end
end


