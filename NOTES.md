Models
<!-- Need to see the grade via  -->
<!--  -->
o Courses
 Attributes :Name, Description

belongs_to :user
<!-- Setting up association for grades table   -->
   has_many :grades
   has_many :students, through: :grades
    <!-- has_many :comments or attribute -->

 id|   name   |  Description | user_id
---|----------|--------------|---------------
1  | Algebra1 | First Course |     
2  | PreCalc  | First Course |     
3  | Geometry | Basic Course |     
4  | Algebra2 | 2nd Course   |     
5  | History  | Modern Hist  |     
6  | English  | 10th grade   |     
7  | SStudies | 11th grade   |     
8  | Physics  | 2nd year     |     



o Users(Teachers)-> Log In
  Attributes :name, :email, password     
<!--My roster for each class  -->
<!--courses/:id/students  -->

    has_many :courses
    has_many :students, through :courses
  

Id | Name   |  Email  | Password  |    X         x
---|--------|---------|-----------|-----------|-----------
1  |Mrs. H  |         |           |     1     |    1


2  |Mrs. R  |         |           |    3      |    1






o Students
  Attributes :first_name, :last_name

      has_many :grades
      has_many :courses, through :grades
    <!-- has_many :users, through :courses (?) -->


    id|  first_name   |  last_name |
   ---|---------------|------------|---------------
   1  | Jack          | Frost      |     1

   2  | Fred          | Flinstone  |     1


   3  | Jacklyn       | Frosting   |     5






o Grades (Join Table)
Attributes :value, :comment (course_id,  :student_id)

belongs_to :student
belongs_to :course


Id | value  |  comment|  Course_id | student_id
---|--------|---------|-----------|-----------
1  | 90     |         |    1      |    1
1  | 80     |         |    1      |    2
1  | 70     |         |    1      |    3
1  |  50    |         |    1      |    4
1  |   70   |         |    1      |    5
1  |  95    |         |    1      |    6
2  |  100   |         |    2      |    2
2  |   88   |         |    2      |    4
2  |  73    |         |    2      |    6
