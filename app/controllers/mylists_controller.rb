class MylistsController < ApplicationController
  protect_from_forgery except: :create

  # GET /mylists
  # GET /mylists.json
  def index
    @mylists = Mylist.all
    @status = "ok"
    @message = ""
    render :json, template: "mylists/index.json.jbuilder"
  end

  # GET /mylists/1
  # GET /mylists/1.json
  def show
    render :json, template: "mylists/show.json.jbuilder"
  end

  # POST /mylists
  # POST /mylists.json
  def create
    @posted = Mylists.new(mylists_params)

    if @posted.save
      @status = "ok"
      @message = ""
    else
      @status = "error"
      @message = @posted.errors
    end

    render :json, template: "mylists/create.json.jbuilder"
  end

  def latest
    @mylist = Mylist.last(1).first
    @status = "ok"
    @message = ""
    render :json, template: "mylists/show.json.jbuilder"
  end

  private
    def mylists_params
      params.require("mylists").map {|item| item.permit(["title", "mylist_id", "description"]) }
    end
end
