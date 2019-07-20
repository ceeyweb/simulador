class QuestionsAdapter

  DATA = {
    edad: "¿Cuál es tu edad?",
    estado_residencia: "¿En qué Estado de la República Mexicana vives?",
    ultimo_grado_cursado: "¿Cuál fue el último grado escolar que terminaste?",
    sexo: "¿Cuál es tu sexo?",
    asistes_escuela: "¿Asistes a la escuela actualmente?",
  }.freeze

  def self.label_for(column)
    DATA[column]
  end

end
