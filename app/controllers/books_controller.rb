class BooksController < ApplicationController
  def index
    @books=Book.all
  end

  def show
    @book=Book.find(params[:id])
  end

  def new
    @book=Book.new
  end

  def create
    @book=Book.new(book_params)
    if @book.save
      flash[:notice]= "Book Created Successfully"
      redirect_to book_path(@book)
    else
      render :new , status: :unprocessable_entity
    end
  end

  def edit
    @book=Book.find(params[:id])
  end

  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice]= "Book Editted Successfully"
      redirect_to book_path(@book)
    else
      render :new , status: :unprocessable_entity
    end
    
  end

  def destroy
    @book=Book.find(params[:id])
    if @book.destroy
      flash[:alert]= "Book Deleted Successfully"
      redirect_to books_path
    else
      redirect_to book_path(@book)
    end
  end

  private
  def book_params
    params.require(:book).permit(:title,:author)
  end
end
