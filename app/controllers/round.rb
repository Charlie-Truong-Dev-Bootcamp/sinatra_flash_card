get "/round/:deck_id" do
  session[:round_id] = Round.create(user_id: session[:user_id]).id
  erb :rounds
end




