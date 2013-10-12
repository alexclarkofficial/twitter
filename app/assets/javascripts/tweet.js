$(document).ready (function(){

  $('form').on ("submit", function(e){

    e.preventDefault();

    $.ajax({
      url: e.target.action,
      method: "post",
      data: $(this).serialize(),
      success: function(a,b,c){
        console.log("success!");
      },
      error: function(){
        console.log("failed");
      }
    });

  });

});