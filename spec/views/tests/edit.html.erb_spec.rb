require 'rails_helper'

RSpec.describe "tests/edit", type: :view do
  before(:each) do
    @test = assign(:test, Test.create!(
      :course => nil,
      :title => "MyString",
      :base_grade => 1,
      :upper_grade => 1
    ))
  end

  it "renders the edit test form" do
    render

    assert_select "form[action=?][method=?]", test_path(@test), "post" do

      assert_select "input[name=?]", "test[course_id]"

      assert_select "input[name=?]", "test[title]"

      assert_select "input[name=?]", "test[base_grade]"

      assert_select "input[name=?]", "test[upper_grade]"
    end
  end
end
