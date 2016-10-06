class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  # GET /notes
  # GET /notes.json
  def index
    @company = Company.find(params[:company_id])
    @notes = @company.notes
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
    @company = Company.find(params[:company_id])
    @note = Note.find(params[:id])
  end

  # GET /notes/new
  def new
    @user = current_user
    @organization = current_user.organization
    @company = Company.find(params[:company_id])
    @note = @company.notes.new

    respond_to do |format|
        format.html
        format.js
      end
  end

  # GET /notes/1/edit
  def edit
    @user = current_user
    @company = Company.find(params[:company_id])
    @note = Note.find(params[:id])
    @feed = Feed.where(feedable_type: "Note").where(feedable_id: @note.id)
    respond_to do |format|
        format.html
        format.js
      end

  end

  # POST /notes
  # POST /notes.json
  def create
    @user = current_user
    @organization_id = current_user.organization.id
    @company = Company.find(params[:company_id])
    @note = @company.notes.new(note_params)

    respond_to do |format|
      if @note.save
        @feed = @note.build_feed(organization_id: @organization_id, company_id: @company.id, content: @note.description)
        @feed.save
        format.html { redirect_to company_notes_path(@company, @note), notice: 'Note was successfully created.' }
        format.js
        format.json { render :show, status: :created, location: @note }

      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    @user = current_user
    @company = Company.find(params[:company_id])
    @note = Note.find(params[:id])
    @feed = @note.feed

    respond_to do |format|
      if @note.update_attributes(note_params)
        @feed.update_attributes(content: @note.description)
        format.html { redirect_to company_note_path(@company, @note), notice: 'Note was successfully updated.' }
        format.js
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @company = Company.find(params[:company_id])
    @note = Note.find(params[:id])
    @feed = @note.feed

    @note.destroy
    respond_to do |format|
      format.html { redirect_to company_notes_path(@company), notice: 'Note was successfully destroyed.' }
      format.js
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:description, :company_id, :user_id,:organization_id)
    end
end
