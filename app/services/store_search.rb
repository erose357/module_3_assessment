class StoreSearch
  def initialize(zip)
    @zip = zip
  end

  def get_stores
    service.find_stores.map do|store|
      Store.new(store)
    end
  end

  def store_total
    service.total_stores
  end

  private
    attr_reader :zip

    def service
      BestBuyService.new(zip)
    end

end
