module Api
  module V1
    # Controller for the gamer grade api
    class GradeController < ApplicationController
      def index
        render json: { test: "hello world" }, status: 200
      end
    end
  end
end
