describe Booking do

  describe 'total_price' do
    it('calculates total cost') do
      create_user
      create_listing
      create_booking
      expect(Booking.first.total_price).to eq(266)
   end
  end

end
