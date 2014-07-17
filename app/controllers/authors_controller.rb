#coding UTF-8

class AuthorsController < ApplicationController
	before_action :authenticate_user!
	def index
		@authors = Author.all

	end
	def show
		@author=Author.find(params[:id])
	end
	def destroy
		@author=Author.find(params[:id])
		@author.destroy
		redirect_to authors_path, alert: "usunieto"
	end
	def new
		@author=Author.new

		
	end
	def create
		if Author.create(author_params)
			redirect_to authors_path, notice: "utowrzono nowy"
		else
			render 'new'
		end
	end
	def edit
		@author=Author.find(params[:id])

	end
	def update
		@author=Author.find(params[:id])
		if @author.update(author_params)
			redirect_to authors_path, notice: "zmieniono"
		else
			render 'edit'
		end

	end



	private 
	def author_params
		params.require(:author).permit(:nickname)
	end
end