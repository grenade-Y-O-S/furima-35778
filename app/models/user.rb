class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }

  with_options presence: true do
    validates :user_name
    validates :last_name, format: { with: /^[ぁ-んァ-ヶ亜-熙]+$/ }
    validates :first_name, format: { with: /^[ぁ-んァ-ヶ亜-熙]+$/ }
    validates :last_name_kana, format: { with: /^[ァ-ヴー]+$/ }
    validates :first_name_kana, format: { with: /^[ァ-ヴー]+$/ }
    validates :birth_date
  end

end
