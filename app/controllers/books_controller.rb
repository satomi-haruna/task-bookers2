class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  #投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to user_path(@book.user.id)
    else
      render :edit
    end
  end

  def index
    # ページネーション　すべてのデータではなく1ページ分の数のデータだけ取得する
    @books = Book.page(params[:page])
    @book_new = Book.new
    # bookからuser情報を取得したい、book/indexではログインユーザーを取得したい＝現在のユーザー
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(params[:id])
    @books = @user.books
    # 部分テンプレート用にindexで使用したものと同じものを定義
    @book_new = Book.new
    # @bookで持ってきた特定userの情報がほしい
    @user = @book.user
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end


  # ストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title,:opinion)
  end

end
