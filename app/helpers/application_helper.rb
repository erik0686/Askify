module ApplicationHelper
<<<<<<< HEAD

    def profileCardMaker(title, data)
        data = '<p class="lead showing">
        <h5 class="showing">' + title + '</h5>
        <div class="card showing">
            <div class="card-body">' + data + '</div>
        </div>
        <p>'
        data.html_safe
    end

    def profileEditableCardMaker(title, data)
        data = '<p class="lead hidden">
        <h5 class="hidden">' + title + '</h5>
        <div class="card hidden">
            <div class="card-body">
                <div class="form-group editProfile">
                    <input type="text" class="form-control editProfile" value="' + data +'"placeholder="First Name">
                </div>
            </div>
        </div>
        <p>'
        data.html_safe
    end

=======
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
>>>>>>> 94ee0de71600a148566ae05552400800b4b67687
end
