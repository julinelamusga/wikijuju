class PagesController < ApplicationController
  def new
    @page = Page.new
  end

  def create
    @page = Page.new(params[:page])
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
