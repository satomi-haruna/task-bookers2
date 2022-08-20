class UsersController < ApplicationController
  def show
    @user = User.new
    @books = @user.books
    # ↑　userに紐づいているbookがすべて取得、カラムを特定できないので、カラムの操作はできない
  end

  def edit
  end
end
