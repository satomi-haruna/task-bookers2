class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  #投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
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
      redirect_to book_path(@book.id)
    else
      render :edit
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
