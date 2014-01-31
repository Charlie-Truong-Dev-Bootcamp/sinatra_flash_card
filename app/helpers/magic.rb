helpers do

  def find_a_card
    Card.find(session[:cards][session[:num]])
  end

end
