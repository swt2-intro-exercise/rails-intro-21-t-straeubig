require 'rails_helper'

describe "Edit author page", type: :feature do

  context "with author named Alan Turing" do
    alan = FactoryBot.create :author

    it "should exist at 'edit_author_path' and render withour error" do
      visit edit_author_path(alan)
    end

    it "should have text inputs for an author's first name, last name, and homepage" do
      visit edit_author_path(alan)

      expect(page).to have_field('author[first_name]')
      expect(page).to have_field('author[last_name]')
      expect(page).to have_field('author[homepage]')
    end

    it "should update the authors" do
      visit edit_author_path(alan)

      page.fill_in 'author[last_name]', with: 'Turning'
      find('input[type="submit"]').click
      alan.reload
      expect(alan.last_name).to eq('Turning')
    end
  end
end
