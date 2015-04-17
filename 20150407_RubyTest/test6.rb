class AddCourseAndTeacher < ActiveRecord::Migration
		def up

				create_table :course do |t|
						t.string :course_id
						t.string :course_name
						t.integer :units
				end

				create_table :teacher do |t|
						t.integer :teacher_id
						t.string :teacher_name
						t.string :teacher_course_id
				end

				add_index :course, :course_id
				add_index :teacher, :teacher_id
		end
