class BestBuyService
  def initialize(zip)
    @zip = zip
  end

  def find_stores
    json_parse(url)[:stores]
  end

  def total_stores
    json_parse(url)[:total]
  end

  private
    attr_reader :zip
    
    def url
      Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=storeId,storeType,longName,city,distance,phone&pageSize=10&page=1&apiKey=#{ENV["api_key"]}")
    end

    def json_parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end
end
