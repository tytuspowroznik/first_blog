class Post < ActiveRecord::Base
validates :content, presence: true
validates :title, presence: true
validates :author_id, presence: true
belongs_to :author
end