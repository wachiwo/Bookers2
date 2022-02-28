class UsersController < ApplicationController
before_action :correct_user, only: [:edit]

  def new
    @user = User.new

  end


  def index
    @users = User.all
    @book = Book.new
    @user = current_user
    @books = Book.all
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.where(user_id: @user.id)
  end

  def edit
   
    @user = User.find(params[:id]) #もともとこれだけ
    
  end
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:update] = 'You have updated user successfully.'
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
   private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  def correct_user
    @user = User.find(params[:id])
    
    redirect_to user_path(current_user.id) unless @user == current_user
  end
end
