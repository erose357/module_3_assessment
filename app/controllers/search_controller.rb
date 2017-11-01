class SearchController < ApplicationController
  def index
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=storeId,storeType,longName,city,distance,phone&pageSize=10&page=1&apiKey=#{ENV["api_key"]}")

    raw_stores = JSON.parse(response.body, symbolize_names: true)[:stores]
    
    @stores = raw_stores.map do |store|
      Store.new(store)
    end
  end
end
