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
		unless @post.author.id == current_user.author.id
         	redirect_to root_url, alert: "Brak uprawnień"
         else 
         	@post.destroy
         	redirect_to root_url, alert: "usunięto"
       	end
	end
	def new
		@post=Post.new
	end
	def create
		@post = Post.new(post_params)
		@post.author_id = current_user.author.id

		if @post.save
			@article = Article.create(post_id: @post.id)
			redirect_to posts_path, notice: "utworzono"
		else
			render 'new'
		end
	end
	def edit
		@post=Post.find(params[:id])
		unless @post.author.id == current_user.author.id
         	redirect_to root_url, alert: "Brak uprawnień"
       	end
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
		params.require(:post).permit(:title, :content)
	end
	# def make_sure_its_mine(post)
	# 	unless post.author.id == current_user.author.id
 #        	redirect_to root_url, alert: "Brak uprawnień"
 #        else 
 #        	true
 #      	end
	# end
end