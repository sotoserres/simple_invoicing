require 'rails_helper'
require 'validates_email_format_of/rspec_matcher'

describe User do
  let(:user) { create(:user) }
  subject { user }

  describe 'association' do
    it { is_expected.to have_many(:openids) }
  end

  describe 'validation' do
    it 'has a valid factory' do
      expect(build(:user)).to be_valid
    end

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to validate_length_of(:password).is_at_least(4).is_at_most(128) }
  end

  describe '#name' do
    it 'shows user full name' do
      user = create(:user, first_name: 'this is', last_name: 'my name')
      expect(user.name).to eq 'this is my name'
    end
  end
end
