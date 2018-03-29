# Home controller
class HomeController < ApplicationController
  def index
    @q1 = Question.ransack(params[:q])
    @questions = @q1.result(distinct: true)
    @q2 = Post.ransack(params[:q])
    @posts = @q2.result(distinct: true)
  end
end
