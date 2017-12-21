require 'rails_helper'

RSpec.feature 'New Course', type: :feature do
  scenario 'User creates a new course' do
    visit '/courses/new'

    fill_in 'From', with: '2011-06-01'
    fill_in 'To', with: '2012-01-01'
    click_button 'Create Course'

    expect(page).to have_text('Course was successfully created.')
  end
end
