class SearchController < ApplicationController
  def index
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=storeId,storeType,longName,city,distance,phone&pageSize=10&page=1&apiKey=qy8vdpfcgsxtfw657mnbu7nc")

    json = JSON.parse(response.body, symbolize_names: true)
    binding.pry
  end
end
