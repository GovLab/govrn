module QuestionsHelper
  def question_color(question)
    if question.positive
      hue = 360 # red
    else
      hue = 240 # blue
    end

    num_yes_votes = question.yes_votes.size
    num_no_votes = question.no_votes.size
    total = num_yes_votes + num_no_votes

    # grey if num_yes_votes == num_no_votes, brighter as margin increases in either direction
    saturation = ((num_yes_votes - num_no_votes).abs.to_f / (total / 2.0)) * 100

    Color::HSL.new(hue, saturation, 50)
  end
end
