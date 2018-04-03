# Application helper
module ApplicationHelper
  def profileCardMaker(title, data)
    data = '<p class="lead showing">
    <h5 class="showing">' + title + '</h5>
    <div class="card showing">
        <div class="card-body">
            <div class="form-group editProfile">
              <span class="form-control editProfile" >' + data + '</span> 
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
        "#{ best_in_place user, attribute.to_sym, class: 'editable-fields profile'} "+ 
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
      link_to question.question_title, question_path(question), class: "link-to-question"
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
end