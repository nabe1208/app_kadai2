class BooksController < ApplicationController

  def new
  end

  def index # 一覧・新規投稿
    @books = Book.all.order("id")
    @book = Book.new
  end

  def create #viewいらず
    @book = Book.new(book_params) # viewへ受渡不要のため@はなし
    if @book.save
     redirect_to book_path(@book.id), notice: "Book was successfully created" # showで入力内容を直接確認できる。
    else
      @books = Book.all
      render :index# コントローラ内の別アクションを表示
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])  # idを探す
    if @book.update(book_params)       # 更新
     redirect_to book_path(@book.id), notice: "Book was successfully updated" # 詳細画面へ
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to "/books", notice: "Book was successfully destroyed."
  end

  # 以下controller内のみ動作+ストロングパラメータ
  private

  def book_params # paramsに一時保存
    params.require(:book).permit(:title, :body)
  end

end
