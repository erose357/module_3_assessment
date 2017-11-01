require 'rails_helper'

RSpec.describe "Items API" do
  it "sends all items" do
    items = create_list(:item, 5)

    get '/api/v1/items'
#When I send a GET request to `/api/v1/items`
#I receive a 200 JSON response containing all items
    expect(response).to be_success
#And each item has an id, name, description, and image_url but not the created_at or updated_at
  end
end
    
