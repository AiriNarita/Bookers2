class UsersController < ApplicationController
  def index
    @users = User.all

  end

  def show
    # @user = current_user
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
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
