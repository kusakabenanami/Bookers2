class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  # 投稿データの保存
  def create
    @book = Book.new(post_image_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to post_images_path
  end

  def index
    @books = Book.page(params[:page])
  end

  def show
    @book = Book.find(params[:id])
    @book_comment = Book.new
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/Book'
  end

  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end
