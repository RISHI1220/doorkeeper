# frozen_string_literal: true

module Api
  module V1
    class ApisController < ActionController::API
      before_action :doorkeeper_authorize!
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
      def current_user
        @current_user ||= User.find_by(id: doorkeeper_token[:resource_owner_id])
      end
    end
  end
end
