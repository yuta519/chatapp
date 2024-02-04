# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:email) { 'user@localhost.com' }
  let(:name) { 'user' }

  context 'with vaild email and name' do
    subject(:target) { described_class.create({ name:, email: }) }

    it 'must be valid' do
      expect(target.valid?).to be_truthy
    end

    it 'must have an id' do
      expect(target.id).to be_present
    end

    it 'must have the same name' do
      expect(target.name).to eq(name)
    end

    it 'must have the same email' do
      expect(target.email).to eq(email)
    end

    it 'must be active' do
      expect(target.active?).to be_truthy
    end
  end

  context 'with invalid email' do
  end
end
