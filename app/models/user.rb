# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  before_create :create_digest

  validates :name, presence: true, length: { in: 6..20 }, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/
  validates :password, presence: true, confirmation: true, length: { minimum: 6 }

  class << self
    def new_token
      SecureRandom.urlsafe_base64
    end

    def digest(token)
      Digest::SHA1.hexdigest(token.to_s)
    end
  end

  private

  def create_digest
    self.remember_token = User.digest(User.new_token)
  end
end
