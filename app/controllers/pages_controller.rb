class PagesController < ApplicationController
  def new
    @page = Page.new
    @wiki = Wiki.find(params[:wiki_id])
  end

  def create
    @page = Page.new(params[:page])
    @wiki = Wiki.find(params[:wiki_id])
    @page.user_id = current_user.id
    @page.wiki = @wiki
    if @page.save
      flash[:notice] = "Your page was saved."
      redirect_to [@wiki, @page]
    else
      flash.now[:error] = "There was an error saving your page."
      render :new
    end
  end

  def show
    @wiki = Wiki.find(params[:wiki_id])
    @page = Page.find(params[:id])
  end
end
