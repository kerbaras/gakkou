class Test < ApplicationRecord
  belongs_to :course
  has_many :assistances

  validates :date, presence: true
  validates :date, uniqueness: { scope: :course }
  validates :title, presence: true
  validates :course, presence: true
  validates :min, presence: true
  validates :min, numericality: { only_integer: true, greater_than: 0 }
  validates :max, presence: true
  validates :max, numericality: { only_integer: true, greater_than: :min }
  validate :date_lapse

  def date_lapse
    errors.add(:date, 'must be in the course') if
      !course.nil? &&
      !((course.from..course.to) === date)
  end

  def approved?(grade)
    grade >= min
  end

  delegate :ammount_students, to: :course

  def ammount_assistences
    assistances.size
  end

  def fail_ammount
    ammount_assistences - approved_ammount
  end

  def absent_ammount
    ammount_students - ammount_assistences
  end

  def assistances_approved
    assistances.select(&:grade?).select(&:approved?)
  end

  def approved_ammount
    assistances_approved.size
  end

  def porcent_approved
    approved_ammount / ammount_assistences.to_f * 100
  end
end
