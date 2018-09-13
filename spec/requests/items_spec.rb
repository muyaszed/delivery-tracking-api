require 'rails_helper'

RSpec.describe 'Items API', type: :request do
  let(:delivery) { create :delivery_with_items}
  let(:item_id) {delivery.items.first.id}
  let(:user) {delivery.user}
  let(:headers) {valid_headers}

  describe 'GET /deliveries/:delivery_id/items' do
    before {get "/deliveries/#{delivery.id}/items", headers: headers}

    it 'return items' do
      expect(json.length).to eq(10)
    end

    it 'return status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /deliveries/:delivery_id/items/:id' do
    before { get "/deliveries/#{delivery.id}/items/#{item_id}", headers: headers}

    context 'when the record exist' do
      it 'return specific items' do


        expect(json["id"]).to eq(item_id)
      end

      it 'return status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record do not exist' do
      let(:item_id) {200}
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'return a not found message' do
        expect(response.body).to match(/Couldn't find Item/)
      end
    end

  end

  describe 'POST /deliveries/:delivery_id/items' do
    let(:valid_params) {
      {descp: "Port marion"}.to_json
    }

    before { post "/deliveries/#{delivery.id}/items", params: valid_params, headers: headers}

    context 'valid params' do

      it 'returns the newly created item' do
        expect(Item.last.descp).to eq(JSON.parse(valid_params)["descp"])
      end

      it 'return status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'invalid params' do
      let(:invalid_params) {
        {descp: ""}.to_json
      }

      before { post "/deliveries/#{delivery.id}/items", params: invalid_params, headers: headers}

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end

  end

  describe 'PUT /deliveries/:delivery_id/items/:id' do
    let(:new_params) {{descp: "new description"}.to_json}
    before {put "/deliveries/#{delivery.id}/items/#{item_id}", params: new_params, headers: headers}

    it 'updates the record' do
      expect(Item.find(item_id).descp).to eq('new description')
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

  describe 'DELETE /deliveries/:delivery_id/items/:id' do
    before {delete "/deliveries/#{delivery.id}/items/#{item_id}", headers: headers}

    it 'returns status code 204' do
      expect(response).to have_http_status(204)

    end

    it 'the item is deleted' do
      expect(Item.where(id: item_id)).not_to exist
    end
  end

end
