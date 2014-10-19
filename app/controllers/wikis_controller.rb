class WikisController < ApplicationController
  before_filter :set_wiki, only: [:show, :edit, :update, :destroy]
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
    @wiki.save
    respond_with(@wiki)
  end

  def update
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

  
end


