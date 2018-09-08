require 'spec_helper'
require 'cancan/matchers'

describe 'User' do
  describe 'Abilities' do
    let!(:admin) { create(:admin) }

    # see https://github.com/CanCanCommunity/cancancan/wiki/Testing-Abilities
    subject(:ability) { Ability.new(user) }
    let(:user) { nil }

    # Not signed in users
    context 'when user is not signed in' do
      it { should_not be_able_to(:manage, :all) }
    end

    # Signed in users (without any role)
    context 'when user is signed in' do
      let(:user) { create(:user) }

      # User
      it { should be_able_to(:manage, user) }
    end

    # Signed in users with role
    context 'user #is_admin?' do
      # let(:role) { Role.find_by(name: 'organizer', resource: my_conference) }
      # let(:user) { create(:user, role_ids: [role.id]) }
    end
  end
end
