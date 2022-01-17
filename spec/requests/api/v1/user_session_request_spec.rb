require 'rails_helper'

describe "Session Create" do
  it "happy path - creates a session" do
    User.create!(email: 'shiho@test.com', password: 'ABc123', password_confirmation: 'ABc123', api_key: '12345')

    params = {email: 'shiho@test.com',
              password: 'ABc123'}

    post "/api/v1/sessions", headers: {"Content-Type": "application/json"}, params: params.to_json

    expect(response).to be_successful
    expect(response.status).to eq(200)

    result = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(result).to have_key(:attributes)
    expect(result[:attributes]).to have_key(:email)
    expect(result[:attributes]).to have_key(:api_key)
  end

  it "sad path - creates a session" do
    User.create!(email: 'shiho@test.com', password: 'ABc123', password_confirmation: 'ABc123', api_key: '12345')
    
    params = {email: '',
              password: 'ABc123'}

    post "/api/v1/sessions", headers: {"Content-Type": "application/json"}, params: params.to_json

    expect(response).to_not be_successful
    expect(response.status).to eq(403)

  end

  it "sad path - creates a session" do
    User.create!(email: 'shiho@test.com', password: 'ABc123', password_confirmation: 'ABc123', api_key: '12345')

    params = {email: 'shiho@test.com',
              password: ''}

    post "/api/v1/sessions", headers: {"Content-Type": "application/json"}, params: params.to_json

    expect(response).to_not be_successful
    expect(response.status).to eq(403)
  end

  it "sad path - creates a session" do
    params = {email: 'shiho@test.com',
              password: 'ABc123'}

    post "/api/v1/sessions", headers: {"Content-Type": "application/json"}, params: params.to_json

    expect(response).to_not be_successful
    expect(response.status).to eq(403)
  end
end
