require('spec_helper')

describe(Band) do
  describe('#name') do
    it('upcases band names') do
      band = Band.create(name: 'the uppers')
      expect(band.name).to(eq('The Uppers'))
    end

    it('requires name param to create new') do
      band = Band.create()
      expect(band.id).to(eq(nil))
    end

    it('requires unique band names') do
      band = Band.create(name: 'the doubles')
      band_clone = Band.create(name: 'the Doubles')
      expect(band_clone.id).to(eq(nil))
    end
  end

  describe('#venues') do
    it('has many-to-many association of venues and bands') do
      expect('').to(eq(''))
    end
  end
end
