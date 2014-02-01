post "/guess" do
  content_type :json
  guesses = JSON.parse(params[:data],:symbolize_names=>true)
  Guess.add_guesses(guesses, session[:round_id])
  {redirect: "/stats"}.to_json
end