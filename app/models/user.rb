class User < ApplicationRecord
  has_secure_password
  # has_many :designs we can write it this way but when creating designs belongs to we may
  #  get confused, so we use the second way of writing it, which is same like above

  has_many :created_designs, foreign_key: "user_id", class_name: "Design"
  has_many :designs, through: :comments
  has_many :comments
end

  