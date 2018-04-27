# Application helper
module ApplicationHelper
  def profileCardMaker(title, data)
    data = '
    <h5 class="showing static-field">' + title + '</h5>
    <div class="card showing static-field">
        <div class="card-body">
            <div class="form-group editProfile">
              <span class="form-control editProfile" >' + data + '</span>
            </div>
        </div>
    </div>'
    data.html_safe
  end

  def profileEditableCardMaker(title, user, attribute)
    data = '
    <h5 class="hidden editable-field question-tab-element">' + title + '</h5>
    <div class="card hidden profile-input editable-field question-tab-element"> ' +
        "#{ best_in_place user, attribute.to_sym, :as => :input, class: 'editable-fields question-tab-element'} "+
    '</div>'
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

  def question_show_timestamp(question)
    "Asked by " + question.user.first_name + " " + question.user.last_name + " about " +
      time_ago_in_words(question.created_at) + " ago"
  end

  def user_question_timestamp(question)
    if question.answers.count > 0
      "Answered by " + question.answers.last.user.first_name + " " +
      question.answers.last.user.last_name + " about " +
      time_ago_in_words(question.answers.last.created_at) + " ago"
    else
      'Still not answered'
    end
  end

  def answer_timestamp(answer)
    'Answer posted about ' +
    time_ago_in_words(answer.created_at) + ' ago'
  end

  def last_answer_timestamp(question)
    'Answer posted about ' +
    time_ago_in_words(question.answers.last.created_at) + ' ago'
  end

  def question_answered_by_me_title(question, user)
    if my_answers(question, user).count > 0
      link_to question.question_title, question_path(question), class: "link-to-question", style:"font-weight: bold;"
    end
  end

  def my_answers(question, user)
    answer_array = []
    question.answers.each do |answer|
      answer_array << answer if answer.user_id == user.id
    end
    answer_array
  end

  def question_answered_by_me?(question, user)
    my_answers(question, user).count > 0
  end

  def post_timestamp(post)
    time_ago_in_words(post.created_at) + ' ago'
  end

  # Method for removing fields
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end

# Method for Adding fields

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", form: builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end

  def link_to_function(name, *args, &block)
     html_options = args.extract_options!.symbolize_keys

     function = block_given? ? update_page(&block) : args[0] || ''
     onclick = "#{"#{html_options[:onclick]}; " if html_options[:onclick]}#{function}; return false;"
     href = html_options[:href] || '#'

     content_tag(:a, name, html_options.merge(:href => href, :onclick => onclick))
  end

  def my_questions_notifications
    count = current_user.questions.count
    count > 0 ? count : 0
  end

  def my_answers_notifications
    count = current_user.answers.count
    count > 0 ? count : 0
  end

  def my_total_notifications
    count = current_user.questions.count + current_user.answers.count
    count > 0 ? count : 0
  end

  def link_to_approve_topic(object, class_name = "")
      link_to t('Approve'), "/#{object.model_name.plural}/approve/#{object.id}", method: :patch, data: { confirm: t('confirm') }, class: class_name
  end

  def color_for_topic(topic)
    if topic.is_official
      "color#{topic.id%9}"
    else
      "color-gray"
    end
  end

end
