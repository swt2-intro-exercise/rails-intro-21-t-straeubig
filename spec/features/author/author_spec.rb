require 'rails_helper'

describe "Author index page", :type => :feature do
    it "should exist at 'authors_path' and render withour error" do
        # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
        visit authors_path
    end

    it "should show Names and Homepages" do
        visit authors_path
        expect(page).to have_text "Name"
        expect(page).to have_text "Homepage"
    end

    it "should contain a link to add new authors" do
        visit authors_path
        expect(page).to have_link 'New', href: new_author_path
    end

    context "with author named Alan Turing" do
        alan = FactoryBot.create :author
        it "should have a link to delete an Alan Turing" do
            visit authors_path
            prev_count = Author.count
            expect(page).to have_selector(:css, "a[data-method='delete'][href='/authors/%d']" % [alan.id])
            link = page.find(:css, "a[data-method='delete'][href='/authors/%d']" % [alan.id])
            link.click
            expect(Author.count).to eq(prev_count - 1)
        end

    end
end