class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :set_question, :get_categories, :set_category
  before_action :set_vars

  def set_new_question_category
    @category = Category.find_by(category_name: params[:category_name])
    @topics = Topic.find_by(category_id: @category.id)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :major, :user_name, :student_id, :birth_date])
  end

  private

  def set_vars
    @question = Question.new
    @categories = Category.all
  end
  
  # def question_params
  #   params.require(:question).permit(:question_text)
  # end

  # def category_params
  #   params.require(:category).permit(:category_name)
  # end
end



  