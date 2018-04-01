class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_vars
  
  def set_new_question_category
    category = Category.find_by(category_name: params[:category_name])
    session[:category_id] = category.id
    # @topics = @category.topics
  end

  def create_new_question
    # check that fields are not empty
    topic_id = Topic.find_by(topic_name: params[:topic_name]).id
    new_question = Question.new(question_text: params[:question_text], question_title: params[:question_title], topic_id: topic_id, user_id: current_user.id)
    new_question.save!
    redirect_to new_question
  end

  def set_topic_options
    # topics = @category.topics.all.order(:topic_name).where("lower(topic_name) like ?", "%#{params[:term]}%".downcase)
    topics = Category.find_by(id: session[:category_id]).topics.order(:topic_name).where("lower(topic_name) like ?", "%#{params[:term]}%".downcase)
    render json: topics.map(&:topic_name)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :major, :user_name, :student_id, :birth_date])
  end

  private

  def set_vars
    @categories = Category.all
  end

end



  