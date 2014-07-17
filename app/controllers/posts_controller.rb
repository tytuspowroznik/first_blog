#coding UTF-8

class PostsController < ApplicationController
	before_action :authenticate_user!
	
	def index
		@posts = Post.all

	end
	def show
		@author=Author.all
		@post=Post.find(params[:id])
	end
	def destroy
		@post=Post.find(params[:id])
		@post.destroy
		redirect_to posts_path, alert: "usunieto"
	end
	def new
		@post=Post.new

		
	end
	def create
		if Post.create(post_params)
			redirect_to posts_path, notice: "utworzono"
		else
			render 'new'
		end
	end
	def edit
		@post=Post.find(params[:id])

	end
	def update
		@post=Post.find(params[:id])
		if @post.update(post_params)
			redirect_to posts_path, notice: "zmieniono"
		else
			render 'edit'
		end

	end



	private 
	def post_params
		params.require(:post).permit(:title, :content, :author_id)
	end
end