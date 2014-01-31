helpers do

  def current_card
    Card.find(session[:cards][session[:num]])
  end

  def correct_answer
    "Correct!"
  end

  def skipped_answer
    "Hmmm .... you're being quite lazy you skipped!"
  end

  def wrong_answer
    "Whoops, not quite right! The answer you seek is #{find_a_card.answer}."
  end

end
