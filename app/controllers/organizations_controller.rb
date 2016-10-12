class OrganizationsController < ApplicationController
  def index
    @organization = current_user.organization
    @tasks = @organization.tasks.includes(:company)

    @tasks = @tasks.where(is_completed: false).all if params[:mode]=="due" && params[:day]=="all"
    @tasks = @tasks.where(is_completed: false).where("date(completed_at)< ?",Date.today) if params[:mode]=="due" && params[:day]=="overdue"
    @tasks = @tasks.where(is_completed: false).where("date(completed_at)= ?",Date.yesterday) if params[:mode]=="due" && params[:day]=="yesterday"
    @tasks = @tasks.where(is_completed: false).where("date(completed_at)= ?",Date.today) if params[:mode]=="due" && params[:day]=="today"
    @tasks = @tasks.where(is_completed: false).where("date(completed_at)= ?",Date.tomorrow) if params[:mode]=="due" && params[:day]=="tomorrow"

    @tasks = @tasks. where(is_completed: true).all if params[:mode]=="complete" && params[:day]=="all"
    @tasks = @tasks. where(is_completed: true). where("date(completed_on)< ?", Date.today) if params[:mode]=="complete" && params[:day]=="earlier"
    @tasks = @tasks. where(is_completed: true). where("date(completed_on)= ?", Date.yesterday) if params[:mode]=="complete" && params[:day]=="yesterday"
    @tasks = @tasks. where(is_completed: true). where("date(completed_on)= ?", Date.today) if params[:mode]=="complete" && params[:day]=="today"


    @opt2 = @organization.users
    var = params[:user] if params[:user].present?

    if var.nil?
      @tasks = @tasks.all
    else
      @tasks = @tasks.where("assign_to = ?",var)
    end

    respond_to do |format|
      format.js
      format.html
    end

  end
end
