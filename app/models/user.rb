class User < ApplicationRecord
    has_one_attached :avatar
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false}
    has_many :posts
    has_many :comments
end
