# frozen_string_literal: true

require 'ulid'
require './app/models/user.rb'

100.times do
  username = ULID.generate.to_s
  User.create!(
    email: "#{username}@example.com",
    username: username,
    password: 'password',
  )
end
