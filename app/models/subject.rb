class Subject < ActiveRecord::Base

  attr_accessible :name

  has_many :students_subjects_marks
  has_many :students, through: :students_subjects_marks

end
