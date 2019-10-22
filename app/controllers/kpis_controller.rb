class KpisController < ApplicationController

  before_action :set_school_year

  def health
    kpis = {
      life_expectancy: LifeExpectancy.new(
        user.age,
        user.sex_id,
        user.residency_id,
        user.school_year,
      ).value.round,
    }

    render json: kpis.as_json
  end

  def work
    kpis =
      if user.is_employed?
        employed_user_kpis
      else
        unemployed_user_kpis
      end

    render json: kpis.as_json
  end

  def education
    kpis =
      {
        education_achievement: EducationAchievement.new(
          user.age,
          user.school_year,
        ).value.round,
        average_income: AverageIncome.new(
          user.sex_id,
          params[:education_level_id],
          user.region.id,
        ).value.round,
      }

    render json: kpis.as_json
  end

  private

  def employed_user_kpis
    {
      keep_formal_work_probability: KeepFormalWorkProbability.new(
        work_kpis,
      ).value.round,
    }
  end

  def unemployed_user_kpis
    {
      work_probability: WorkProbability.new(work_kpis).value.round,
      formal_work_probability: FormalWorkProbability.new(work_kpis).value.round,
    }
  end

  def user
    @user ||= User.find(cookies["user_id"])
  end

  def work_kpis
    @work_kpis ||= WorkKpisUser.new(user).kpis
  end

  def set_school_year
    user.school_year = school_year
  end

  def school_year
    EducationLevel.find(params[:education_level_id]).max_school_year
  end

end
