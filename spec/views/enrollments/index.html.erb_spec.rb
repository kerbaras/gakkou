require 'rails_helper'

RSpec.describe "enrollments/index", type: :view do
  before(:each) do
    assign(:enrollments, [
      Enrollment.create!(
        :student => nil,
        :course => nil
      ),
      Enrollment.create!(
        :student => nil,
        :course => nil
      )
    ])
  end

  it "renders a list of enrollments" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
