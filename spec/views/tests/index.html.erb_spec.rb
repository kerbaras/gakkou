require 'rails_helper'

RSpec.describe "tests/index", type: :view do
  before(:each) do
    assign(:tests, [
      Test.create!(
        :course => nil,
        :title => "Title",
        :base_grade => 2,
        :upper_grade => 3
      ),
      Test.create!(
        :course => nil,
        :title => "Title",
        :base_grade => 2,
        :upper_grade => 3
      )
    ])
  end

  it "renders a list of tests" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
