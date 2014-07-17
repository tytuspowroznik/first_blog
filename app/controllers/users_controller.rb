#coding UTF-8

class UsersController < ApplicationController
	before_action :authenticate_user!

  def index 
    redirect_to authors_path
  end
	def show
    make_sure_its_mine
		redirect_to author_path(current_user.author)
    #@user=current_user
	end

  private
    def make_sure_its_mine
      unless current_user.id==params[:id].to_i
        redirect_to root_url, alert: "To nie twoje konto!"
      end
      true
    end
end