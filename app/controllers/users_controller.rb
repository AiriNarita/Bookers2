class UsersController < ApplicationController
  def index
    @book = Book.new
    @users = User.all
  end

  def show
    # @user = current_user
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
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

    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end


   private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
