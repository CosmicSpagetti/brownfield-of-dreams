# frozen_string_literal: true

module Api
  module V1
    # controller for tutorials
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
