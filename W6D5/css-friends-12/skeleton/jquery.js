$(function(){

  $("body").on("click", "js-modal-open", function(event){
    event.preventDefault();
    $("modal").addClass("is-open");
  });

  $("body").on("click", "js-modal-close", function(event){
    event.preventDefault();
    $("modal").removeClass("is-open");
  });

});
