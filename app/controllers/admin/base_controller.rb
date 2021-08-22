class Admin::BaseController < ApplicationController
  layout 'admin'

  before_action :require_admin

  private

  def require_admin
    unless current_user && current_user.role.name == 'admin'
      flash[:alert] = "You are not authorized for this action"
      redirect_to root_path
    end
  end
end
