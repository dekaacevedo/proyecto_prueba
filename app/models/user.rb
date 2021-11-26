class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments

  #Validations
  validates :name, :last_name, :phone, :specialty, :email, presence: true
  validates :email, format: { with: /\A[\w|.|-]+@[\w|-]+\.\w+\z/ }
  validates :phone, length: { minimum: 9 }
end
