#coding UTF-8
require 'rails_helper'

RSpec.describe Comment, type: :model  do
	it 'should have attributes :content :post_id :author_id ' do
		expect(subject.attributes).to include('post_id', 'author_id','content')
	end

	it 'should validate' do
		expect(Comment.new).not_to be_valid
		expect(Comment.new(author_id: 1, content: "a", post_id: 1)).to be_valid
	end	
	it 'should belong to author' do
		t = Comment.reflect_on_association(:author)
		expect(t.macro).to equal :belongs_to
	end
	it 'should belong to post' do
		t = Comment.reflect_on_association(:post)
		expect(t.macro).to equal :belongs_to
	end
end