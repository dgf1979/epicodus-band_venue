require('spec_helper')

describe(Venue) do
  describe('#name') do
    it('upcases venue names') do
      venue = Venue.create(name: 'doug fir')
      expect(venue.name).to(eq('Doug Fir'))
    end

    it('requires name param to create new') do
      venue = Venue.create()
      expect(venue.id).to(eq(nil))
    end

    it('requires unique venue names') do
      venue = Venue.create(name: 'wonder ballroom')
      venue_clone = Venue.create(name: 'wonder ballroom')
      expect(venue_clone.id).to(eq(nil))
    end
  end
end
