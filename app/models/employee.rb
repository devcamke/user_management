class Employee < ApplicationRecord
  # Validations
  validates :first_name, :last_name, :email, :contact_number, :date_of_birth, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }
  validates :contact_number, format: { with: /\A\d{10}\z/, message: "should be 10 digits" }

  # Get the age of the employee
  def age
    return nil unless date_of_birth.present?
    age = Time.now.year - date_of_birth.year
    if Time.now.month < date_of_birth.month || (Time.now.month == date_of_birth.month && Time.now.day < date_of_birth.day)
      age -= 1
    end
    age
  end

  # Ransackable attributes for the search form
  def self.ransackable_attributes(auth_object = nil)
    ["first_name", "last_name", "email", "contact_number", "address", "pincode", "city", "state", "date_of_birth", "date_of_hiring"]
  end
end
