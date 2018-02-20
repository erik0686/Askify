class AnswerController < ApplicationController

def index
    @answers = Answer.all
end

def new
    @answers = Answer.new
end

def create
    @answers = Answer.new(answer_params)
    if @answers.save
        redirect_to answer_path
    else
        render 'new'
    end
end

def edit
    @answers = Answer.find(params[:id])
end

def update
    @answers = Answer.find(params[:id])
    if @answers.update(answers_params)
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
