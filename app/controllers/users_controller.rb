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
    if @user.update(user_params)
      flash[:notice] = "You have updated successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end


end
