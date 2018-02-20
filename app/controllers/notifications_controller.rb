class NotificationsController < ApplicationController

  def index
    @Notifications = Notification.all
  end

  def new
    @Notification = Notification.new
  end

  def create
    @Notification = Notification.new(Notification_params)
    if @Notification.save
      redirect_to notifications_path
    else
      render 'new'
    end
  end

  def edit
    @Notification = Notification.find(params[:id])
  end

  def update
    @Notification = Notification.find(params[:id])
    if @Notification.update(Notification_params)
      redirect_to notifications_path
    else
      render :edit
    end
  end

  def destroy
    @Notification = Notification.find(params[:id])
    @Notification.destroy
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:notification).permit(:read, :notification_text, :notification_type)
  end
end