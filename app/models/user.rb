# frozen_string_literal: true

VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d-]+(\.[a-z\d-]+)*\.[a-z]+\z/i

# User model
class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true

  belongs_to :mother, class_name: 'User', optional: true
  belongs_to :father, class_name: 'User', optional: true
  has_many :children, class_name: 'User', foreign_key: 'mother_id' || 'father_id'

  def active?
    disabled_at.nil?
  end
end
