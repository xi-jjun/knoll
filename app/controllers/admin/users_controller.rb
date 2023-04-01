class Admin::UsersController < ApplicationController
  before_action :authenticate_staff!

  layout 'admin_application'

  def index
    @users = User.all
  end
end

