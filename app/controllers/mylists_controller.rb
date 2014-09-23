class MylistsController < ApplicationController
  before_action :set_mylist, only: [:show, :edit, :update, :destroy]

  # GET /mylists
  # GET /mylists.json
  def index
    @mylists = Mylist.all
    render @mylists
  end

  # GET /mylists/1
  # GET /mylists/1.json
  def show
  end

  # POST /mylists
  # POST /mylists.json
  def create
    @mylist = Mylist.new(mylist_params)

    if @mylist.save
      render json: @mylist
    else
      render json: @mylist.errors, status: :unprocessable_entity
    end
  end

  private
    def set_mylist
      @mylist = Mylist.find(params[:id])
    end

    def mylist_params
      params.require(:mylist).permit(:title, :mylist_id, :description)
    end
end
