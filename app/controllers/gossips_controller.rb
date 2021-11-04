class GossipsController < ApplicationController

  before_action :authenticate_user, only: [:show, :new, :edit, :update, :create, :destroy]


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

  def create
     @gossip= Gossip.new(title: params[:title], content: params[:content], user: current_user)
      
      if @gossip.save
        redirect_to gossip_path(@gossip.id)
        flash[:success] = "Bonne création"
      else
          render 'new'
      end
   
     #  @gossip = Gossip.create(gossip_params)
    #  redirect_to gossips
    
     
    
  end

  private

  def authenticate_user
        unless session_en_cours?
          flash[:danger] = "Merci de vous connecter"
          redirect_to new_session_path
      end
    end 

  #   def gossip_params
  #     params.require(:gossip).permit(:title, :content)
  #   end

end
