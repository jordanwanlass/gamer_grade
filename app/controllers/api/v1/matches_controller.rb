require 'rest-client'

module Api
  module V1
    # Controller for all match related api calls
    class MatchesController < ApplicationController
      def index
        all_url = "https://americas.api.riotgames.com/lol/match/v5/matches/by-puuid/l8jGR7HcG5vMNsmmdQE4Mwgv3szls11ACmJuirQFQ9RZDiDeBmNOQCNpHBQhZ8BgBUzWbcOGe4s_Ug/ids"
        single_url = "https://americas.api.riotgames.com/lol/match/v5/matches/"
        header = { "Accept-Language" => "en-US,en;q=0.9", "Accept-Charset" => "application/x-www-form-urlencoded; charset=UTF-8",
                   "", params: { 'start': 0, 'count': 10 } }

        response = RestClient.get(all_url, header)

        matches = []
        JSON.parse(response.body).each do |id|
          matches.push(JSON.parse(RestClient.get(single_url + id, header.except(:params))))
        end
        render json: matches, status: 200
      end

      def show; end
    end
  end
end
