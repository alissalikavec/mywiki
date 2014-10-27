class WikisController < ApplicationController
  before_filter :set_wiki, only: [:show, :edit, :update, :destroy]
  before_filter :authorize_user, only: [:destroy]
  before_filter :authenticate_user!, except: [:index, :show]
  
  respond_to :html, :xml, :json, :js

  def index
    @wikis = Wiki.all
    respond_with(@wikis)
  end

  def show
    respond_with(@wiki)
  end

  def new
    @wiki = Wiki.new
    respond_with(@wiki)
  end

  def edit
  end

  def create
    @wiki = Wiki.new(params[:wiki])
    @wiki.user = current_user
    @wiki.save
    respond_with(@wiki)
  end

  def update
    params[:wiki].merge!(last_edited_by: current_user.email)
    @wiki.update_attributes(params[:wiki])
    respond_with(@wiki)
  end

  def destroy
    @wiki.destroy
    respond_with(@wiki)
  end

  private
    def set_wiki
      @wiki = Wiki.find(params[:id])
    end

    def authorize_user
      set_wiki
      if @wiki.user != current_user
        redirect_to wikis_path, notice: "You can only delete wikis you have created. :("
      end
    end
end


