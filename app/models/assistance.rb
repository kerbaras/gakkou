class Assistance < ApplicationRecord
  belongs_to :enrollment
  belongs_to :test

  validates :grade, numericality: { greater_than_or_equal_to: 0,
                                    less_than_or_equal_to: :max }, allow_blank: true
  validates :test, presence: true
  validates :enrollment, presence: true
  validates :enrollment, uniqueness: { scope: :test }
  validate do |assistance|
    unless assistance.test.course == assistance.enrollment.course
      assistance.errors.add(%i[test enrollment],
                            'The student and the test must share the course')
    end
  end

  delegate :course, to: :test
  delegate :max, to: :test

  def approved?
    test.approved? grade
  end
end
