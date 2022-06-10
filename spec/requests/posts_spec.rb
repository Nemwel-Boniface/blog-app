require 'rails_helper'

describe "Posts", type: :request do

  before(:each) { get user_posts_path(user_id: 1) } 

  context "index" do
    it "GET /index returns okay status" do
      expect(response).to have_http_status(200)  
    end

    it 'GET /index renders correct template(index)' do
      expect(response).to render_template(:index)
    end

    it 'GET /index include correct placeholder text' do
      expect(response.body).to include('See Blog posts')
    end
  end
end

# describe "Posts", type: :request do

#   before(:each) { get post_path({id: 1}) } 
#   context "show" do
#     it 'GET /show status' do
#     expect(response).to have_http_status(200)
#   end

#   it 'GET /show render correct template(show)' do
#     expect(response).to render_template(:show)
#   end

#   it 'GET /show include correct placeholder text' do
#     expect(response.body).to include('Here is a list of posts for a given user')
#   end
#   end
# end


