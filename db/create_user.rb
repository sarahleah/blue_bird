require 'bcrypt'

require_relative '../models/users.rb'

password = 'pudding'

password_digest = BCrypt::Password.create(password)

create_user('sarah_leah', 'Susan', 'Boyle', 'sarah.beary.1@gmail.com', 'https://images.unsplash.com/photo-1518577915332-c2a19f149a75?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=968&q=80', password_digest)