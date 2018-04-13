require 'rails_helper'

RSpec.feature 'Solution management' do
  scenario 'Visitor adds an solution' do
    visit solutions_path
    click_on 'New Solution'
    fill_in 'Solution', with: "R U R' U' R' F R F'"
    click_on 'Save'

    expect(page).to have_content("R U R' U' R' F R F'")
  end

  scenario 'Visitor adds a duplicate Solution' do
    Solution.create(algorithm: "R U R' U' R' F R F'")

    visit new_solution_path
    fill_in 'Solution', with: "R U R' U' R' F R F'"
    click_on 'Save'

    expect(page).to have_content('Solution has already been used')
  end

  scenario 'Visitor edits an Solution' do
    solution = Solution.create(algorithm: "R U R' U' R' F R F'")

    visit edit_solution_path(solution)
    fill_in 'Solution', with: "R U R' U'"
    click_on 'Save'

    expect(page).to have_content("R U R' U'")
  end

  scenario 'Visitor deletes an Solution', :pending do
    Solution.create(algorithm: "R U R' U' R' F R F'")

    visit solutions_path
    click_on 'Delete'

    expect(page).not_to have_content("R U R' U' R' F R F'")
    expect(page).to have_content('Number of solutions: 0')
  end

  scenario 'Visitor visits an existing Solution' do
    Solution.create(algorithm: "R U R' U' R' F R F'")

    visit solutions_path
    click_on "R U R' U' R' F R F'"

    expect(page).to have_content("R U R' U' R' F R F'")
  end

  scenario 'Visitor searches for an Solution' do
    Solution.create(algorithm: "F R U' R' R U R' F' R U R' F R F'")

    visit solutions_path
    fill_in 'Search', with: 'R U R'
    click_on 'Go'

    expect(page).to have_content("F R U' R' R U R' F' R U R' F R F")
  end
end
