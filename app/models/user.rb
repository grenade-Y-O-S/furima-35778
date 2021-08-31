class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #VALID_EMAIL_REGIX = /.+/@.+/

#  validates_presence_of :email :encrypted_password :user_name :last_name :first_name :last_name_kana :first_name_kana :birth_date

  with_options presence: true do
    validates :email, uniqueness: true, format: { with: /.+\u0040.+/ }
    validates :encrypted_password, length: { minimum: 6 }
    validates :user_name
    validates :last_name
    validates :first_name
    validates :last_name_kana
    validates :first_name_kana
    validates :birth_date
  end

end
