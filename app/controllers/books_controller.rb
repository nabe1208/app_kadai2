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
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])  # idを探す
    book.update(book_params)       # 更新
    redirect_to book_path(book.id) # 詳細画面へ
  end

  def destroy
  end

  # 以下controller内のみ動作+ストロングパラメータ
  private

  def book_params # paramsに一時保存
    params.require(:book).permit(:title, :body)
  end

end
