class User < ActiveRecord::Base
    # Blow saves the email as downcase in the DB before a save action is complete.
    before_save {self.email = email.downcase}
    validates :username, presence: true, uniqueness: {case_sensative:false},length:{minimum: 3, maximum: 25}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true,length:{maximum: 105}, uniqueness: {case_sensative:false},
    format: {with: VALID_EMAIL_REGEX}

    has_secure_password
    has_many :sensors, dependent: :destroy
end
