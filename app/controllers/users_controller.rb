class UsersController < ApplicationController

  def index
  #no one should have a reason to access lists of users unless an admin
    unless current_user.admin?
      redirect_to :back
    end
  end

  def show
    if current_user.client?
      @user = User.find(params[:id])
    elsif current_user.technician?
      @technician = Technician.find(params[:id])
    end
  end

#new user
  def new
    @user = User.new
  end

#new technician need to check on whether Technician.new is correct
  def new_tech
    @salon_id = params[:id]
    @technician = Technician.new
  end

#create user
  def user_create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Thank you for Registering!'
      redirect_to @user
    else
      render 'new'
    end
  end

#create technician
  def create
    @technician = Technician.new(technician_params)
    if @technician.save
      flash[:success] = 'Thank you for Registering!'
      redirect_to @technician
    else
      render 'new'
    end
  end

  def edit
      @user = User.find(params:id)
  end



  def update
    @user = User.find(params[:id])
    if current_user.client?
      @user.update_attributes(user_params)
    elsif current_user.technician?
      @user.update_attributes(technician_params)
    else :edit
    end
  end

  def delete
    @user = User.find(params[:id])
    #do I need to log them out first so it doesn't conflict with the home page and say ID not found?
    @user.destroy
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:role, :name, :email, :password, :password_confirmation)
    end

    def technician_params
      params.require(:user).permit(:role, :name, :email, :password, :salon_id)
    end
end


