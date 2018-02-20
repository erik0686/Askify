class AnswerRatingsController < ApplicationController
    def index
        @answer_ratings = Answer_ratings.all
    end

    def new
        @answer_ratings = Answer_ratings.new
    end

    def create
        @answer_ratings = Answer_ratings.new(answer_ratings_params)
        if @answer_ratings.save
            redirect_to asnwer_rating_path
        else
            render 'new'
        end
    end

    def edit
        @answer_ratings = Answer_ratings.find(params[:id])
    end

    def update
        @answer_ratings = Answer_ratings.find(params[:id])
        if @answer_ratings.update(answer_ratings_params)
            redirect_to answer_ratings_path
        else
            render :edit
        end
    end

    def destroy
        @answer_ratings = Answer_ratings.find(params[:id])
        @answer_ratings.destroy
        redirect_to answer_ratings_path
    end

    private

    def answer_ratings_params
        params.require(:answer_ratings).permit(:rating)
    end
end
