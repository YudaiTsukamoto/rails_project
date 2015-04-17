class Course

	def initialize(course_id, course_name, course_units)
		@course_id = course_id
		@course_name = course_name
		@course_units = course_units
	end

end

class Teacher

	def initialize(teacher_id, teaher_name, teacher_course_id)
		@teacher_id = teacher_id
		@teacher_name = teacher_name
		@teacher_course_id = teacher_course_id
	end
	
end