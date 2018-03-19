 class UsersController < ApplicationController
  def show
  @user = User.find(params[:id])
  @user_questions = User.find(params[:id]).questions
  @questions = Question.all
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
      params.require(:user).permit(:email,:first_name,:last_name,:major,:user_name,:student_id,:birth_date)
    end
end
  

   