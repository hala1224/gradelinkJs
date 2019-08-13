const homeUrl = 'http://localhost:3000/'

// To make sure the DOM is loaded
// - Document ready function to hijack the click/submit events
// - jQuery => $ interface with the library
$(() => {
  listenForAllStudentsClick();
  // listenForNewStudentFromClick();
  listenForStudent();
  listenForNewStudentSubmission();
  // getUser();
});

// Clear html to repaint the DOM
const clearDom = () => {
  $('#app-container').html('');
}

const listenForAllStudentsClick = () => {
  //Listen for click on link with all_students id, and use callback function that takes an event parameter
    $('#all_students.navbar-brand').on('click', (event) => {
     event.preventDefault();
     // clearDom better here??
     clearDom();
     let url = homeUrl + "students"
     history.pushState(null, null, url)
     getStudents();
   });
};

const listenForStudent = () => {
  $(document).on('click', ".show_link", function (event) {
   event.preventDefault();
   clearDom();
   let id = $(this).attr('data-id')
   let url = homeUrl + "students/" + id;
   history.pushState(null, null, url)
// put into getStudent

   fetch(`${id}.json`)
   .then(response => response.json())
    .then(student => {  //added 39,43
     // student.grades.forEach( grade => {
       let newStudent = new Student(student);
       let studentHtml = newStudent.formatShow()
       $('#app-container').append(studentHtml)
       })
    })
  // })
}

// New student form
const listenForNewStudentSubmission = () => {
    $(".new_student").on("submit", function(e) {
        e.preventDefault();
        // console.log("submitting Student")
        //Grab the values entered in the form, using Serialize:
        //Serialize makes a string from a jquery on a form that has field controls on it..
        const values = $(this).serialize()
        // Need a function to fetch JSON data for the id with grades
        // Add class in show to fetch the data
        // let studentId = $('.newStudentId').data('student-data-id')
        // console.log(values)
        $.post("/students", values).done(function(data) {
          console.log(data);
        clearDom();

         // $('#app-container').html('<h1>This will be the new student </h1>')
        const newStudent = new Student(data)
        const htmlToAdd = newStudent.formatStudent()
        $('#app-container').append(htmlToAdd)
       })
      });
}


const getStudents = () => {
  //fetch (native API to the browser called on the global object)-> a promise that will be resolved or rejected.
 //With backend API, it will be resolved.
 fetch(`/students.json`)
 //Use #then to get the response object (which is a promise) and call #json to convert it and parse the data
 .then(response => response.json())
 // #students method
 .then(students => {
   clearDom();
   $('#app-container').html('<h1>Students In Ranking Order </h1>')
   students.forEach( student => {
     let newStudent = new Student(student);
     let studentHtml = newStudent.formatIndex();
     $('#app-container').append(studentHtml);

   })
 })
}

class Student {
  constructor(student) {
  this.id = student.id;
  this.first_name = student.first_name;
  this.last_name = student.last_name
  this.grades = student.grades;
  this.courses = student.courses;
 }
}

function Course(course){
  this.id = course.id;
  this.coursename = course.coursename;
  this.user_id = course.user_id;
  this.grades = course.grades;
  this.students = course.students;
}

Student.prototype.formatIndex = function () {

  let studentHtml = `
   <table class="table table-sm table-bordered">
     <tbody>
         <tr>
            <td><a href="/students/${this.id}" data-id ="${this.id}" class="show_link"><h5 >${this.last_name}</a></h5> </td>

         </tr>
    </tbody>
  </table>
  `
  return studentHtml;

}

Student.prototype.formatShow = function () {
  // Need to loop over courses and print course of the current user
  // Need to check current_user - is it available here?


  let studentHtml = `
  <h2>${this.first_name} ${this.last_name}</h2>
  <table class="table table-bordered">
  <thead>
    <tr>
      <th style="width:300px;">Course </th>
      <th style="width:50px;">Grade</th>
      <th >Comment</th>
    </tr>
   </thead>
   <tbody>
        <tr>
          <td>${this.courses[0].coursename}</td>
          <td>${this.grades[0].value} </td>
          <td>${this.grades[0].comment} </td>
        </tr>
    </tbody>
  </table>
  `
  return studentHtml

}
Student.prototype.formatStudent = function () {
  let studentHtml = `
  <h2>${this.first_name} ${this.last_name}</h2>

  `
  return studentHtml
}
// const getStudent = () => {
//   let studentId = $('.student-show').data('student-id')
//   fetch (`/students/${studentId}.json`)
//   .then(response => response.json())
//   .then(student => {
//     console.log(student)
//    // New student wont have any grades at this point only First and Last Name
// let newStudent = new Student(student);
// let studentHtml = newStudent.formatStudent();
// $('#app-container').append(studentHtml);




//     const studentGrades = student.grades
//     studentGrades.forEach(grade => {
//         let newGrade = new Grade(grade);
//         let gradeH

// })
//   })
//   }
