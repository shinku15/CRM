class StaticpagesController < ApplicationController
  def index
  end

  def show
    @user = current_user
  end
end
