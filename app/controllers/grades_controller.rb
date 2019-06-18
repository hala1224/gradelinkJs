class GradesController < ApplicationController

  def new
    # check if it's nested & it's a proper # ID
    if params[:course_id] && course = Course.find_by_id(params[:course_id])
      # nested route
      @grade = course.grades.build #has_many
    else
      # unnested
      @grade = Grade.new
      @grade.build_course #belongs_to
    end
  end


  def create

  end
end
