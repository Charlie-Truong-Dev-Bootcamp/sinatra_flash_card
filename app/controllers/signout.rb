get '/signout' do
  session.clear
  redirect '/'
end
