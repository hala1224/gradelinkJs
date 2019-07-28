class GradesController < ApplicationController
before_action :set_grade, only: [:show, :edit, :update, :destroy]

  def new
    @students = Student.all
    @course = Course.find_by_id(params[:course_id])
    @grade = @course.grades.build
  end

  def create
    @grade = Grade.new(grade_params)
    @course = Course.find_by_id(params[:course_id])
    if @grade.save
        redirect_to grade_path(@grade)
    else
        @students = Student.all
        render :new
      end
    end


#  Showing individual grade

    def show
     @course = Course.find_by_id(@grade.course_id)
    end

    def index
        @students = Student.all
        if @course = Course.find_by_id(params[:course_id])
            @grades = @course.grades.order(:student_id)
        else
            @grades = Grade.all
        end
    end


    def edit
      @course = Course.find_by_id(params[:id])
      @student = Student.find_by_id(@grade.student_id)
    end

    def update
      @grade.update(grade_params)
      @grade.save
      redirect_to grade_path(@grade)
    end

    def destroy
      @grade.destroy
      redirect_to grades_path
    end

    private

    def set_grade
        @grade = Grade.find_by(id: params[:id])
        if !@grade
          redirect_to grades_path
        end
      end


    def grade_params
        params.require(:grade).permit(:value, :comment, :student_id, :course_id, student_attributes: [:first_name, :last_name])
    end

end
