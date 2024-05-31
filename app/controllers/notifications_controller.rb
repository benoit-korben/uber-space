class NotificationsController < ApplicationController
  def update
    @notification = Notification.find(params[:id])
    @notification.update(read: true)
    redirect_to dashboards_path
  end
end
