class Student < ActiveRecord::Base

  attr_accessible :name, :family, :age, :in_group
  validates :name, :family, :age, :in_group, presence: true
  validates :age, :in_group, numericality: { greater_than: 0 }
  validates :name, :family, length: { minimum: 3 }

  has_many :students_subjects_marks
  has_many :subjects, through: :students_subjects_marks

end
