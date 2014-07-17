#coding UTF-8
require 'rails_helper'

RSpec.describe Author, type: :model  do
	it 'should have attributes :nickname :user_id ' do
		expect(subject.attributes).to include('user_id', 'nickname')
	end

	it 'should validate' do
		expect(Author.new).not_to be_valid
		expect(Author.new(user_id: 1, nickname: "aaaa")).to be_valid
	end	
	it 'should belong to user' do
		t = Author.reflect_on_association(:user)
		expect(t.macro).to equal :belongs_to
	end
end