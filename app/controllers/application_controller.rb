class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_question

  private

  def set_question
    @question = Question.new
  end
end
