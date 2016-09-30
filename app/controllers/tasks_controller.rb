class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @organization = current_user.organization
    @users = @organization.users
    @company = Company.find(params[:company_id])
    @tasks = @company.tasks
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @organization = current_user.organization
    @users = @organization.users
    @company = Company.find(params[:company_id])
    @task = Task.find(params[:id])
  end

  # GET /tasks/new
  def new
   @organization = current_user.organization
   @users = @organization.users
   @user = current_user
   @company = Company.find(params[:company_id])
   @task = @company.tasks.new

   respond_to do |format|
        format.html 
        format.js
      end
  end

  # GET /tasks/1/edit
  def edit
    @organization = current_user.organization
    @users = @organization.users
    @user = current_user
    @company = Company.find(params[:company_id])
    @task = Task.find(params[:id])

    respond_to do |format|
        format.html 
        format.js
      end
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @organization = current_user.organization
    @users = @organization.users
    @user = current_user
    @company = Company.find(params[:company_id])
    @task = Task.new(task_params)
    # @task.assign_to = User.find(params[:task][:assign_to])

    respond_to do |format|
      if @task.save
        format.html { redirect_to company_task_path(@company, @task), notice: 'Task was successfully created.' }
        format.js
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    
    @organization = current_user.organization
    @users = @organization.users
    @user = current_user
    @company = Company.find(params[:company_id])
    @task = Task.find(params[:id])
    @feed = @task.feed


      respond_to do |format|
          if @task.update_attributes(task_params)
            
            if @feed
                  @feed.update_attributes(content: @task.description)
                else 
            end
                  format.html { redirect_to company_task_path(@company, @task), notice: 'Task was successfully updated.' }
                  format.js
                  format.json { render :show, status: :ok, location: @task }
            else
                    
                  format.html { render :edit }
                  format.js
                  format.json { render json: @task.errors, status: :unprocessable_entity }
          
            end
         end 
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @organization = current_user.organization
    @users = @organization.users
    @user = current_user
    @company = Company.find(params[:company_id])
    @task = Task.find(params[:id])
    @feed = @task.feed
    
    @task.destroy
    respond_to do |format|
      format.html { redirect_to company_tasks_path(@company), notice: 'Task was successfully destroyed.' }
      format.js
      format.json { head :no_content }
    end
  end

  def complete
    @organization = current_user.organization
    @user = current_user
    @company = Company.find(params[:company_id])
    @task = @company.tasks.find(params[:id])
    
    if @task.update_attributes(completed_at: Date.today, completed_by: current_user.id, is_completed: true) 
      @feed = @task.build_feed(organization_id: @organization.id, company_id: @company.id, content: @task.description)
      @feed.save
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:description, :company_id, :completed_on, :user_id, :assign_to, :is_completed)
    end
end
