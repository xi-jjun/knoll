class Admin::UsersController < ApplicationController
  before_action :authenticate_staff!

  def index
    @users = User.all
  end
end

