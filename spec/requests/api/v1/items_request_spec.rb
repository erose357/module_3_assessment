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

  it "sends one item" do
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
  
  it "can delete one item" do
    item = create(:item)

    delete "/api/v1/items/#{item.id}"

    expect(response.status).to eq(204) 
    expect(Item.find(item.id)).to raise_exception(ActiveRecord::RecordNotFound)
  end

  it "can create an item" do
    item = create(:item)

    put "/api/v1/items/#{item.id}"

    expect(response.status).to eq(204) 
    expect(Item.find(item.id)).to raise_exception(ActiveRecord::RecordNotFound)
  end
end
#When I send a POST request to `/api/v1/items` with a name, description, and image_url
#I receive a 201 JSON  response if the record is successfully created
#And I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_at
    
