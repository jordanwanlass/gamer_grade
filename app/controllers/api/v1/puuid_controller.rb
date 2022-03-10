module Api
  module V1
    # api for puuid retrieval
    class PuuidController < ApplicationController
      def index
        header = { "Accept-Language" => "en-US,en;q=0.9", "Accept-Charset" => "application/x-www-form-urlencoded; charset=UTF-8", "X-Riot-Token" => ENV["API_KEY"] }
        render json: RestClient.get("https://americas.api.riotgames.com/riot/account/v1/accounts/by-riot-id/#{params[:riotId]}/#{params[:tagline]}", header), status: 200
      end
    end
  end
end
