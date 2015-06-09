class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end
  
  def show
    @grades = Course.find_by_acronym(params[:id]).grades
  end
end
