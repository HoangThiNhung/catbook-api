module Api
  module V1
    class HobbiesController < ApplicationController
      before_action :set_hobby, only: [:show, :update, :destroy]

      # GET /api/v1/hobbies
      def index
        render json: Hobby.includes(:cats), include: ['cats']
      end

      # GET /api/v1/hobbies/1
      def show
        render json: @hobby
      end

      # POST /api/v1/hobbies
      def create
        @hobby = Hobby.new(hobby_params)

        if @hobby.save
          render json: @hobby, status: :created, location: @hobby
        else
          render json: @hobby.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/hobbies/1
      def update
        if @hobby.update(hobby_params)
          render json: @hobby
        else
          render json: @hobby.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/hobbies/1
      def destroy
        @hobby.destroy
      end

      private

      def set_hobby
        @hobby = Hobby.find(params[:id])
      end

      def hobby_params
        params.fetch(:hobby, {})
      end
    end
  end
end
