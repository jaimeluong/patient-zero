class Provider < ApplicationRecord
    has_many :patients
    has_many :appointments

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :position, inclusion: { in: %w(Doctor Nurse Assistant) }
end
