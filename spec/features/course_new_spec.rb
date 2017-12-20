require 'rails_helper'

RSpec.feature 'New Course', type: :feature do
  scenario 'User creates a new course' do
    visit '/courses/new'

    fill_in 'From', with: Date.new(2017, 8)
    fill_in 'To', with: Date.new(2018, 2)
    click_button 'Create Course'

    expect(page).to have_text('Course was successfully created.')
  end
end
