$(document).ready(function(){

$(function(){
        $('input').on('change', function(){
          console.log("Changed: " + $(this).val())
        });
      });

});
