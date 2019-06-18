class GradesController < ApplicationController

  def new
    @students = Student.all.order(:last_name)
    if @course = Course.find_by_id(params[:course_id])
        # nested route
        @grade = @course.grades.build #has_many
        # grade belongs_to course
    else
    #   # unnested
      @grade = Grade.new
   end
  end

  def create
    @students = Student.all.order(:last_name)
    # Selecting courses' students
    # Creating all student grades for now
      temp=[]
      @students.all.each do |student|
        # Need to check if the student is in the course???
        # if student.course_id = current_user.course_id
          # s.push(student)
        # end
        byebug
        @grade = student.grades.build(grade_params)
        @grade.save
        temp.push(@grade)
      end
      @grades = temp
      if @grades == nil
        render :new
      end


      # @current_student = Student.find_by_id(params[:student_id])
      # @grade = @current_student.grades.build(grade_params)
      if @grades
        # redirect_to grades_path(@grades)
        redirect_to course_grades_path(@grades)
      else
        render :new
      end
    end

    def show
      # @grade = Grade.find_by_id(params[:id])
      @course = Course.find_by_id(params[:course_id])
      @grade = Grade.all
      @students = Student.all.order(:last_name)

    end

    def index
      #how do i check if it's nested & a valid id
        if @course = Course.find_by_id(params[:course_id])
        #nested
         @grades = @course.grades

      else
        #it's not nested
        @course = Course.find_by_id(params[:course_id])
        @students = Student.all
        @grades = Grade.all
        # byebug
      end
    end

    def edit
    end

    private

    def grade_params
        params.require(:grade).permit(:student_id, :course_id, :value, :comment)
    end



end
