# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'who has vaild email and name' do # (almost) plain English
    it 'must be saved' do
      user = User.new
      user.email = 'user@localhost.com'
      user.name = 'user'
      user.save!

      expect(user.id).to be_present
    end
  end
end
