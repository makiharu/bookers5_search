class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
  	@books = Book.all
  	@book = Book.new
  end

  def create
  	@book = Book.new(book_params)
  	@book.user_id = current_user.id
  	if @book.save
  		redirect_to book_path(@book.id), notice: "success" #redirect_to @bookと同義
  	else
  		@books = Book.all
  		render 'index'
  	end
  end

  def show
  	@onebook = Book.new
  	@book = Book.find(params[:id]) #追記
  	@user = @book.user

  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	@book = Book.find(params[:id])
  	@book.user_id = current_user.id
  	if @book.update(book_params)
  		redirect_to @book, notice: "success"
  	else
  		render 'edit'
  	end
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end

  def ensure_correct_user
  	@book = Book.find(params[:id])
  	if @book.user_id != current_user.id
  		redirect_to books_path
  	end
  end

end
