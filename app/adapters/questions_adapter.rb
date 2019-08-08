class QuestionsAdapter

  DATA = {
    age_id: "¿Cuál es tu edad?",
    residency_id: "¿En qué Estado de la República Mexicana vives?",
    grade_id: "¿Cuál fue el último grado escolar que terminaste?",
    sex: "¿Cuál es tu sexo?",
    do_you_go_to_school: "¿Asistes a la escuela actualmente?",
    actualmente_trabajas: "¿Actualmente trabajas?",
    tipo_de_trabajo: "¿Eres...?",
    tiempo_trabajo: "¿Trabajas de tiempo completo o medio tiempo?",
    tienes_empleados: "¿Tienes empleados a tu cargo?",
    sector_empleo: "¿En qué sector trabajas?",
    cuenta_con_servicios_medicos: "¿Cuentas con acceso a servicios médicos del IMSS o del ISSSTE?",
    en_hogar_habia_celular: "Teléfono celular",
    en_hogar_habia_telefono_fijo: "Teléfono fijo",
    en_hogar_habia_internet: "Acceso a internet",
    en_hogar_habia_estufa: "Estufa de gas o eléctrica",
    en_hogar_habia_refri: "Refrigerador",
    en_hogar_habia_calentador: "Calentador de agua (boiler, solar)",
    en_hogar_habia_tostador: "Tostador eléctrico de pan",
    en_hogar_habia_agua: "Agua entubada dentro de la vivienda",
    en_hogar_habia_bano: "Baño dentro de la vivienda",
    en_hogar_habia_electricidad: "Electricidad",
    father_age_id: "¿Cuál es la edad de tu padre?",
    father_residency_id: "¿En qué Estado de la República Mexicana vive tu padre?",
    father_grade_id: "¿Cuál fue el último grado escolar que terminó tu padre?",
    mother_age_id: "¿Cuál es la edad de tu madre?",
    mother_residency_id: "¿En qué Estado de la República Mexicana vive tu madre?",
    mother_grade_id: "¿Cuál fue el último grado escolar que terminó tu madre?",
    father_is_employed: "Cuando tenías 14 años ¿tu padre trabajaba?",
    father_has_healthcare: "¿Tu padre contaba con acceso a servicios médicos del IMSS o del ISSSTE?",
    father_job_type: "¿Tu padre era jornalero, empleado, patrón o trabajador por cuenta propia?",
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
