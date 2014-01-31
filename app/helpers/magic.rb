helpers do

  def current_card
    Card.find(session[:cards][session[:num]])
  end

end
