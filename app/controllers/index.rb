enable :sessions

get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/sign_up' do
  erb :sign_up
end

post '/sign_in' do
  attempted_user = User.where('username = ?', params[:user])[0]
  if attempted_user == nil
    redirect '/'
  elsif attempted_user.password != params[:password]
    redirect '/'
  else
    attempted_user.password == params[:password]
    session[:username] = attempted_user[:username]
    redirect '/decks'
  end
end

post '/sign_up' do
  new_user = User.new(username: params[:user],
    password: params[:password])
  session[:username] = new_user[:username]
  new_user.save
  redirect '/decks'
end


