require './person'RSpec.describe Person do
	let(:person) { Person.new(age: 25, name: 'John Doe') }  describe '#initialize' do
		it 'sets the age, name, and parent_permission attributes' do
			expect(person.age).to eq(25)
			expect(person.name).to eq('John Doe')
			expect(person.parent_permission).to eq(true)
		end    it 'sets the rentals array to an empty array' do
			expect(person.rentals).to be_empty
		end
	end  describe '#can_use_services?' do
		context 'when the person is of age' do
			let(:person) { Person.new(age: 20) }      it 'returns true' do
				expect(person.can_use_services?).to eq(true)
			end
		end    context 'when the person has parent permission' do
			let(:person) { Person.new(age: 16, parent_permission: true) }      it 'returns true' do
				expect(person.can_use_services?).to eq(true)
			end
		end    context 'when the person does not have parent permission' do
			let(:person) { Person.new(age: 16, parent_permission: false) }      it 'returns false' do
				expect(person.can_use_services?).to eq(false)
			end
		end
	end  describe '#correct_name' do
		it 'returns the name attribute' do
			expect(person.correct_name).to eq('John Doe')
		end
	end
 end