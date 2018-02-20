class CommentsController < ApplicationController
    def index
        @comment = Comment.all
    end

    def new
        @comment = Comment.new
    end

    def create
        @comment = Comment.new(comment_params)
        if @comment.save
            redirect_to comment_path
        else
            render 'new'
        end
    end

    def edit
        @comment = Comment.find(params[:id])
    end

    def update
        @comment = Comment.find(params[:id])
        if @comment.update(comment_params)
            redirect_to comment_path
        else
            render :edit
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to comment_path
    end

    private

    def  comment_params
        params.require(:comment).permit(:comment_text)

    end
end
