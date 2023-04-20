require './student'
require 'rspec'

describe Student do
  let(:classroom) { double('Classroom') }
  let(:student) { described_class.new(age: 10, name: 'John Doe', classroom: classroom) }

  describe '#classroom' do
    it 'returns the classroom of the student' do
      expect(student.classroom).to eq(classroom)
    end
  end

  describe '#play_hooky' do
    it 'returns the string ¯\(ツ)/¯' do
      expect(student.play_hooky).to eq('¯\(ツ)/¯')
    end
  end

  describe '#classroom=' do
    let(:students) { [] }

    before do
      allow(classroom).to receive(:students).and_return(students)
      allow(classroom.students).to receive(:push)
    end

    context 'when the student is already in the classroom' do
      it 'does not add the student to the classroom again' do
        students << student
        student.classroom = classroom
        expect(students.count(student)).to eq(1)
      end
    end
  end
end


