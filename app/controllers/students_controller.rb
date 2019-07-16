class StudentsController < ApplicationController

  def index
    @students = Student.order_by_average
  end

  def show
    set_student
    @courses = Course.all
    @grades = @student.grades
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
     if @student.save
       redirect_to students_path
     else
       render :new
     end
   end

   def destroy
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
