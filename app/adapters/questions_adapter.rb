class QuestionsAdapter

  DATA = {
    age: "¿Cuál es tu edad?",
    residency_id: "¿En qué Estado de la República Mexicana vives?",
    education_grade_id: "¿Cuál fue el último grado escolar que terminaste?",
    has_healthcare: "¿Cuentas con acceso a servicios médicos del IMSS o del ISSSTE o de alguna institución privada?",
    sex_id: "¿Cuál es tu sexo?",
    is_student: "¿Asistes a la escuela actualmente?",
    is_employed: "¿Trabajas actualmente?",
    is_first_job: "¿Es este tu primer empleo?",
    has_employees: "En tu primer empleo, ¿tienes o tuviste empleados a tu cargo?",
    job_type_id: "¿Eres jornalero, empleado, patrón o trabajador por cuenta propia?",
    job_employees_group_id: "En tu empleo, ¿cuántos empleados tienes a tu cargo?",
    father_job_employees_group_id: "¿Cuántos empleados tenía tu padre a su cargo?",
    job_schedule_id: "En tu empleo, ¿trabajas de tiempo completo o medio tiempo?",
    job_sector_id: "¿En qué sector trabajas?",
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
    father_age: "¿Cuál es la edad de tu padre?",
    father_residency_id: "¿En qué Estado de la República Mexicana vive tu padre?",
    father_education_grade_id: "¿Cuál fue el último grado escolar que terminó tu padre?",
    mother_age: "¿Cuál es la edad de tu madre?",
    mother_residency_id: "¿En qué Estado de la República Mexicana vive tu madre?",
    mother_education_grade_id: "¿Cuál fue el último grado escolar que terminó tu madre?",
    father_is_employed: "Cuando tenías 14 años ¿tu padre trabajaba?",
    father_has_healthcare: "¿Tu padre contaba con acceso a servicios médicos del IMSS o del ISSSTE?",
    father_job_type_id: "¿Tu padre era jornalero, empleado, patrón o trabajador por cuenta propia?",
    father_has_employees: "¿Tu padre tenía empleados a su cargo?",
    mother_is_employed: "Cuando tenías 14 años ¿tu madre trabajaba?",
    mother_has_healthcare: "¿Tu madre contaba con acceso a servicios médicos del IMSS o del ISSSTE?",
    mother_job_type: "¿Tu madre era jornalera, empleada, patrona o trabajadora por cuenta propia?",
    mother_has_employees: "¿Tu madre tenía empleados a su cargo?",
  }.freeze

  def self.label_for(column)
    DATA[column] || "No label for #{column}"
  end

end
