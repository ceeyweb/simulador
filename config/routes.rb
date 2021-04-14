Rails.application.routes.draw do
  root "landing_pages#home"

  get "questions/start", as: :question_start
  get "questions/part_2", as: :question_part_2
  get "questions/part_3", as: :question_part_3

  get "simulator/start", as: :simulator_start
  get "simulator/part_2", as: :simulator_part_2
  get "simulator/part_3", as: :simulator_part_3
  get "simulator/finish", as: :finish

  get "kpis/health"
  get "kpis/work"
  get "kpis/education"

  resources :users, only: %i[create update]

  namespace :admin do
    get  "/",         to: redirect("admin/download"), as: :root

    get  "/sign_in",  to: "sessions#new"
    post "/sign_in",  to: "sessions#create"
    get  "/sign_out", to: "sessions#destroy"
    get  "download",  to: "download#new"
    post "download",  to: "download#create"
  end
end
