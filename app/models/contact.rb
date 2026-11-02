class Contact < ApplicationRecord
	before_validation :normalize_email

	validates :email, presence: { message: "Please provide an email before submitting the form" }
	validate :email_must_include_at_sign
	validates :name, presence: { message: "Please provide your name before submitting the form" }

	private

	def normalize_email
		self.email = email.to_s.strip.downcase
	end

	def email_must_include_at_sign
		return if email.blank? || email.include?("@")

		errors.add(:email, "Please the email must have an @ character")
	end
end
