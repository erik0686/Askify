# Controller for users
class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @questions = Question.all
    @q = User.find(params[:id]).questions.ransack(params[:q])
    @user_questions = @q.result
    @categories = Category.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_questions }
    end
  end

  def search

  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :major, :user_name, :student_id, :birth_date, :avatar)
  end
end
