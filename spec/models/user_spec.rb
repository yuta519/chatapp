# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'who has vaild email and name' do
    subject(:user) { User.new }

    it 'must be saved successfully' do
      email = 'user@localhost.com'
      name = 'user'

      user.email = email
      user.name = name
      user.save!

      expect(user.id).to be_present
      expect(user.name).to eq(name)
      expect(user.email).to eq(email)
    end
  end
end
