class User < ApplicationRecord
    has_one_attatched :avatar
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false}
end
