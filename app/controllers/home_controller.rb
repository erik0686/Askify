# Home controller
class HomeController < ApplicationController
  before_action :set_search

  def set_search
    @q1=Question.search(params[:q])
    @q2=Post.search(params[:q])
  end
  
  def index
    @q1 = Question.ransack(params[:q])
    @questions = @q1.result(distinct: true)
    @q2 = Post.ransack(params[:q])
    @posts = @q2.result(distinct: true)
  end
end
