class Student < ApplicationRecord
  validates :name, presence: true
  validates :lastname, presence: true
  validates :identification, presence: true
  validates :identification, uniqueness: true
  validates :identification, numericality: { only_integer: true,
                                             greater_than: 0 }
  validates :number, presence: true
  validates :number, uniqueness: true
  validates :number, format: { with: /\A\d+\/\d\z/ }
end
