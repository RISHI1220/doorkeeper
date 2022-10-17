# frozen_string_literal: true

module Api
  module V1
    class ApisController < ApplicationController
      def index
        render json: Book.all
      end

      def show
        render json: Book.find(params[:id])
      end

      def create
        @book = Book.new(book_params)
        render json: @book if @book.save
      end

      def update
        @book = Book.find(params[:id])
        render json: @book if @book.update(book_params)
      end

      def destroy
        Book.destroy(params[:id])
        render json: Book.all
      end

      private

      def book_params
        params.permit(:title, :author)
      end
    end
  end
end
