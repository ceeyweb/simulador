class Institution < ApplicationRecord
  has_many :users

  validates :name, presence: true

  def self.find_by_id_or_create(id_or_name)
    return if id_or_name.blank?

    find_by(id: id_or_name) ||
      find_by(name: id_or_name) ||
      create!(name: id_or_name)
  end
end
