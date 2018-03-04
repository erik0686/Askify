module ApplicationHelper
  def question_timestamp(question)
    if question.answers.count > 0 
      "Answered by " + question.answers.last.user.first_name + " " + 
      question.answers.last.user.last_name + " about " +
      time_ago_in_words(question.answers.last.created_at) + " ago"
    else
      "Asked by " + question.user.first_name + " " + question.user.last_name + " about " +
      time_ago_in_words(question.created_at) + " ago"
    end
  end
end
