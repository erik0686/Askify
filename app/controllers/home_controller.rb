class HomeController < ApplicationController
    def index
      @questions = Question.all
      @posts = Post.all
    end
end
