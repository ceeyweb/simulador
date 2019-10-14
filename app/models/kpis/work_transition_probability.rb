class Kpis::WorkTransitionProbability < ApplicationRecord

  def self.state(state_id)
    find_by(state_id: state_id)
  end

end
