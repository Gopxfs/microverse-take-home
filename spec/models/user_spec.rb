require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(
      index: 1,
      first_name: 'Gabriel',
      last_name: 'Fonseca',
      status: 'Active',
      email: 'gabriel@email.com',
      created_at: '2018-04-08'
    )
  end

  before { subject.save }

  describe 'first_name' do
    it 'should not be nil' do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end
    it 'should have more than one character' do
      expect(subject.first_name.length).to be >= 1
    end
  end

  describe 'last_name' do
    it 'should not be nil' do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end
    it 'should have more than one character' do
      expect(subject.last_name.length).to be >= 1
    end
  end

  describe 'status' do
    it 'should not be nil' do
      subject.status = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'email' do
    it 'should not be nil' do
      subject.email = nil
      expect(subject).to_not be_valid
    end
    it 'should have more than one character' do
      expect(subject.email.length).to be >= 1
    end
  end

  describe 'created_at' do
    it 'should not be nil' do
      subject.created_at = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'check_id' do
    it "should return true if there isn't any index" do
      expect(User.check_id(2)).to be true
    end
    it 'should return false if there is an index' do
      User.create(
        index: 2,
        first_name: 'Gabriel',
        last_name: 'Sales',
        status: 'Active',
        email: 'sales@email.com',
        created_at: '2018-04-01'
      )
      expect(User.check_id(2)).to be false
    end
  end
end
