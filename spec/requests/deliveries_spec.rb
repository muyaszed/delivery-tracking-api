require 'rails_helper'

RSpec.describe 'Deliveries API', type: :request do
  # let(:user) { create(:user)}
  # let(:deliveries) {create_list(:delivery, 10, user_id: user.id)}
  # let(:delivery_id) {deliveries.id}
  let (:user) {create(:user_with_deliveries)}
  let(:headers) {valid_headers}
  let(:delivery_id) {user.deliveries.first.id}

  describe 'GET /deliveries' do

    before {get '/deliveries', params: {}, headers: headers}

    it 'returns deliveries' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

  end

  describe 'GET /delivery/id' do
    before {get "/deliveries/#{delivery_id}", params: {}, headers: headers}

    context 'when the record exist' do
      it 'return specific delivery' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(delivery_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record do not exist' do
      let(:delivery_id) { 300 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Delivery/)
      end
    end


  end

  describe 'POST deliveries' do

    context 'with valid parameters' do
      let(:valid_payloads) {
        {
        customer_first_name: "Sarah",
        customer_last_name: "Malek",
        customer_email: "Sarahmalek@gmail.com",
        tracking_number: "e2234234234ty"
      }.to_json
      }
      before {post '/deliveries', params: valid_payloads, headers: headers}

      it 'creates delivery with default value' do
        expect(json['status']).to eq('Pending')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'with invalid params' do
      let(:invalid_payloads) {
        {
          customer_first_name: nil,
          customer_last_name: nil,
          customer_email: nil,
          tracking_number: nil
        }.to_json
      }
      before {post '/deliveries', params: invalid_payloads, headers: headers}

      it 'return status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(json['message']).to match(/Validation failed: Customer first name can't be blank/)
      end
    end

  end

  describe 'PUT /deliveries/id' do
    let(:valid_attributes) { { status: 1 }.to_json }

    context 'when the record exists' do
      before { put "/deliveries/#{delivery_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /deliveries/id' do
    before { delete "/deliveries/#{delivery_id}", headers: headers}

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
