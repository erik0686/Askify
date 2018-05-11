class CategoriesController < ApplicationController
skip_before_action :verify_authenticity_token

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def show
    @category = Category.find(params[:id])
    @topic = Topic.new
  end

  def create_topic
    @topic = Topic.new(topic_params)
    @topic.save
    redirect_to category_path(@topic.category_id)
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to categories_path
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:category_name)
  end

  def topic_params
    params.require(:topic).permit(:topic_name, :description, :is_official, :user_id, :category_id)
  end
end
