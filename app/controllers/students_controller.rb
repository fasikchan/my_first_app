class StudentsController < ApplicationController

  def group_validation
    a = [101, 102, 103, 104, 201, 202, 203, 204, 301, 302, 303, 304, 401, 402, 403, 404]
    return a
  end

  def index
    @students = Student.all
  end

  def new
    @valid_groups = group_validation
    @student = Student.new
  end

  def create
    @valid_groups = group_validation
    @student = Student.create( params[:student] )
    if @student.errors.empty?
      redirect_to action: "index"
    else
      render "new"
    end
  end

  def show
    unless @student = Student.where(id: params[:id]).first
      render :text => "Page NOT found", :status => 404
    end
    student_id = params[:id]
    current_sub_mark = StudentSubjectMark.where(student_id: student_id)
    @result = []
    current_sub_mark.each do |i|
      @result << "#{i.subject.name}: #{i.mark}"
    end
  end

  def edit
    @valid_groups = group_validation
    @student = Student.find( params[:id] )
  end

  def update
    @valid_groups = group_validation
    @student = Student.find( params[:id] )
    @student.update_attributes( params[:student] )
    if @student.errors.empty?
      redirect_to action: "index"
    else
      render "edit"
    end
  end

  def destroy
    @student = Student.find( params[:id] )
    @student_subjects_marks = StudentSubjectMark.where(student_id: @student.id)
    @student_subjects_marks.delete_all
    @student.destroy
    redirect_to action: "index"
  end

  def subjects
    @student = Student.find(params[:id])
    @subjects = Subject.all

    @marks = [1, 2, 3, 4, 5]

    @student_marks    = StudentSubjectMark.where(student_id: @student.id)
    @student_subjects = @student_marks.collect(&:subject_id)
    @student_subjects_marks = @student_marks.hashed(by: "subject_id", only: "mark")
  end

  def update_subjects
    @student = Student.find(params[:id])

    @subjects = params[:subjects]

    StudentSubjectMark.delete_all(student_id: @student.id)
    @subjects.each do |s_id|
      StudentSubjectMark.create(student_id: @student.id, subject_id: s_id, mark: params[:marks][s_id])
    end

    redirect_to action: "index"
  end

end
