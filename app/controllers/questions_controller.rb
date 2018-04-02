# Questions controller
class QuestionsController < ApplicationController
  before_action :set_search

  def set_search
    @q1=Question.search(params[:q])
    @questions = Question.all
  end
  
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
    @question.answers.build
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to question_path
    else
      render 'new'
    end
  end

  def show
    @question = Question.find(params[:id])
    @question.answers.build
  end

  def edit
    @question = Question.find(params[:id])
    @question.answers.build
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to question_path
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:id, :question_title, :question_text, answers_attributes: [ :id, :answer_text, :question_id, :_destroy])
  end
end
