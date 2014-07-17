#coding UTF-8
require 'rails_helper'

RSpec.describe Post, type: :model  do
	it 'should have attributes :content :title ' do
		expect(subject.attributes).to include('title','content')
	end

	it 'should validate' do
		expect(Post.new).not_to be_valid
		expect(Post.new(content: "aaa", title: "a")).to be_valid
	end	
	it 'should belong to author' do
		t = Post.reflect_on_association(:author)
		expect(t.macro).to equal :belongs_to

	end
end