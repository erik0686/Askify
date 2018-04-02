class AnswerController < ApplicationController

  def index
    @answer = Answer.all
  end

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(@answer_params)
    @answer.question = Question.find(params[:question_id])
    @answer.save
    respond_to do |format|
      format.js
    end
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
    @answer.destroy
    redirect_to answers_path
  end

  private

  def answer_params
    params.require(:answer).permit(:answer_text)
  end
end
