class User < ActiveRecord::Base
	validates :name, presence: true

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true,
		format: { with: VALID_EMAIL_REGEX },
		uniqueness: { case_sensitive: false }

	validates_presence_of :password, on: :create, message: "Loco! crea una contraseña"
	has_secure_password
end
