require('spec_helper')
require('capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('Sinatra framework check', { :type => :feature }) do
  it('verifies basic routing and view setup') do
    visit('/test')
    expect(page).to have_content('Sinatra OK')
  end
end

describe('Application Testing:', { :type => :feature }) do

  describe('Band:') do
    it('lists all bands') do
      band1 = Band.create(name: 'The fabulous stains')
      band2 = Band.create(name: 'Hootie and the Blowfish')
      visit('/bands')
      expect(page).to have_content(band1.name)
      expect(page).to have_content(band2.name)
    end

    it('adds a new band') do
      visit('/bands')
      fill_in('name', with: 'Muse')
      click_button('Add')
      expect(page).to have_content('Muse')
    end

    it('updates an existing band name') do
      band = Band.create(name: 'Abba')
      visit("/bands/#{band.id}/edit")
      fill_in('name', with: 'The Rolling Stones')
      click_button('Update')
      expect(page).to_not(have_content('Abba'))
      expect(page).to(have_content('The Rolling Stones'))
    end

    it('deletes an existing band') do
      band = Band.create(name: 'Abba')
      visit("/bands/#{band.id}/edit")
      click_button('Delete')
      expect(page).to_not(have_content('Abba'))
    end
  end

  describe('Venue:') do
    it('lists all bands') do
      venue1 = Band.create(name: 'The Greek')
      venue2 = Band.create(name: 'Woodstock')
      visit('/bands')
      expect(page).to have_content(venue1.name)
      expect(page).to have_content(venue2.name)
    end

    it('adds a new venue') do
      visit('/venues')
      fill_in('name', with: 'The Greek')
      click_button('Add')
      expect(page).to have_content('The Greek')
    end
  end

end
