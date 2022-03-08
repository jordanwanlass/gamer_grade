require 'rest-client'

module Api
  module V1
    # Controller for all match related api calls
    class MatchesController < ApplicationController
      def index
        #   temp = {
        #     "Accept-Language" => "en-US,en;q=0.9",
        #     "Accept-Charset" => "application/x-www-form-urlencoded; charset=UTF-8",
        #     "X-Riot-Token" => "RGAPI-02358cb1-1191-4de6-b3e4-85622a4de2ad",
        #     {params:{start: 0, count: 20}}
        # }
        response = RestClient.get('https://americas.api.riotgames.com/lol/match/v5/matches/by-puuid/l8jGR7HcG5vMNsmmdQE4Mwgv3szls11ACmJuirQFQ9RZDiDeBmNOQCNpHBQhZ8BgBUzWbcOGe4s_Ug/ids',
                                  { "Accept-Language" => "en-US,en;q=0.9", "Accept-Charset" => "application/x-www-form-urlencoded; charset=UTF-8",
                                    "X-Riot-Token" => "RGAPI-02358cb1-1191-4de6-b3e4-85622a4de2ad", params: { 'start': 0, 'count': 20 } })
        render json: response.body, status: 200
      end

      def show; end
    end
  end
end
