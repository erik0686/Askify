class AnswersController < ApplicationController

  def index
    @answer = Answer.all
  end

  def new
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(params[:answer].permit(:answer_text, :question_id, :user_id))
    @answer.user_id = current_user.id
    @answer.save
    redirect_to question_path(@question)
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.update(answers_params)
      redirect_to answers_path
    else
      render :edit
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    question = @answer.question
    @answer.destroy
    redirect_to question_path(question)
  end

  private

  def answer_params
    params.require(:answer).permit(:answer_text)
  end
end
