class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # ページネーション　1ページ分の数だけデータを取得する
    @books = @user.books.page(params[:page])
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
