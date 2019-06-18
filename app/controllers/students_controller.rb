class StudentsController < ApplicationController

  def index
    @students = Student.all.order(:last_name)
  end

  def show
    # @student = Student.find_by(id: params[:id])
    set_student
    @students = Student.all.order(:last_name)
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
