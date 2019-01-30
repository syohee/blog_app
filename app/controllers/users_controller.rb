class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end
  
  def show 
    @favorites_blogs = @user.favorite_blogs
  end
  
  def edit
  end
  
  def update
    if @user.update_attributes(user_image)
      redirect_to user_path
    else
      render 'edit'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation,:image, :image_cache)
  end
  
  def user_image
    params.require(:user).permit(:image, :image_cache)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
end
