class CollaboratorsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user
      @wiki = Wiki.find(params[:wiki_id])
      if @user.collaborations.where(wiki_id: @wiki.id).present?
        flash.now[:error] = "That user is already a collaborator on this JuJu."
        render :new
      else
        @user.collaborations.create(wiki_id: @wiki.id)
        flash[:notice] = "Collaboration created successfully."
        redirect_to wiki_path(@wiki)
      end
    else
      flash.now[:error] = "No user with that email address could be found."
      render :new
    end
  end
end
