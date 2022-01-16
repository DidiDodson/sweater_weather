require 'rails_helper'

describe "User API" do
  before :each do
    @header = {
      "Content-Type": "application/json"
    }
  end

  it "happy path - creates a user" do
    params = {email: 'shiho@test.com',
              password: 'ABc123',
              password_confirmation: 'ABc123'}

    post "/api/v1/users", headers: @header, params: params.to_json

    expect(response).to be_successful
    expect(response.status).to eq(201)

    result = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(result).to have_key(:attributes)
    expect(result[:attributes]).to have_key(:email)
    expect(result[:attributes]).to have_key(:api_key)
  end

  it "sad path - creates a user" do
    params = {email: '',
              password: 'ABc123',
              password_confirmation: 'ABc123'}

    post "/api/v1/users", headers: @header, params: params.to_json

    expect(response).to_not be_successful
    expect(response.status).to eq(403)
  end

  it "sad path - creates a user" do
    User.create!(email: 'shiho@test.com', password: 'ABc123', password_confirmation: 'ABc123', api_key: '12345')

    params = {email: 'shiho@test.com',
              password: 'ABc123',
              password_confirmation: 'ABc123'}

    post "/api/v1/users", headers: @header, params: params.to_json

    expect(response).to_not be_successful
    expect(response.status).to eq(403)
  end

  it "sad path - creates a user" do
    params = {email: 'shiho@test.com',
              password: 'ABc12',
              password_confirmation: 'ABc123'}

    post "/api/v1/users", headers: @header, params: params.to_json

    expect(response).to_not be_successful
    expect(response.status).to eq(401)
  end

  it "sad path - creates a user" do
    params = {email: 'shiho@test.com',
              password: 'ABc123',
              password_confirmation: ''}

    post "/api/v1/users", headers: @header, params: params.to_json

    expect(response).to_not be_successful
    expect(response.status).to eq(401)
  end
end
