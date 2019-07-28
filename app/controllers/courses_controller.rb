class CoursesController < ApplicationController

# before_action :set_course

   def index
       @courses = current_user.courses
   end

   def show
      set_course
      @students = Student.all
      @grades = @course.grades
   end

  def new
    @course = Course.new
  end

  def create
    @course = current_user.courses.build(course_params)
    if @course.save
      redirect_to course_path(@course)
    else
      render :new
    end
  end

  def edit
   set_course
  end

  def update
    set_course
    if @course.update(course_params)
      redirect_to course_path(@course)
    else
      render :edit
    end
  end


  def destroy
    set_course
    @course.destroy
    redirect_to courses_path
  end

  private

  def set_course
      @course = Course.find_by(id: params[:id])
      if !@course
        redirect_to courses_path
      end
    end

    def course_params
      params.require(:course).permit(:coursename)
    end

    def grade_params
      params.require(:grade).permit(:value, :comment, :course_id, :student_id)
    end

end
