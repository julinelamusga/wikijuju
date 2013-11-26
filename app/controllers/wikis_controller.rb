class WikisController < ApplicationController
  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new(params[:wiki])
    if @wiki.save
      flash[:notice] = "Your JuJu was saved."
      redirect_to @wiki
    else
      flash.now[:error] = "There was an error saving your JuJu."
      render :new
    end
  end

  def show
    @wiki = Wiki.find(params[:id])
    @pages = Page.where(wiki_id: params[:id])
  end

  def index
    @wikis = Wiki.all
  end
end