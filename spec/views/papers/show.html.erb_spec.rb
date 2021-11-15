require 'rails_helper'

RSpec.describe "papers/show", type: :view do
  context "with paper from author" do
    alan = FactoryBot.create :author
    before(:each) do
      @paper = assign(:paper, Paper.create!(
        title: "Title",
        venue: "Venue",
        year: 2
      ))
      
      @paper.authors.append(alan)
    end

    it "renders attributes in <p>" do
      render
      expect(rendered).to match(/Title/)
      expect(rendered).to match(/Venue/)
      expect(rendered).to match(/2/)
      expect(rendered).to match(/#{alan.name}/)
    end
  end
end
