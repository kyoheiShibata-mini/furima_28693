class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :buy_logs
  has_many :comments

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname,:first_name,:second_name,:first_kana,:second_kana,:birth, presence: true
         
         VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
         validates :password, format: { with: VALID_PASSWORD_REGEX }

         ZENKAKU = /\A[ぁ-んァ-ン一-龥]+\z/
         validates :first_name,:second_name, format: { with: ZENKAKU }

         KATAKANA = /\A[ァ-ン]+\z/
         validates :first_kana,:second_kana, format: { with: KATAKANA }
end
