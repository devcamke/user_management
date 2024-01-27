class Employee < ApplicationRecord
  validates :first_name, :last_name, :email, :contact_number, :date_of_birth, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'must be a valid email address' }
  validates :contact_number, format: { with: /\A\d{10}\z/, message: 'should be 10 digits' }
end
