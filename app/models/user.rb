class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  KANA_REGEX = /\A[ァ-ヴー]+\z/.freeze

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }

  with_options presence: true do
    validates :user_name
    validates :last_name, format: { with: NAME_REGEX }
    validates :first_name, format: { with: NAME_REGEX }
    validates :last_name_kana, format: { with: KANA_REGEX }
    validates :first_name_kana, format: { with: KANA_REGEX }
    validates :birth_date
  end
end
