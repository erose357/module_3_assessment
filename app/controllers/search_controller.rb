class SearchController < ApplicationController
  def index
    @stores = BestBuyService.new(params[:q]).find_stores
  end
end

class BestBuyService
  def initialize(zip)
    @zip = zip
  end

  def find_stores
    url.map do |store|
       Store.new(store)
    end
  end

  private
    attr_reader :zip
    
    def url
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=storeId,storeType,longName,city,distance,phone&pageSize=10&page=1&apiKey=#{ENV["api_key"]}")
    raw_stores = JSON.parse(response.body, symbolize_names: true)[:stores]
    end
end
