post '/sign_in' do
  attempted_user = User.where('username = ?', params[:user])[0]
  if attempted_user == nil
    redirect '/'
  elsif attempted_user.password != params[:password]
    redirect '/'
  else
    attempted_user.password == params[:password]
    session[:user_id] = attempted_user.id

    get_set_ip_and_address_in_sessions

    redirect '/decks#download'
  end
end
