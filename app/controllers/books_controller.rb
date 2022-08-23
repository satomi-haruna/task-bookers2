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
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def index
    # ページネーション　すべてのデータではなく1ページ分の数のデータだけ取得する
    @books = Book.page(params[:page])
    @book = Book.new
    # userはログインユーザーを取得したい
    @user = User.find(params[:id])
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
    params.require(:book).permit(:title,:opinion)
  end

end
