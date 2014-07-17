#coding UTF-8

class ArticlesController < ApplicationController
	def index
		@articles = Article.all
		@authors = Author.all
		@posts = Post.all 
		@comments = Comment.all

	end
	def show
		@article=Article.find(params[:id])
		@post = Post.find(@article.post_id)
		@author = Author.find(@post.author_id)
		@comments = Comment.where(post_id: @post.id)
	end



	private 
	def article_params
		params.require(:article).permit(:post_id)
	end
end