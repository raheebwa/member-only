# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  before_create :create_digest

  validates :name, presence: true, length: { in: 6..20 }, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/
  validates :password, presence: true, confirmation: true, length: { minimum: 6 }

  private

  def create_digest
    self.remember_token = Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64.to_s)
  end
end
