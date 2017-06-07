class Company < ApplicationRecord
    validates :name, :profile, :number_of_employees, :logo, :banner, :trademark, :website, :user_id, presence: true, on: :update
              
    belongs_to :user
end
