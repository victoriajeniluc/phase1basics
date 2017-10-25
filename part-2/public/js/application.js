$(document).ready(function(){
  $("#new-poem-form").submit(function(event){
    event.preventDefault();
    var $newPoemForm = $(this);
    var url = $newPoemForm.attr("action");
    var method = $newPoemForm.attr("method");
    var data = $newPoemForm.serialize();

    var request = $.ajax({
      url: url,
      method: method,
      data: data
    });

    request.done(function(response){
      $("#errors").children().remove();
      $newPoemForm[0].reset();
      $("#poem-list").prepend(response);
    });

    request.fail(function(failResponse){
      $("#errors").children().remove();
      $("#errors").append(failResponse.responseText);
    });
  });

  $("section#poems").on("submit", "form#applaudButton", function(event){
    event.preventDefault();
    var $applaudButton = $(this);
    var url = $applaudButton.attr("action");
    var method = $applaudButton.find("input[type=hidden]").attr("value");

    var request = $.ajax({
      url: url,
      method: method,
    });

    request.done(function(response){

     $applaudButton.closest(".poem-list-item").find(".likes").html(response);
    });
  });
});
