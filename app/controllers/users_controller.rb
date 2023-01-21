class UsersController < ApplicationController
  def index
  end

  def show
    # @user = current_user
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    
  end

  def update
  end
end
