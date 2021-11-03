class GossipsController < ApplicationController
  def index
    @gossips=Gossip.all
    @users = User.all
  end

  def show
    @gossip = Gossip.find(params[:id])
    @user = User.find(@gossip.user_id)
  end
  
  def new
    puts"////////////////////////////////////////////////"
    puts "GossipController => new"
    puts params
        puts"////////////////////////////////////////////////"
        # @gossip = Gossip
        @gossip=Gossip.new

  end

  def create
     puts"////////////////////////////////////////////////"
    puts "GossipController => create"
    puts params
     puts"////////////////////////////////////////////////"
     @gossip= Gossip.new(title: params[:title], content: params[:content], user: User.find(3))
      
     if @gossip.save
       redirect_to gossip_path(@gossip.id)
      flash[:success] = "Bonne création"
     else
        render 'new'
     end
     #  @gossip = Gossip.create(gossip_params)
    #  redirect_to gossips
     
    
  end

  # private
  #   def gossip_params
  #     params.require(:gossip).permit(:title, :content)
  #   end

end
