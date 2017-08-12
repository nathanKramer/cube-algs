require 'rails_helper'

RSpec.feature 'Algorithm management' do
  scenario 'Visitor adds an algorithm' do
    visit algorithms_path
    click_on 'New Algorithm'
    fill_in 'Algorithm', with: "R U R' U' R' F R F'"
    click_on 'Save'

    expect(page).to have_content("R U R' U' R' F R F'")
  end

  scenario 'Visitor adds a duplicate Algorithm' do
    Algorithm.create(algorithm: "R U R' U' R' F R F'")

    visit new_algorithm_path
    fill_in 'Algorithm', with: "R U R' U' R' F R F'"
    click_on 'Save'

    expect(page).to have_content('Algorithm has already been used')
  end

  scenario 'Visitor edits an Algorithm' do
    algorithm = Algorithm.create(algorithm: "R U R' U' R' F R F'")

    visit edit_algorithm_path(algorithm)
    fill_in 'Algorithm', with: "R U R' U'"
    click_on 'Save'

    expect(page).to have_content("R U R' U'")
  end

  scenario 'Visitor deletes an Algorithm', :pending do
    Algorithm.create(algorithm: "R U R' U' R' F R F'")

    visit algorithms_path
    click_on 'Delete'

    expect(page).not_to have_content("R U R' U' R' F R F'")
    expect(page).to have_content('Number of algorithms: 0')
  end

  scenario 'Visitor visits an existing Algorithm' do
    Algorithm.create(algorithm: "R U R' U' R' F R F'")

    visit algorithms_path
    click_on "R U R' U' R' F R F'"

    expect(page).to have_content("R U R' U' R' F R F'")
  end

  scenario 'Visitor searches for an Algorithm' do
    Algorithm.create(algorithm: "F R U' R' R U R' F' R U R' F R F'")

    visit algorithms_path
    fill_in 'Search', with: 'R U R'
    click_on 'Go'

    expect(page).to have_content("F R U' R' R U R' F' R U R' F R F")
  end
end
