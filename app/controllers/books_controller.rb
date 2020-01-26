class BooksController < ApplicationController
  def index
    @books =Book.all
  	@book =Book.new
  end

  def show
    @book =Book.find(params[:id])
    
  end


  def edit
    @book =Book.find(params[:id])
  end

  def update
    @book =Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id), :notice => 'You have updated book successfully'
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

  def destroy
    @book =Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

private
  def book_params
    params.require(:book).permit(:title, :body)
  end

    def user_params
      params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
