class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :set_question, :get_categories, :set_category
  before_action :set_vars

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :major, :user_name, :student_id, :birth_date])
  end

  private

  def set_vars
    @question = Question.new
    @categories = Category.all
    @category = Category.new
    @category.id = 5
  end

  # def set_question
  #   @question = Question.new
  # end

  # def get_categories
  #   @categories = Category.all
  # end

  # def set_category
  #   @category = Category.new
  # end

  # def set_new_question_category (category)
  #   # produit_id = params[:category]
  #   binding.pry
  # end
end



  