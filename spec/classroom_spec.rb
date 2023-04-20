require_relative '../classroom'
require_relative '../student'

RSpec.describe Classroom do
  let(:label) { 'Class A' }
  let(:classroom) { Classroom.new(label) }
  let(:student) { Student.new(name: 'John Doe') }

  describe '#initialize' do
    it 'sets the label' do
      expect(classroom.label).to eq(label)
    end

    it 'initializes an empty list of students' do
      expect(classroom.students).to be_empty
    end
  end

  describe '#add_student' do
    it 'adds the student to the list' do
      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end
    it 'sets the student classroom attribute' do
      classroom.add_student(student)
      expect(student.classroom).to eq(classroom)
    end
  end
end
