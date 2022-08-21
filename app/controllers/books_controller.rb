class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  #投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end


  def index
    # ページネーション　すべてのデータではなく1ページ分の数のデータだけ取得する
    @books = Book.page(params[:page])
  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end


  # ストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title,:body)
  end

end
