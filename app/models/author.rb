class Author < ActiveRecord::Base
validates :nickname, presence: true
validates :nickname, length: { minimum: 3 }
validates :user_id, presence: true
before_create :set_postcounter
belongs_to :user
	protected
	def set_postcounter
		self.postcounter = 0
	end
end