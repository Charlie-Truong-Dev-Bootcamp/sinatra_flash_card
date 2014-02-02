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
  

  get_set_ip_and_address_in_sessions

  new_user.save
  session[:user_id] = new_user.id
  redirect '/decks#download'
end
