require 'rails_helper'

RSpec.feature 'Wizard management' do
  scenario 'Visitor adds a wizard' do
    visit new_wizard_path
    fill_in 'Name', with: 'Rincewind'
    click_on 'Save'

    expect(page).to have_content('Rincewind')
    expect(page).to have_content('Number of wizards: 1')
  end

  scenario 'Visitor adds a duplicate Wizard' do
    Wizard.create(name: 'Rincewind')

    visit new_wizard_path
    fill_in 'Name', with: 'Rincewind'
    click_on 'Save'

    expect(page).to have_content('Name has already been taken')
  end
end