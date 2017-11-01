module Api
  module V1
    class ItemsController < ActionController::API
      def index
        render json: Item.all
      end

      def show
        render json: Item.find(params[:id])
      end

      def destroy
        render json: Item.delete(params[:id])
      end
    end
  end
end
