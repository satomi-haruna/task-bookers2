class UsersController < ApplicationController
  def show
    @user = User.new
    @books = @user.books
    # ↑　userに紐づいているbookがすべて取得、カラムを特定できないので、カラムの操作はできない
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end


  private

  def user_params
    params.require(:user).permit(:name,:profile_image)
  end


end
