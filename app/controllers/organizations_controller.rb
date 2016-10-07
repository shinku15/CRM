class OrganizationsController < ApplicationController
  def index
    @organization = current_user.organization
    @tasks = @organization.tasks.includes(:company)
    @opt = [{"name"=>"All", "id"=>"001"},{"name"=>"Due", "id"=>"002"}, {"name"=>"Completed", "id"=>"003"},
            {"name"=>"Today", "id"=>"004"},{"name"=>"Tomorrow", "id"=>"005"},{"name"=>"Yesterday", "id"=>"006"},
          {"name"=>"Overdue", "id"=>"007"}]

    #@tasks = @tasks.all if params[:option]=="001"
    @tasks = @tasks.where(is_completed: "f") if params[:option]=="002"
    @tasks = @tasks.where(is_completed: "t") if params[:option]=="003"
    @tasks = @tasks.where(completed_on: Date.today) if params[:option]=="004"
    @tasks = @tasks.where("completed_on = ?",Date.tomorrow) if params[:option]=="005"
    @tasks = @tasks.where("completed_on = ?", Date.yesterday) if params[:option]=="006"
    @tasks = @tasks.where("completed_on < ?",Date.today).where(is_completed: "f") if params[:option]=="007"

    respond_to do |format|
      format.js
      format.html
    end

  end
end
