class WikisController < ApplicationController

  def new
    @wiki = Wiki.new
    check_create_auth(@wiki)
  end

  def create
    @wiki = Wiki.new(params[:wiki])
    check_create_auth(@wiki)
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
    check_show_auth(@wiki)
    @pages = @wiki.pages
  end

  def index
    @wikis = Wiki.all_public
  end

  def check_create_auth(wiki)
    authorize wiki
  rescue
    flash[:error] = "Sign in or sign up to continue."
    redirect_to :new_user_session
  end

  def check_show_auth(wiki)
    authorize wiki
  rescue
    if current_user
      flash[:error] = "You are not authorized to view this JuJu."
      redirect_to :root
    else
      flash[:error] = "Sign in or sign up to continue."
      redirect_to :new_user_session
    end
  end
end