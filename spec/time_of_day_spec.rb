describe 'TimeOfDay' do
	it 'should convert midnight' do
		expect(SolCal::TimeOfDay.new(0).to_s).to eql("00:00")
	end

	it 'should convert noon' do
		expect(SolCal::TimeOfDay.new(0.5).to_s).to eql("12:00")
	end

	it 'should convert arbitrary time' do
		expect(SolCal::TimeOfDay.new(0.352032).to_s).to eql("08:26")
	end
end