class Admin::WelcomeController < ApplicationController
  before_action :authenticate_staff!

  layout 'admin_application'

  def index

  end
end
