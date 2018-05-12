class TopicsController < ApplicationController
  def index
    category_name = params[:category]
    if category_name.nil?
      @topics = Topic.all
    else
      category_id = Category.find_by(category_name: category_name)
      if category_id.nil?
        redirect_to topics_path
      else
        @topics = Topic.find_by(category_id: category_id)
      end
    end
  end

  def new
    @topic = Topic.new
  end

  def approve
    @topic = Topic.find(params[:id])
    @topic.approve!
    redirect_to user_path(@topic.user_id), notice: 'The topic has been approved'
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to topics_path
    else
      render 'new'
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end
  # show method
  # if has parameter q, filter results by query
  # else show all the current questions in topic
  def show
    @topic = Topic.find(params[:id])
    @q = @topic.questions.ransack(params[:q])
    @questions = @q.result(distinct: true)
    @is_search = false
    if params[:q].present?
        @is_search = true
    end
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update(topic_params)
      redirect_to topics_path
    else
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to user_path(current_user.id)
  end

  private

  def topic_params
    params.require(:topic).permit(:topic_name, :is_official)
  end
end
