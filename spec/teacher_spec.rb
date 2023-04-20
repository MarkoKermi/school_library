require './person'
require './teacher'

RSpec.describe Teacher do
  describe '#initialize' do
    context 'when initialized with valid input' do
      let(:teacher) { Teacher.new(age: 35, name: 'John Smith', specialization: 'Math') }

      it 'creates a new Teacher object' do
        expect(teacher).to be_an_instance_of(Teacher)
      end

      it 'assigns the age correctly' do
        expect(teacher.age).to eq(35)
      end

      it 'assigns the name correctly' do
        expect(teacher.name).to eq('John Smith')
      end

      it 'assigns the specialization correctly' do
        expect(teacher.specialization).to eq('Math')
      end

      it 'assigns parent permission to true by default' do
        expect(teacher.parent_permission).to be true
      end
    end
  end

  describe '#can_use_services?' do
    context 'when called' do
      let(:teacher) { Teacher.new(age: 35, name: 'John Smith', specialization: 'Math') }

      it 'returns true' do
        expect(teacher.can_use_services?).to be true
      end
    end
  end
end
