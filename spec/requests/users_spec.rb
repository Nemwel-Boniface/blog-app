require 'rails_helper'

describe 'Users', type: :request do

  before(:each) { get users_path }

  context 'index' do
    it 'GET /index returns okay status' do
      expect(response).to have_http_status(200)
    end

    # it 'GET /index renders correct template(index)' do
    #   expect(response).to render_template(:index)
    # end

    it 'GET /index include correct placeholder text' do
      expect(response.body).to include('Welcome to Blog App')
    end
  end
end

describe 'User', type: :request do

  before(:each) { get user_path({ id: 1 }) }

  it 'GET /show status' do
    expect(response).to have_http_status(200)
  end

  it 'GET /show render correct template(show)' do
    expect(response).to render_template(:show)
  end

  it 'GET /show include correct placeholder text' do
    expect(response.body).to include('See user profile')
  end
end
