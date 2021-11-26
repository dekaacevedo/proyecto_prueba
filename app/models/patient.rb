class Patient < ApplicationRecord
    # Associations
    has_many :appointments, dependent: :destroy
    has_many :users, through: :appointments

    # Validations
    validates :name, :last_name, :phone, presence: true
    validates :phone, length: { minimum: 9 }
end
