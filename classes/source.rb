require 'securerandom'

class Source
  attr_accessor :name, :items

  def initialize(name)
    @id = SecureRandom.uuid
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.add_source(self)
  end
end

=begin
class Classroom
  attr_reader :students
  attr_accessor :label

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students.push(student)
    student.classrooms(self)
  end
end
=end