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
		@auhtor = Author.find(@post.author_id)
		@comments = @post.comments
	end



	#private 
	#def comment_params
	#	params.require(:comment).permit(:content, :author_id, :post_id)
	#end
end