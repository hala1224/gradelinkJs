class GradesController < ApplicationController


  def new
    @students = Student.all.order(:last_name)
    @course = Course.find_by_id(params[:course_id])
    @grade = @course.grades.build #has_many & grade belongs_to course
  end

  def create
    @grade = Grade.new(grade_params)
    @grade.course_id = grade_params[:course_id]
    @grade.student_id = grade_params[:student_id]
    @course = Course.find_by_id(params[:course_id])
    if @grade.save
        redirect_to grade_path(@grade)
    else
        @students = Student.all.order(:last_name)
        render :new
      end
    end


#  Showing individual grade

    def show
     set_grade
     # @grade = Grade.find_by_id(params[:id])
     @course = Course.find_by_id(@grade.course_id)
     # @student = Student.find_by_id(@grade.student_id)
    end

    def index
      #how do i check if it's nested & a valid id
        @students = Student.all.order(:last_name)
        if @course = Course.find_by_id(params[:course_id])
        #nested
          @grades = @course.grades
         # <li><%= g.course.coursename%>: <%= link_to g.value, grade_path(g)%> - <%= g.comment%></li> <br>
          
      else
        #it's not nested
        # @course = Course.find_by_id(params[:course_id])
        @grades = Grade.all
      end

    end


    def edit
      set_grade
      # @grade = Grade.find_by_id(params[:id])
      @course = Course.find_by_id(params[:id])
      @student = Student.find_by_id(@grade.student_id)
    end

    def update
      set_grade
      # @grade = Grade.find_by_id(params[:id])
      @grade.update(grade_params)
      @grade.save
      redirect_to grade_path(@grade)
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

    # def course_params
    #   params.require(:course).permit(:id, :coursename, :user_id, user_attributes: [:username])
    #   # , student_attributes: [:first_name, :last_name])
    # end

end
