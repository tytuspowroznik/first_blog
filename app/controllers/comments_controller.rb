#coding UTF-8

class CommentsController < ApplicationController
	def index
		@authors = Author.all
		@posts = Post.all 
		@comments = Comment.all

	end
	def show
		@author=Author.all
		@comment=Comment.find(params[:id])
	end
	def destroy
		unless current_user.author.id==params[:id].to_i
        	redirect_to root_url, alert: "Brak uprawnień"
        else
        	@comment=Comment.find(params[:id])
			@comment.destroy
			redirect_to posts_path, alert: "usunieto"
      	end
		
	end
	def new
		@comment=Comment.new

		
	end
	def create
		@comment = Comment.new(comment_params)
		@comment.author_id = current_user.author.id
		@comment.post_id = params[:comment][:post_id]
		if @comment.save
			redirect_to articles_path, notice: "utworzono nowy"
		else
			render 'new'
		end
	end
	def edit
		unless current_user.author.id==params[:id].to_i
        	redirect_to root_url, alert: "Brak uprawnień"
        else
			@comment=Comment.find(params[:id])
      	end
		

	end
	def update
		@comment=Comment.find(params[:id])
		if @comment.update(comment_params)
			redirect_to articles_path, notice: "zmieniono"
		else
			render 'edit'
		end

	end



	private 
	def comment_params
		params.require(:comment).permit(:content, :author_id, :post_id)
	end
	# def make_sure_its_mine
 #      unless current_user.author.id==params[:id].to_i
 #        redirect_to root_url, alert: "Brak uprawnień"
 #      end
 #      true
 #    end
end