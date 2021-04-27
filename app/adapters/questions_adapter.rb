class QuestionsAdapter

  DATA = {
    institution_id: "Selecciona o escribe el nombre de la INSTITUCIÓN que te recomendó contestar el Simulador de Movilidad Social.",
    age: "¿Cuál es tu edad?",
    residency_id: "¿En qué estado de la República Mexicana vivías a los 14 años?",
    education_grade_id: "¿Cuál fue el último grado escolar que terminaste?",
    has_healthcare: "¿Cuentas con acceso a servicios médicos del IMSS o del ISSSTE o de alguna institución privada?",
    sex_id: "¿Cuál es tu sexo?",
    is_student: "¿Asistes a la escuela actualmente?",
    is_employed: "¿Trabajas actualmente?",
    is_first_job: "¿Es este tu primer empleo?",
    has_employees: "En tu primer empleo, ¿tienes o tuviste empleados a tu cargo?",
    home_had_mobile_phone: "Teléfono celular",
    home_had_fixed_phone: "Teléfono fijo",
    home_had_internet: "Acceso a internet",
    home_had_stove: "Estufa de gas o eléctrica",
    home_had_fridge: "Refrigerador",
    home_had_heater: "Calentador de agua (boiler, solar)",
    home_had_toaster: "Tostador eléctrico de pan",
    home_had_water: "Agua entubada dentro de la vivienda",
    home_had_bathroom: "Baño dentro de la vivienda",
    home_had_electricity: "Electricidad",
    home_had_washer: "Lavadora",
    father_age: "¿Cuál es la edad de tu padre? <small>(déjala en blanco si no sabes)</small>".html_safe,
    father_residency_id: "¿En qué estado de la República Mexicana vive o vivía tu padre?",
    father_education_grade_id: "¿Cuál fue el último grado escolar que terminó tu padre?",
    mother_age: "¿Cuál es la edad de tu madre? <small>(déjala en blanco si no sabes)</small>".html_safe,
    mother_residency_id: "¿En qué estado de la República Mexicana vive o vivía tu madre?",
    mother_education_grade_id: "¿Cuál fue el último grado escolar que terminó tu madre?",
    father_is_employed: "¿Tu padre trabajaba?",
    father_has_healthcare: "¿Tu padre contaba con acceso a servicios médicos del IMSS o del ISSSTE?",
    father_job_type_id: "¿Tu padre era jornalero, empleado, patrón o trabajador por cuenta propia?",
    father_had_employees: "¿Tu padre tenía empleados a su cargo?",
    father_is_alive: "¿Tu padre vive?",
    mother_is_alive: "¿Tu madre vive?",
  }.freeze

  def self.label_for(column)
    DATA[column] || "No label for #{column}"
  end

end
