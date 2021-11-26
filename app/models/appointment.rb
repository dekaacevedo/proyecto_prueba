class Appointment < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :patient

  # Validations
  validates :date, :patient_id, presence: true
  validates :time, uniqueness: { scope: [:date, :user_id]}

  # Metodo solo fecha para citas diarias
  def today
    self.date.strftime("%a, %e %b %Y")
  end
end
