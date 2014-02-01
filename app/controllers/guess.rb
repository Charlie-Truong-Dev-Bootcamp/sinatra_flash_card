post "/guess" do
  Guess.add_guesses(session[:cards], session[:round_id], session[:correctness])
  redirect ('/stats')
end