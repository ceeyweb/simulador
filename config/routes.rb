Rails.application.routes.draw do
  root "landing_pages#home"

  get "questions/start", as: :question_start
  get "questions/part_2", as: :question_part_2
  get "questions/part_3", as: :question_part_3

  get "simulator/start", as: :simulator
  get "simulator/part_2", as: :simulator_part_2
  get "simulator/part_3", as: :simulator_part_3
end
