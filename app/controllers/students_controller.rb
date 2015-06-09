class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def create
    @student = Student.create(permitted_params)
    puts @student.errors.full_messages
    respond_with @student, location: -> { student_path(@student) }
  end

  def show
    @student = Student.find(params[:id])
  end

  private
    def permitted_params
      params.require(:student).permit(:year, grades_attributes: [:id, :course_id, :percentage])
    end
end
