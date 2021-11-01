class GossipController < ApplicationController
  def home
    @gossips=Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:gossip_id])
  end
end
