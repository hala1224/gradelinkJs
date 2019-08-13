class StudentsController < ApplicationController
before_action :set_student, only: [:show, :edit, :update, :destroy]


  def index
    @students = Student.order_by_average
    respond_to do |f|
      f.html
      # {render :index}
      f.json {render json: @students}
    end
  end

  def show
    @courses = Course.all
    @grades = @student.grades
    respond_to do |f|
      f.html
      # {render :show}
      f.json {render json: @student}
    end
  end

  def edit

  end

  def update
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
#   Get rid of if statement

     # if
       @student.save
       render json: @student
     # end
   end

   def destroy
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
