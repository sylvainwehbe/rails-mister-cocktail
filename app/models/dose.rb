class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  validates :cocktail, uniqueness: {scope: :ingredient}
  validates :description, presence: true, allow_blank: false
end
