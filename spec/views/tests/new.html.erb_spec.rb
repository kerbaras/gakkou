require 'rails_helper'

RSpec.describe "tests/new", type: :view do
  before(:each) do
    assign(:test, Test.new(
      :course => nil,
      :title => "MyString",
      :base_grade => 1,
      :upper_grade => 1
    ))
  end

  it "renders new test form" do
    render

    assert_select "form[action=?][method=?]", tests_path, "post" do

      assert_select "input[name=?]", "test[course_id]"

      assert_select "input[name=?]", "test[title]"

      assert_select "input[name=?]", "test[base_grade]"

      assert_select "input[name=?]", "test[upper_grade]"
    end
  end
end
