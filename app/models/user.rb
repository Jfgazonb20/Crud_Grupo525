class User < ApplicationRecord
  validates :name, presence: true
  validates :date_of_birth, presence: true
  validate :validate_age_and_city_limit

  # Método para calcular la edad basado en la fecha de nacimiento
  def age
    return nil unless date_of_birth

    today = Date.today
    age = today.year - date_of_birth.year
    age -= 1 if today < date_of_birth + age.years # Ajusta si no ha cumplido años este año
    age
  end

  private

  def validate_age_and_city_limit
    if age.nil? || age < 18  # Asegúrate de que age no sea nil antes de compararlo
      errors.add(:base, "No se puede registrar: debe ser mayor de 18 años.")
    end

    if User.where(city: city).count >= 3
      errors.add(:base, "No se pueden registrar más de 3 usuarios por ciudad.")
    end
  end
end
