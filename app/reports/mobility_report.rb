class MobilityReport
  attr_reader :start_date, :end_date, :error

  def initialize(start_date: nil, end_date: nil)
    @start_date = start_date
    @end_date   = end_date

    validate_dates!
  end

  def csv
    Enumerator.new do |lines|
      lines << CSV::Row.new(columns.keys, columns.values, true).to_s

      filtered_users.find_each(batch_size: 10) do |user|
        lines << CSV::Row.new(columns.keys, values_for(user)).to_s
      end
    end
  end

  def valid?
    @error.blank?
  end

  private

  def filtered_users
    users = User.includes(
      :age_group, :residency, :education_grade, :sex,
      :father_residency, :father_education_grade, :father_job_type,
      :mother_residency, :mother_education_grade, :institution
    )

    users = users.where("created_at >= ?", start_date) if start_date.present?
    users = users.where("created_at <= ?", end_date)   if end_date.present?

    users
  end

  def validate_dates!
    if start_date.present? && end_date.present? && start_date > end_date
      @error = "La fecha de fin debe ser mayor a la fecha de inicio."
    end
  end

  def values_for(user)
    columns.keys.map do |column|
      value = user.send(column)

      case value
      when nil      then "-"
      when 0, true  then "sí"
      when 1, false then "no"
      when 2        then "No sabe/No aplica"
      else value.try(:description) || value
      end
    end
  end

  def columns
    {
      updated_at: "fecha",
      institution: "institución",
      sex: "sexo",
      age: "edad",
      age_group: "grupo de edad",
      residency: "residencia",
      education_grade: "educación",
      is_student: "estudia?",
      is_employed: "trabaja?",
      is_first_job: "primer empleo?",
      has_employees: "empleados a cargo?",
      has_healthcare: "cuenta con servicios médicos?",
      father_is_alive: "padre vive?",
      father_age: "edad padre",
      father_residency: "residencia padre",
      father_education_grade: "educación padre",
      father_is_employed: "padre trabajaba?",
      father_has_healthcare: "padre contaba con servicios médicos?",
      father_job_type: "tipo empleo padre",
      father_had_employees: "padre tenía empleados?",
      mother_is_alive: "madre vive?",
      mother_age: "edad madre",
      mother_residency: "residencia madre",
      mother_education_grade: "educación madre",
      home_had_mobile_phone: "en casa había teléfono celular?",
      home_had_fixed_phone: "en casa había teléfono fijo?",
      home_had_internet: "en casa había internet?",
      home_had_stove: "en casa había estufa?",
      home_had_fridge: "en casa había refrigerador?",
      home_had_heater: "en casa había calentador?",
      home_had_toaster: "en casa había tostador?",
      home_had_water: "en casa había agua?",
      home_had_bathroom: "en casa había baño?",
      home_had_electricity: "en casa había electricidad?",
      home_had_washer: "en casa había lavadora?",
    }
  end
end
