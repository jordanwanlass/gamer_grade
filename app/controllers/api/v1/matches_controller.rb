require 'rest-client'

module Api
  module V1
    # Controller for all match related api calls
    class MatchesController < ApplicationController
      def index
        @puuid = params[:puuid]
        @header = { "Accept-Language" => "en-US,en;q=0.9", "Accept-Charset" => "application/x-www-form-urlencoded; charset=UTF-8",
          , params: { 'start': 0, 'count': 10 } }
#
        all_url = "https://americas.api.riotgames.com/lol/match/v5/matches/by-puuid/#{params[:puuid]}/ids"
        render json: build_small_matches(RestClient.get(all_url, @header)), status: 200
      end

      def show; end

      def build_small_matches(response)
        matches = []
        JSON.parse(response.body).each do |id|
          matches.push(get_small_match(JSON.parse(RestClient.get("https://americas.api.riotgames.com/lol/match/v5/matches/#{id}", @header.except(:params)))))
        end
        matches
      end

      def get_small_match(big_match)
        { championName: big_match["info"]["participants"].find { |p| p["puuid"] == @puuid }["championName"],
          kills: big_match["info"]["participants"].find { |p| p["puuid"] == @puuid }["kills"],
          deaths: big_match["info"]["participants"].find { |p| p["puuid"] == @puuid }["deaths"],
          assists: big_match["info"]["participants"].find { |p| p["puuid"] == @puuid }["assists"],
          kda: big_match["info"]["participants"].find { |p| p["puuid"] == @puuid }["challenges"]["kda"]
        }
      end
    end
  end
end
