class Patient < ApplicationRecord
  belongs_to :provider

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true, numericality: { greater_than: 0 }
  validates :sex, presence: true, inclusion: { in: %w(Male Female) }
  validates :medical_notes, presence: true
end
