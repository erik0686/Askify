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
    @posts = @q2.result(distinct: true).by_date_desc

    @post = Post.new
  end

  def create_post
    @post = Post.new(post_params)
    @post.save
    redirect_to home_index_path
  end

  private

  def post_params
    params.require(:post).permit(:post_content, :expiry_date, :avatar, :user_id)
  end
end
