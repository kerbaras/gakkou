require 'rails_helper'

RSpec.describe "enrollments/edit", type: :view do
  before(:each) do
    @enrollment = assign(:enrollment, Enrollment.create!(
      :student => nil,
      :course => nil
    ))
  end

  it "renders the edit enrollment form" do
    render

    assert_select "form[action=?][method=?]", enrollment_path(@enrollment), "post" do

      assert_select "input[name=?]", "enrollment[student_id]"

      assert_select "input[name=?]", "enrollment[course_id]"
    end
  end
end
