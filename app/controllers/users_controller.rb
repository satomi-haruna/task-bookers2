class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # ページネーション　1ページ分の数だけデータを取得する
    @books = @user.books.page(params[:page])
    # ↑　userに紐づいているbookがすべて取得、カラムを特定できないので、カラムの操作はできない
    # 部分テンプレートのためにbook/index同様に記述
    @book_new = Book.new
  end

  # Usersの表示のためindexを作成
  def index
    # ページネーション　すべてのデータではなく1ページ分の数のデータだけ取得する
    @users = User.page(params[:page])
    # 部分テンプレートのためにbook/index同様に記述
    @book_new = Book.new
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user)
    end
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
