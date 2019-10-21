class KpisController < ApplicationController

  before_action :set_user

  def health
    kpis = {
      life_expectancy: LifeExpectancy.new(
        @user.age,
        @user.sex_id,
        @user.residency_id,
        @user.school_year,
      ).value.round,
    }

    render json: kpis.as_json
  end

  def work
    work_kpis = WorkKpisUser.new(@user).kpis

    kpis =
      if @user.is_employed?
        {
          keep_formal_work_probability: KeepFormalWorkProbability.new(
            work_kpis,
          ).value.round,
        }
      else
        {
          work_probability: WorkProbability.new(
            work_kpis,
          ).value.round,
          formal_work_probability: FormalWorkProbability.new(
            work_kpis,
          ).value.round,
        }
      end

    render json: kpis.as_json
  end

  def education
    kpis =
      {
        education_achievement: EducationAchievement.new(
          @user.age,
          @user.school_year,
        ).value.round,
        average_income: AverageIncome.new(
          @user.sex_id,
          params[:education_level_id],
          @user.region.id,
        ).value.round,
      }

    render json: kpis.as_json
  end

  private

  def set_user
    @user = User.find(cookies["user_id"])
    @user.school_year = school_year
  end

  def school_year
    EducationLevel.find(params[:education_level_id]).max_school_year
  end

end
