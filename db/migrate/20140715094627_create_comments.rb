class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.belongs_to :post
    	t.belongs_to :author
    	t.text :content
    	t.timestamps
    end
  end
end
