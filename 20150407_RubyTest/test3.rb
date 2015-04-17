courses = [ { 'M2001' => [ '数学２-１', 4 ] },
			{ 'E1001' => [ '英語１', 2 ] },
			{ 'H3001' => [ '歴史３-１', 3 ] } ]

COURSE_ID = 0


# 教師リスト： 教師 ID => [ 教師名, [ 担当コース ID のリスト ] ]
teachers = [ { 1 => [ '佐藤', [ 'T4004', 'E1001' ] ] }, 
			 { 2 => [ '鈴木', [ 'M2001', 'M2002' ] ] },
			 { 3 => [ '田中', [ 'E1001', 'M2001' ] ] } ]

TEACHER_NAME = 0
TEACHER_COURSE_ID = 1

courses.each do | course |
		course.each do | c_id, c_content |
				puts "◆#{ c_content[ COURSE_ID ] }の担当教員名 ◆"
				teachers.each do | teacher |
						teacher.each_value do | t_information |
								t_information[ TEACHER_COURSE_ID ].each do | t_course_id |	
										if t_course_id == c_id
												puts t_information[ TEACHER_NAME ]
										end
								end
						end
				end
		end
end
