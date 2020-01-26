class UsersController < ApplicationController
  def index
    @book =Book.new
    @users =User.all
    @user = User.find(params[:id])
  end

  def show
    @books =Book.all
  	@user = User.find(params[:id])
    @book =Book.new
  end

def create
    @book = Book.new(book_params)
    if @book.save
    redirect_to book_path(@book.id), :notice => 'You have creatad book successfully.'

    else
      @books =Book.all
      render action: :index
  end
  end


  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	redirect_to user_path(@user.id)
  end

  private
  def user_params
  		params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end


end
