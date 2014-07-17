class Comment < ActiveRecord::Base
validates :content, presence: true
validates :post_id, presence: true
validates :author_id, presence: true
belongs_to :post
belongs_to :author
end