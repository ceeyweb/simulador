FactoryBot.define do
  factory :user do
    ip_address { "0.0.0.0" }
    edad { 12 }
    estado_residencia { "Chiapas" }
    ultimo_grado_cursado { "1° Primaria" }
    sexo { 1 }
    asistes_escuela { false }
  end
end
