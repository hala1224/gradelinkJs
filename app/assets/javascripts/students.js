const homeUrl = 'http://localhost:3000/'

// To make sure the DOM is loaded
// - Document ready function  $(()=>{}) shorthand to hijack the click/submit events
// - jQuery => $ interface with the library
$(() => {
  listenForAllStudentsClick();
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
   getStudent(id);
  })
}
// New student form
const listenForNewStudentSubmission = () => {
    $(".new_student").on("submit", function(e) {
        e.preventDefault();
        // console.log("submitting Student")
        //Grab the values entered in the form, using Serialize:
        //Serialize makes a string from a jquery on a form that has field controls on it..
        const values = $(this).serialize()
        $.post("/students", values).done(function(data) {
          console.log(data);
        clearDom();
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

const getStudent = (id) => {
  fetch(`${id}.json`)
  .then(response => response.json())
   .then(student => {
   clearDom();
      let newStudent = new Student(student);
      $('#app-container').html(`
        <h2> ${newStudent.first_name} ${newStudent.last_name}</h2>
         <table class="table table-bordered">
        <thead>
         <tr>
           <th style="width:300px;">Course </th>
           <th style="width:70px;">Grade</th>
           <th >Comment</th>
         </tr>
        </thead>
        `)
      let studentHtml = newStudent.formatShow()
      $('#app-container').append(studentHtml)
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

 formatIndex () {

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

 formatShow () {
            let newHtml=""
            let courseHtml = this.courses
            let gradesHtml = this.grades
            courseHtml.forEach((course, i) =>
                   newHtml += (`<table class="table table-bordered">
                     <tbody>
                     <tr>
                         <td style="width:300px;"> ${course.coursename}</td>
                         <td style="width:70px;"> ${gradesHtml[i].value}</td>
                         <td> ${gradesHtml[i].comment} </td>
                               </tr>
                            </tbody>
                         </table>
                      `)
             )

    return newHtml
}

 formatStudent () {
   let studentHtml = `
   <h2>${this.first_name} ${this.last_name}</h2>
   <br></br>
   <h4> No Courses To Show </h4>
   `
   return studentHtml
 }
}
