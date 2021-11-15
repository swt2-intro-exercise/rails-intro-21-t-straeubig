require 'rails_helper'

describe "Show author page", type: :feature do
  context "with author named Alan Turing" do
    alan = FactoryBot.create :author
    it "should display the last_name Turing" do
      visit author_path(alan)
      expect(page).to have_text('Turing')
    end
  end
end
