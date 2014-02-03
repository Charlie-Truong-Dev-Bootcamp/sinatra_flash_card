helpers do

  def current_card
    Card.find(session[:cards][session[:num]])
  end

  def feedback_display(feedback, answer)
    case feedback
      when 1 then "Correct!"
      when 0 then "You were lazy and skipped the question!"
      when -1 then "Incorrect.  The answer was #{@answer}"
    end
  end

end
