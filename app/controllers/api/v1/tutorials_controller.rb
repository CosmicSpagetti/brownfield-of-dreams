# frozen_string_literal: true

# controller for tutorials
module Api
  module V1
    class TutorialsController < ApplicationController
      def index
        render json: Tutorial.all
      end

      def show
        render json: Tutorial.find(params[:id])
      end
    end
  end
end
