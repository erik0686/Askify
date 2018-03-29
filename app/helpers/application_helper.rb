module ApplicationHelper

    def profileCardMaker(title, data)
        data = '<p class="lead showing">
        <h5 class="showing">' + title + '</h5>
        <div class="card showing">
            <div class="card-body">
                <div class="form-group editProfile">
                  <span class="form-control editProfile" >'+ data +'</span> 
                </div>
            </div>
        </div>
        <p>'
        data.html_safe
    end

    def profileEditableCardMaker(title, user, attribute)
        data = '<p class="lead hidden">
        <h5 class="hidden">' + title + '</h5>
        <div class="card hidden profile-input"> ' + 
            "#{ best_in_place user, attribute.to_sym, class: 'editable-fields'} "+ 
        '</div>
        <p>'
        data.html_safe
    end

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

  def user_question_timestamp(question)
    if question.answers.count > 0
      "Answered by " + question.answers.last.user.first_name + " " +
      question.answers.last.user.last_name + " about " +
      time_ago_in_words(question.answers.last.created_at) + " ago"
    else
      "Still not answered"
    end
  end

  def answer_timestamp(answer)
      "Answer posted about " +
      time_ago_in_words(answer.created_at) + " ago"
  end

  def question_answered_by_me_title(question, user)
    if my_answers(question,user).count > 0
      link_to question.question_title, question_path(question), class: "link-to-question"
    end
  end

  def my_answers(question, user)
    answer_array = []
    question.answers.each do |answer|
      if answer.user_id == user.id
        answer_array << answer
      end
    end
    answer_array
  end

  def question_answered_by_me?(question, user)
    my_answers(question,user).count > 0
  end

  def post_timestamp(post)
    time_ago_in_words(post.created_at) + " ago"
  end

end
