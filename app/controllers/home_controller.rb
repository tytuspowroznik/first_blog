#coding: UTF-8

class HomeController < ApplicationController
	def index
		@post = Post.first
	end
end
