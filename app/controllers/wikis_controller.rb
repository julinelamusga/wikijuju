class WikisController < ApplicationController

  def new
    @wiki = Wiki.new
    check_auth(@wiki)
  end

  def create
    @wiki = Wiki.new(params[:wiki])
    check_auth(@wiki)
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
    if current_user && current_user.premium
      @wikis = Wiki.all
    else
      @wikis = Wiki.where(premium: false)
    end
  end

  def check_auth(wiki)
    authorize wiki
  rescue
    flash[:error] = "Create an account or sign in to create a JuJu."
    redirect_to :root
  end
end