class Teacher

		def initialize( teacher_id, teacher_name, teacher_course_id )

				@teacher_id = teacher_id 
				@teacher_name =  teacher_name
				@teacher_course_id = teacher_course_id

		end
end


class ParttimeTeacher < Teacher

		def initialize(teacher_id, teacher_name, teacher_course_id, working_day)

				super(teacher_id, teacher_name, teacher_course_id)
				@working_day =  working_day

		end

end