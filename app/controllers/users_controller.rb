class UsersController < ApplicationController
  def show
    @user =User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    @book = Book.new
  end

  def view
  end

  def create
    @user_image = UserImage.new(user_image_params)
    @user_image.user_id = current_user.id
    @user_image.save
    redirect_to user_images_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
