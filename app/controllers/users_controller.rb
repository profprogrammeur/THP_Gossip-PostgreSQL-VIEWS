class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def create
    puts "€" * 30
    puts "PARAMS"
    puts params
    puts "€" * 30

    @user = User.new(
                   city_id: params[:ville], #ACHTUNG undefined condition
                   email: params[:email],
                   password: params[:password],
                   first_name: params[:first_name],
                   last_name: params[:last_name],
                   description: params[:description],
                   age: params[:age])
    if @user.save
      flash[:success] = "Compte crée !"
      # redirect_to sessions_new_path
      redirect_to root_path
      session[:user_id] = @user.id

    else 
      render "new"
    end

  end 

end
