require 'rails_helper'

RSpec.describe Paper, type: :model do
  context "with valid attributes" do
    paper = FactoryBot.create :paper
    it "should have an author" do
      expect(paper.authors).to_not be_empty
    end
  end
end
