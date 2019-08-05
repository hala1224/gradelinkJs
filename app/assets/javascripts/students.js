$(function () {
  console.log('students.js is loaded...')
  listenForAllStudentsClick();
  // listenForNewStudentFromClick();
  // listenForStudent();

});


// Clear html to repaint the DOM
const clearDom = () => {
  $('#app-container').html('');
}


const listenForAllStudentsClick = () => {
  //
$('#all_students.navbar-brand').on('click', function (event){
 event.preventDefault()
 getStudents()

 })
}

function getStudents() {
 $.get_students({
 url: 'http://localhost:3000/students',
 method: 'get',
 dataType: 'json',
 success: function (data) {
   console.log("the data is: ", data)
   			data.map(student => {
   				const newStudent = new Student(student)
   				const newStudentHtml = newStudent.studentHTML()
   				document.getElementById('get_students').innerHTML += newPostHtml
   			})
   		}
   	})
   }
//
// console.log("the data is: ", data)
// var mystudent = new Student(data(0))
// var myStudentHTML = mystudent.studentHTML()
// document.getElementById('ajax-students').innerHTML += myStudentHTML
//  })
// }

class Student {
 construtor(obj) {
  this.id = obj.id
  this.first_name = obj.first_name
  this.last_name = obj.last_name
 }
//
//  //  static newStudentForm (){
//  //  return (`
//  //   <strong>New student form</strong>
//  //   <form>
//  //     <input id='student-first_name' type='text' name='first_name'></input><br>
//  //     <input type='text' name='last_name'></input><br>
//  //     <input type='submit' />
//  //   </form>
//  //  `)
//  // }
}

Student.prototype.studentHTML = function () {
 return (
  <div>
   <h3> ${this.first_name}, ${this.last_name} </h3>
  </div>
 )

}
