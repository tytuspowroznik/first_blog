class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
    	t.belongs_to :post
    	t.timestamps
    end
  end
end
