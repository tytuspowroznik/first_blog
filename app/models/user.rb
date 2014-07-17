class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :trackable, :validatable
	has_one :author
	after_create :create_author_for_user

	private
	def create_author_for_user
		author=Author.new
		author.nickname = self.email
		author.user_id=self.id
		author.save
	end
end
