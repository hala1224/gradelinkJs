class CoursesController < ApplicationController
 before_action :check_for_logged_in, except: [:index]

 def index
     @courses = Course.all
     if @courses == nil
       render :new
     end
     # course_list ={:coursename =>
     #   ['Algebra',
     #    'Geometry',
     #    'Physics',
     #    'Biology',
     #    'Chemistry',
     #    'English',
     #    'History']}
     # @courses = course_list[:coursename]
 end

  def new

    @students = Student.all
    @course = Course.new
      #   #belongs_to
    # @course.build_user(course_params)
    # @student_ids = params[:selected_students]
  end



  def create

    # Create a Course with the course params
    # Iterate/loop over all the students checked
    # For each student create a Grade with the student_id and course_id assigned
    @students = Student.all
    @student_ids = params[:selected_students]
    @user = current_user
    # create the course
    @course = Course.new
    @course.user_id = @user.id
    #may not be necessary?
    @course.save
    # need to loop here for each student
    #  @student_ids.each do |roster|
    #   #create a new grade
    #   @grade= Grade.new
    #   @grade.course_id = @course.id
    #   @grade.student_id = roster
    #   #again, i don't know if you need to do this
    #   binding.pry
    #   @grade.save
    # end
    # @course.user_id = current_user.id

    if @course.save
      redirect_to course_path(@course)
    else
      @course.build_students unless @course.students
      render :new
    end

  end


  def show
    set_course
    # @students = Student.all
    # @student_ids = params[:selected_students]
    @courses= Course.all
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
      params.require(:course).permit(:coursename, :user_id)
      # , student_attributes: [:first_name, :last_name])
    end

    def grade_params
      params.require(:grade).permit(:value, :comment, :course_id, :student_id)
    end

end
