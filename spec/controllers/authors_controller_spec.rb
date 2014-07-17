require 'rails_helper'

RSpec.describe AuthorsController, type: :controller do
	before(:each) do
		@user=User.create(email: "test@test.com", password: "qwerty12345")
		sign_in @user

	end


	describe "GET #index " do
		it 'responds successfully with HTTP 200 ' do
			get :index
			expect(response).to be_success
			expect(response).to have_http_status(200)

		end
		it 'should render index template' do
			get :index
			expect(response).to render_template("index")
		end
		it 'should have @authors with all authors' do
			author1=Author.create(nickname: "aaaa", user_id: 1)
			author2=Author.create(nickname: "bbbb", user_id: 2)
			get :index
			expect(assigns(:authors)).to match_array([author1,author2,@user.author])
		end

	end
	describe "AUTHOR #create" do
		it 'redirect to posts_path after creation' do
			post :create, author: {nickname: "a", user_id: 4} 
			expect(response).to redirect_to(authors_path)
		end
	end



end