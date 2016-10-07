class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  # GET /companies
  # GET /companies.json
  def index
    @organization = current_user.organization
    @companies = @organization.companies
    @company = Company.new

    @companies = @companies.where(email: params[:email]) if params[:email].present?
    @companies = @companies.where(name: params[:name]) if params[:name].present?

    respond_to do |format|
        format.html
        format.js
      end  
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    @company = Company.find(params[:id])
    @feeds = @company.feeds
    @tasks = @company.tasks.where("is_completed = ?", false)
    @task = @company.tasks.new
    @note = @company.notes.new
    @user = current_user
    @users = @user.organization.users

    @opt = [{"name"=>"All", "id"=>"001"},{"name"=>"notes", "id"=>"002"}, {"name"=>"tasks", "id"=>"003"}]
    @feeds = @company.feeds if params[:option]=="001"
    @feeds = @company.feeds.where(feedable_type: "Note") if params[:option]=="002"
    @feeds = @company.feeds.where(feedable_type: "Task") if params[:option]=="003"

    respond_to do |format|
        format.html
        format.js
      end


  end

  # GET /companies/new
  def new
    @company = Company.new
    @company.mobile_numbers.new

    respond_to do |format|
        format.html
        format.js
      end
  end

  # GET /companies/1/edit
  def edit
    @company = Company.find(params[:id])
    respond_to do |format|
        format.html
        format.js
      end
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)

    @company.mobile_numbers.each do |t|
      t.company_id = @company.id
    end

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.js
        format.json { render :show, status: :created, location: @company }
      else
        puts '>>>>>>', @company.errors.inspect
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.js
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def feed_destroy

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :email, :address, :contact, :organization_id, mobile_numbers_attributes: [:id, :number, :_destroy])
    end
end
