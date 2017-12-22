require 'rails_helper'

RSpec.describe "students/index", type: :view do
  before(:each) do
    assign(:students, [
      Student.create!(
        :name => "Name",
        :lastname => "Lastname",
        :identification => 2,
        :number => "Number"
      ),
      Student.create!(
        :name => "Name",
        :lastname => "Lastname",
        :identification => 2,
        :number => "Number"
      )
    ])
  end

  it "renders a list of students" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Lastname".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Number".to_s, :count => 2
  end
end
