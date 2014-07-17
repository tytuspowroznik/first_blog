require 'rails_helper'

RSpec.describe PostsController, type: :controller do
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
		it 'should have @posts with all posts' do
			post1=Post.create(content: "content", title: "title")
			post2=Post.create(content: "content2", title: "title2")
			get :index
			expect(assigns(:posts)).to match_array([post1,post2])
		end

	end
	describe "POST #create" do
		it 'redirect to posts_path after creation' do
			post :create, post: {title: "a", content: "b"} 
			expect(response).to redirect_to(posts_path)
		end
	end



end