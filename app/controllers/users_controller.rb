class UsersController < ApplicationController
  before_action :get_user_types
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
        redirect_to admin_users_path, notice: "User succesfully created!" 
    else
        render :new
    end
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if params[:user][:password].blank?
	  params[:user].delete(:password)
	end
    if @user.update_attributes(user_params)
      redirect_to admin_users_path, notice: "Updated User."
    else
      render :edit
    end
  end

  def destroy
  	@user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :rut, :email, :position, :rol, :password)
  end
  def get_user_types
    @user_types = ['Director','TI','Secretaría','Funcionario','Temporal']
  end
end
