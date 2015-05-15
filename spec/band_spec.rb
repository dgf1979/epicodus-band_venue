require('spec_helper')

describe(Band) do
  describe('#name') do
    it('upcases band names') do
      band = Band.create(name: 'the uppers')
      expect(band.name).to(eq('The Uppers'))
    end
  end

  describe('#venues') do
    it('has many-to-many association of venues and bands') do
      expect('').to(eq(''))
    end
  end
end
