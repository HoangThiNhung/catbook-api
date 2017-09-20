module Api
  module V1
    class CatsController < ApplicationController
      before_action :set_cat, only: [:show, :update, :destroy]

      # GET /api/v1/cats
      def index
        render json: Cat.includes(:hobbies), include: ['hobbies']
      end

      # GET /api/v1/cats/1
      def show
        render json: @cat
      end

      # POST /api/v1/cats
      def create
        @cat = Cat.new(cat_params)

        if @cat.save
          render json: @cat, status: :created, location: @cat
        else
          render json: @cat.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/cats/1
      def update
        if @cat.update(cat_params)
          render json: @cat
        else
          render json: @cat.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/cats/1
      def destroy
        @cat.destroy
      end

      private

      def set_cat
        @cat = Cat.find(params[:id])
      end

      def cat_params
        params.fetch(:cat, {})
      end
    end
  end
end
