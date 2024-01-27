class Employee < ApplicationRecord
  validates :first_name, :last_name, :email, :contact_number, :date_of_birth, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'must be a valid email address' }
  validates :contact_number, format: { with: /\A\d{10}\z/, message: 'should be 10 digits' }

def age
  if date_of_birth.present?
    age = Time.now.year - date_of_birth.year
    if Time.now.month < date_of_birth.month || (Time.now.month == date_of_birth.month && Time.now.day < date_of_birth.day)
      age -= 1
    end
    age
  else
    nil
  end

end

end
