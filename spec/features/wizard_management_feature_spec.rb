require 'rails_helper'

RSpec.feature 'Wizard management' do
  scenario 'Visitor adds a wizard' do
    visit wizards_path
    click_on 'New Wizard'
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

  scenario 'Visitor edits a Wizard' do
    wizard = Wizard.create(name: 'Rincewind')

    visit edit_wizard_path(wizard)
    fill_in 'Name', with: 'Ridcully'
    click_on 'Save'

    expect(page).to have_content('Ridcully')
  end

  scenario 'Visitor deletes a Wizard' do
    Wizard.create(name: 'Rincewind')

    visit wizards_path
    click_on 'Delete'

    expect(page).not_to have_content('Rincewind')
    expect(page).to have_content('Number of wizards: 0')
  end

  scenario 'Visitor visits an existing Wizard' do
    Wizard.create(name: 'Rincewind')

    visit wizards_path
    click_on 'Rincewind'

    expect(page).to have_content('Rincewind')
  end

  scenario 'Visitor searches for a Wizard' do
    Wizard.create(name: 'Gandalf the Grey')

    visit wizards_path
    fill_in 'Search', with: 'Gandalf'
    click_on 'Go'

    expect(page).to have_content('Number of wizards: 1')
  end
end