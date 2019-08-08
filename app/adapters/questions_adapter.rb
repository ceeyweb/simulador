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
    padre_trabajaba: "Cuando tenías 14 años... ¿Tu padre trabajaba?",
    cuenta_con_servicios_medicos_padre: "¿Tu padre contaba con acceso a servicios médicos del IMSS o del ISSSTE?",
    tipo_de_trabajo_padre: "¿Tu padre era...?",
    tenia_empleados_padre: "¿Tu padre tenía empleados a su cargo?",
    cuantos_empleados_padre: "¿Cuántos empleados tenía a su cargo?",
    tiempo_trabajo_padre: "¿Tu padre trabajaba de tiempo completo o medio tiempo?",
    sector_empleo_padre: "¿En qué sector trabajaba tu padre?",
  }.freeze

  def self.label_for(column)
    DATA[column] || "No label for #{column}"
  end

end
