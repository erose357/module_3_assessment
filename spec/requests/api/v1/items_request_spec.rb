require 'rails_helper'

RSpec.describe "Items API" do
  it "sends all items" do
    items = create_list(:item, 5)

    get '/api/v1/items'

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(json.count).to eq(5)
    expect(json[0][:id]).to eq(items[0].id)    
    expect(json[0][:name]).to eq(items[0].name)    
    expect(json[0][:description]).to eq(items[0].description)    
    expect(json[0][:image_url]).to eq(items[0].image_url)    
    expect(json[0][:updated_at]).to be_nil
    expect(json[0][:created_at]).to be_nil
  end

  it "sends one items" do
    item = create(:item)

    get "/api/v1/items/#{item.id}"

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(json.class).to eq(Hash)
    expect(json[:name]).to eq(item.name)    
    expect(json[:description]).to eq(item.description)    
    expect(json[:image_url]).to eq(item.image_url)    
    expect(json[:updated_at]).to be_nil
    expect(json[:created_at]).to be_nil
  end
end
    
