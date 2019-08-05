class GradesController < ApplicationController


  def new
    @students = Student.all
    # .order(:last_name)
    @course = Course.find_by_id(params[:course_id])
    @grade = @course.grades.build #has_many & grade belongs_to course
    # @not_graded_students =[]
    # @student_grade=[]
    # @student_comment=[]
    # @ordered_grades = @course.grades.order(:student_id)
    # # byebug
    # @students.each.with_index do |student, index|
    #
    #     if index < @course.grades.count
    #      # graded_student = @ordered_grades[index][:student_id]
    #
    #          # if student.id == graded_student
    #             @student_grade.push(@ordered_grades[index][:value])
    #             @student_comment.push(@ordered_grades[index][:comment])
    #          # end
    #         else
    #         # Not_graded_students array  -->
    #           @not_graded_students.push(student)
    #       end
    #  end


  end

  def create
    @grade = Grade.new(grade_params)
    # lines 13 & 14 redundant need 15 only
    # @grade.course_id = grade_params[:course_id]
    # @grade.student_id = grade_params[:student_id]
    # @student.student_id == @course.grades[0][:student_id]
    @course = Course.find_by_id(params[:course_id])

    if @grade.save
        redirect_to grade_path(@grade)
    else
        @students = Student.all
        # .order(:last_name)
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
        @students = Student.all
        # .order(:last_name)
        if @course = Course.find_by_id(params[:course_id])
        #nested
          @grades = @course.grades.order(:student_id)

      else
        #it's not nested
        # @course = Course.find_by_id(params[:course_id])
        @grades = Grade.all
      end
      # byebug
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

    def destroy
      set_grade
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

    # def course_params
    #   params.require(:course).permit(:id, :coursename, :user_id, user_attributes: [:username])
    #   # , student_attributes: [:first_name, :last_name])
    # end

end
