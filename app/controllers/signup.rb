require 'rubygems'
require 'json'
require 'net/http'
require 'open-uri'

get '/signup' do
  erb :signup
end

post '/signup' do
  new_user = User.new(username: params[:user],
    password: params[:password])
  session[:username] = new_user[:username]

  get_set_ip_and_address_in_sessions

  new_user.save
  redirect '/decks'
end
