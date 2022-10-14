class Api::V1::ApisController < ApplicationController
    def index
      render json: Book.all
    end
  
    def show
      render json: Book.find(params[:id])
    end
  
    def create
      @book=Book.new(book_params)
      if @book.save
        render json: @book
      end
    end
  
    def update
      @book=Book.find(params[:id])
      if @book.update(book_params)
        render json: @book
      end 
    end
  
    def destroy
      Book.destroy(params[:id])
      render json: Book.all
    end
  
    private
    def book_params
      params.permit(:title,:author)
    end
  end
  