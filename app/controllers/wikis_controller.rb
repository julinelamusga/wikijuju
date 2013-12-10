class WikisController < ApplicationController

  before_filter :authenticate_user!, only: [:create, :new]

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new(params[:wiki])
    @wiki.user = current_user
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
    authenticate_user! if @wiki.premium
    authorize @wiki
    @pages = @wiki.pages
    if request.path != wiki_path(@wiki)
      redirect_to @wiki, status: :moved_permanently
    end
  end

  def index
    @wikis = Wiki.all_public
  end
  
end