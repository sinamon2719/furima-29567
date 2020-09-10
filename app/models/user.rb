class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_items
  has_many :items

  validates :nickname,:email,:encrypted_password,:family_name,:family_name_kana,:first_name_kana,:birth_day,presence: true
end