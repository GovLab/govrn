module QuestionsHelper
  def question_color(question)

    if question.positive
      hue = 207 # blue
    elsif question.negative
      hue = 348 # red
    else 
      hue = 47 # yellow
    end

    num_yes_votes = question.yes_votes.size
    num_no_votes = question.no_votes.size
    num_undecided_votes = question.undecided_votes.size
    total = question.responses.size

    # grey if margin is small, brighter as margin increases
    #saturation = ((num_yes_votes - num_no_votes).abs.to_f / (total / 2.0)) * 100
    if total > 0 
      saturation = (((question.majority_response - ((1/3.to_f)*total)) / ((2/3.to_f)*total)).to_f * 100).to_i
    else 
      saturation= 0
    end
    
    Color::HSL.new(hue, saturation, 50)
  end
end
