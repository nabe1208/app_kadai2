class BooksController < ApplicationController

  def new
  end

  def index # 一覧・新規投稿
    @books = Book.all
    @book = Book.new
  end

  def create #viewいらず
    book = Book.new(book_params) # viewへ受渡不要のため@はなし
    book.save
    redirect_to book_path(book.id) # showで入力内容を直接確認できる。
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
  end

  # 以下controller内のみ動作+ストロングパラメータ
  private

  def book_params # paramsに一時保存
    params.require(:book).permit(:title, :body)
  end

end
