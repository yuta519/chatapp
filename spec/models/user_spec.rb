# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do # rubocop:disable Metrics/BlockLength
  describe 'validations' do # rubocop:disable Metrics/BlockLength
    let(:email) { 'user@localhost.com' }
    let(:name) { 'user' }

    subject(:target) { described_class.new }

    context 'with vaild email and name' do
      before do
        target.name = name
        target.email = email
      end

      it 'must be valid' do
        expect(target.valid?).to be_truthy
      end

      it 'must have no id' do
        expect(target.id).to be_nil
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

    context 'with valid name and email is saved' do
      before do
        target.name = name
        target.email = email
        target.save
      end
      it 'must be valid' do
        expect(target.valid?).to be_truthy
      end

      it 'must have a id' do
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

    context 'with too short name' do
      before do
        target.name = 'a'
        target.email = email
        target.save
      end

      it 'must be invalid' do
        expect(target).to be_invalid
      end

      it 'must have a message about too short name' do
        expect(target).to be_invalid
        expect(target.errors.messages).to eq(name: ['is too short (minimum is 3 characters)'])
      end
    end
  end
end
