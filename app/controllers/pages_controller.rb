class PagesController < ApplicationController
  def new
    @page = Page.new
    @wiki = Wiki.find(params[:wiki_id])
  end

  def create
    pg = params[:page]
    @page = Page.new
    @page.title = pg[:title]
    @page.body = pg[:body]
    @page.wiki_id = pg[:wiki]
    @page.user_id = current_user.id
    if @page.save
      flash[:notice] = "Your page was saved."
      redirect_to @page
    else
      flash.now[:error] = "There was an error saving your page."
      render :new
    end
  end

  def show
    @page = Page.find(params[:id])
  end

  def index
    @pages = Page.all
  end
end
