// function Grade(attributes){
//  this.value = attributes.value;
//  this.comment = attributes.comment;
//  this.id = attributes.id;
// }
//
// Grade.prototype.renderLI = function() {
//
//
//
//
// }
// $(function() {
//  $("form#new_grade").on("submit", function (e){
//   e.preventDefault()
//   var $form = $(this);
//   var action = $form.attr("action");
//   var params = $form.serialize();
//   $.ajax({
//      url: action,
//      data: params,
//      dataType: "json",
//      method: "POST"
//
//   })
//   .success(function(json){
//     var Grade = new Grade(json);
//     var gradeLi = Grade.renderLI()
//
//   })
//   error(function(response){
//       console.log("Error", response)
//
//   })
//
//  })
//
// })
