class UsersController < ApplicationController
  def index
    @book = Book.new
    @users = User.all
  end

  def show
    # @user = current_user
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
     user_id = params[:id].to_i
      unless user_id == current_user.id
       redirect_to user_path(current_user)
      end
    
    @user = User.find(params[:id])

  end

  def update
    @user =User.find(params[:id])
    User.update (user_params)
    redirect_to user_path(@user)
  end


   private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
