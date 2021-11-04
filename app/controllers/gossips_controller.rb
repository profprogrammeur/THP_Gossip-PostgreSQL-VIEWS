class GossipsController < ApplicationController

  before_action :authenticate_user, only: [:show, :new, :edit, :update, :create, :destroy]

  before_action :good_user, only: [:edit, :update, :destroy]

  def index
    @gossips=Gossip.all
    @users = User.all
  end

  def show
      @gossip = Gossip.find(params[:id])
      @user = User.find(@gossip.user_id)
  end
  
  def new
        @gossip=Gossip.new
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    gossip_params = params.require(:gossip).permit(:title, :content)
    @gossip.update(gossip_params)
    redirect_to action: "show"
  end

  def create
     @gossip= Gossip.new(title: params[:title], content: params[:content], user: current_user)
      if @gossip.save
        redirect_to gossip_path(@gossip.id)
        flash[:success] = "Bonne création"
      else
          render 'new'
      end
  end

  def destroy
     @gossip = Gossip.find(params[:id])
     puts "*" * 60
     @gossip.destroy
     puts "*" * 60
     redirect_to :action => "index"
  end


  private

  def authenticate_user
        unless session_en_cours?
          flash[:danger] = "Merci de vous connecter"
          redirect_to new_session_path
      end
    end 

    def gossip_params
      params.require(:gossip).permit(:title, :content)
    end

    def good_user
        if is_owner?(Gossip.find(params[:id]).user_id)
          flash[:success] = "Popotin bien modifier/supprimer"

        else flash[:danger] = "T'as pas le droit? T'as pas le droit. T'as pas le droiaaaaaaaaa!!!"
          redirect_to gossips_path
      end
    end 


end
