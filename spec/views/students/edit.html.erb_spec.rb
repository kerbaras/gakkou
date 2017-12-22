require 'rails_helper'

RSpec.describe "students/edit", type: :view do
  before(:each) do
    @student = assign(:student, Student.create!(
      :name => "MyString",
      :lastname => "MyString",
      :identification => 1,
      :number => "MyString"
    ))
  end

  it "renders the edit student form" do
    render

    assert_select "form[action=?][method=?]", student_path(@student), "post" do

      assert_select "input[name=?]", "student[name]"

      assert_select "input[name=?]", "student[lastname]"

      assert_select "input[name=?]", "student[identification]"

      assert_select "input[name=?]", "student[number]"
    end
  end
end
