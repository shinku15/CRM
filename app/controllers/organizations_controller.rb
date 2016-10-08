class OrganizationsController < ApplicationController
  def index
    @organization = current_user.organization
    @tasks = @organization.tasks.includes(:company)
    @opt = [{"name"=>"All", "id"=>"001"},{"name"=>"Overdue", "id"=>"002"}, {"name"=>"today", "id"=>"003"},
            {"name"=>"Tomorrow", "id"=>"004"}]

    @tasks = @tasks.where(is_completed: "f").all if params[:option]=="001"
    @tasks = @tasks.where(is_completed: "f").where("date(completed_on)< ?",Date.today) if params[:option]=="002"
    @tasks = @tasks.where(is_completed: "f").where("date(completed_on)= ?", Date.today) if params[:option]=="003"
    @tasks = @tasks.where(is_completed: "f").where("date(completed_on)= ?",Date.tomorrow) if params[:option]=="004"


    @opt1 = [{"name"=>"All", "id"=>"001"},{"name"=>"Today", "id"=>"002"},{"name"=>"yesterday", "id"=>"003"},
         {"name"=>"Earlier", "id"=>"004"}]

    @tasks = @tasks.where(is_completed: "t").all if params[:option1]=="001"
    @tasks = @tasks.where(is_completed: "t").where("date(completed_at)= ?", Date.today) if params[:option1]=="002"
    @tasks = @tasks.where(is_completed: "t").where("date(completed_at)= ?", Date.yesterday) if params[:option1]=="003"
    @tasks = @tasks.where(is_completed: "t").where("date(completed_at)< ?",Date.today) if params[:option1]=="004"


    @opt2 = @organization.users
    var = params[:option2] if params[:option2].present?

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
