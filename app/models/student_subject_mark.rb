class StudentSubjectMark < ActiveRecord::Base

  attr_accessible :student_id, :subject_id, :mark

  validates :mark, numericality: { greater_than: 0, less_than: 6 }

  belongs_to :student
  belongs_to :subject

end
