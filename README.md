Gradelink

A ruby on rails app that helps a teacher to create(or delete) a course, enter grades quickly and display students' by overall ranking.




Prerequisites:
You will need to have the following installed on your computer in order to use Gradelink:

1) Ruby
2) Rails
3) SQL database
4) Faker gem

Set up:

   1) For the repository and clone it.
   2) Run bundle install to install gems.
   3) Set up the database with rake db:create and rake db:migrate
   4) Seed the database with rake db:seed. (Do not skip this step, otherwise you won't have any data for students).    Faker gem starts the app with 10 students.

   The app uses the dotenv gem for environment variables.

   5) Create a .env file in the root of the app and add GOOGLE_CLIENT_ID=your_key and        GOOGLE_CLIENT_SECRET=your_secret. If you do not already have a Google developer account, you will need to do so in order to get these keys through Oauth on Google for developers, in order to log in through Google.

   6) Run rails s and navigate to http://localhost:3000.

Notes:
At the moment, users cannot delete the populated students(you can remove the seeded data), but can add new students.
Users can create courses and add grades for that course.  Future versions will make such attributes submittable on a user level.
# gradelinkJs
