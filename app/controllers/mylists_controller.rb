class MylistsController < ApplicationController
  before_action :set_mylist, only: [:show, :edit, :update, :destroy]

  # GET /mylists
  # GET /mylists.json
  def index
    @mylists = Mylist.all
  end

  # GET /mylists/1
  # GET /mylists/1.json
  def show
  end

  # GET /mylists/new
  def new
    @mylist = Mylist.new
  end

  # GET /mylists/1/edit
  def edit
  end

  # POST /mylists
  # POST /mylists.json
  def create
    @mylist = Mylist.new(mylist_params)

    respond_to do |format|
      if @mylist.save
        format.json { render :show, status: :created, location: @mylist }
      else
        format.json { render json: @mylist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mylists/1
  # PATCH/PUT /mylists/1.json
  def update
    respond_to do |format|
      if @mylist.update(mylist_params)
        format.json { render :show, status: :ok, location: @mylist }
      else
        format.json { render json: @mylist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mylists/1
  # DELETE /mylists/1.json
  def destroy
    @mylist.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mylist
      @mylist = Mylist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mylist_params
      params.require(:mylist).permit(:title, :mylist_id, :description)
    end
end
