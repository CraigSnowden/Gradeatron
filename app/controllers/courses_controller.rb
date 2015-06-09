class CoursesController < ApplicationController
  def show
    @grades = Course.find_by_acronym(params[:id]).grades
  end
end
