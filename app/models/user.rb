class User < ActiveRecord::Base
	has_secure_password
	validates_presence_of :password, on: :create, message: "Loco! crea una contraseña"
end
