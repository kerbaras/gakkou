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
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with:
                       /\A[a-zA-Z0-9_\-.]+@[a-zA-Z0-9_\-]+\.[a-zA-Z0-9\-.]+\z/ }

  scope :all_except, ->(user) { where.not(id: user) }

  def to_label
    "#{full_name} (#{identification})"
  end

  def full_name
    "#{lastname}, #{name}"
  end
end
