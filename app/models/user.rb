class User < ApplicationRecord

  validates :ip_address,
            :edad,
            :estado_residencia,
            :ultimo_grado_cursado,
            :sexo,
            :asistes_escuela,
            presence: true

  validates :edad, numericality: { greater_than: 0, less_than: 100 }
  validates :estado_residencia, inclusion: { in: Mexico::ESTADOS }
  validates :ultimo_grado_cursado, inclusion: { in: Mexico::GRADOS_ESCOLARES }

end
