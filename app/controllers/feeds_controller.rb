class FeedsController < ApplicationController
  def index
    @feeds = current_user.organization.feeds 
  end

end
