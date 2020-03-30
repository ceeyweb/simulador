# Source data
REGIONS = [ # id, description
  [1, "Norte"],
  [2, "Norte Occidente"],
  [3, "Centro Norte"],
  [4, "Centro"],
  [5, "Sur"],
  [99, "No sabe"],
].freeze

STATES = [ # id, description, region_id
  [1, "Aguascalientes", 3],
  [2, "Baja California", 1],
  [3, "Baja California Sur", 2],
  [4, "Campeche", 5],
  [5, "Coahuila", 1],
  [6, "Colima", 3],
  [7, "Chiapas", 5],
  [8, "Chihuahua", 1],
  [9, "Ciudad de México", 4],
  [10, "Durango", 2],
  [11, "Guanajuato", 4],
  [12, "Guerrero", 5],
  [13, "Hidalgo", 4],
  [14, "Jalisco", 3],
  [15, "Estado de México", 4],
  [16, "Michoacán", 3],
  [17, "Morelos", 4],
  [18, "Nayarit", 2],
  [19, "Nuevo León", 1],
  [20, "Oaxaca", 5],
  [21, "Puebla", 4],
  [22, "Querétaro", 4],
  [23, "Quintana Roo", 5],
  [24, "San Luis Potosí", 3],
  [25, "Sinaloa", 2],
  [26, "Sonora", 1],
  [27, "Tabasco", 5],
  [28, "Tamaulipas", 1],
  [29, "Tlaxcala", 4],
  [30, "Veracruz", 5],
  [31, "Yucatán", 5],
  [32, "Zacatecas", 2],
  [99, "No sabe", 99],
].freeze

EDUCATION_LEVELS = [ # id, description
  [0, "Sin escolaridad"],
  [1, "Primaria"],
  [2, "Secundaria"],
  [3, "Preparatoria"],
  [4, "Universidad"],
  [5, "Posgrado"],
  [99, "No sabe"],
].freeze

EDUCATION_GRADES = [ # id, school_year, description, education_level_id
  [1, 0, "Sin escolaridad", 0],
  [2, 1, "1° Primaria", 1],
  [3, 2, "2° Primaria", 1],
  [4, 3, "3° Primaria", 1],
  [5, 4, "4° Primaria", 1],
  [6, 5, "5° Primaria", 1],
  [7, 6, "6° Primaria", 1],
  [8, 7, "1° Secundaria", 2],
  [9, 8, "2° Secundaria", 2],
  [10, 9, "3° Secundaria", 2],
  [11, 10, "1° Preparatoria", 3],
  [12, 11, "2° Preparatoria", 3],
  [13, 12, "3° Preparatoria", 3],
  [14, 13, "1° Universidad", 4],
  [15, 14, "2° Universidad", 4],
  [16, 15, "3° Universidad", 4],
  [17, 16, "4° Universidad", 4],
  [18, 17, "Universidad Completa", 4],
  [19, 18, "1° Posgrado", 5],
  [20, 19, "2° Posgrado", 5],
  [21, 20, "3° Posgrado", 5],
  [22, 21, "4° Posgrado", 5],
  [23, 22, "5° Posgrado", 5],
  [99, 0, "No sabe", 99],
].freeze

SEXES = [ # id, description
  [1, "Mujer"],
  [2, "Hombre"],
].freeze

JOB_TYPES = [ # id, description
  [1, "Jornalero"],
  [2, "Empleado"],
  [3, "Patrón"],
  [4, "Trabajador por cuenta propia"],
  [99, "No sabe"],
].freeze

AGE_GROUPS = [ # id, description, lower_limit, upper_limit
  [1, "6 a 11 años", 6, 11],
  [2, "12 a 14 años", 12, 14],
  [3, "15 a 17 años", 15, 17],
  [4, "18 a 23 años", 18, 23],
  [5, "Más de 23 años", 24, 120],
].freeze

# Load data - keep specified order, otherwise DB foreign key restriction
# errors may occur
REGIONS.each do |id, description|
  Region.create!(id: id, description: description)
end

STATES.each do |id, description, region_id|
  State.create!(id: id, description: description, region_id: region_id)
end

EDUCATION_LEVELS.each do |id, description|
  EducationLevel.create!(id: id, description: description)
end

EDUCATION_GRADES.each do |id, year, description, education_level_id|
  EducationGrade.create!(
    id: id,
    school_year: year,
    description: description,
    education_level_id: education_level_id,
  )
end

SEXES.each do |id, description|
  Sex.create!(id: id, description: description)
end

JOB_TYPES.each do |id, description|
  JobType.create!(id: id, description: description)
end

AGE_GROUPS.each do |id, description, lower_limit, upper_limit|
  AgeGroup.create!(
    id: id,
    description: description,
    lower_limit: lower_limit,
    upper_limit: upper_limit,
  )
end

# KPIs data
KpisLoader.load_all
