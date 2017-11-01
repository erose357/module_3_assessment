class SearchController < ApplicationController
  def index
    @stores = StoreSearch.new(params[:q])#.get_stores
  end
end
