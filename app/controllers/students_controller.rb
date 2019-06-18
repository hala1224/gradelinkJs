class StudentsController < ApplicationController

  def index
    @students = Student.all
    # .order(:last_name)
  end

  def show
    # @student = Student.find_by(id: params[:id])
    set_student
    # put this into model as scope method
    # @courses = Course.all.order(:coursename)
    @student_courses=[]
    @courses = Course.all
    @grades = @student.grades.order(:course_id)
    @courses.each.with_index do |course, index|

      if course[:user_id] == current_user.id
        @student_courses.push(course)
      end
    end
   # byebug
    # redirect_to student_grades_path(@student)
  end

  def edit
     set_student
  end

  def update
    set_student
    if @student.update(student_params)
      redirect_to student_path(@student)
    else
      render :edit
    end
  end

   def new
    @student = Student.new
   end

   def create
     @student = Student.new(student_params)
     # @student.user_id = session[:user_id]

     if @student.save
       redirect_to students_path
     else
       render :new
     end
   end

   def destroy
     # Need form to select a student

     # byebug
     set_student
     @student.destroy
     redirect_to students_path
   end

   private

     def set_student
         @student = Student.find_by(id: params[:id])
         if !@student
           redirect_to students_path
         end
      end

     def student_params
       params.require(:student).permit(:first_name, :last_name)
     end

end
