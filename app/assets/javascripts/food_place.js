function readURL(input) {

    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#preview').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}


$( document ).ready(function() {
  $( "#save" ).on( "click", function() {
   $( "#new_menu_option_form" ).submit();
  });

  $("#photo").change(function(){
    readURL(this);
  });
  
  $(".carousel-inner .item:first").addClass("active");
   
  $(".indicators:first").addClass("active")

  $(".chosen").chosen({no_results_text: "Oops, nothing found!"});
   


var classHighlight = 'highlight'; 



   $(".thumbnail").on("mouseenter", function (){
     $(this).addClass(classHighlight);
   });
   
   $(".thumbnail").on("mouseleave", function (){
     $(this).removeClass(classHighlight);
   });

   //$( ".rtrio:nth-child(3n + 1)" ).append("<div id='trio1'/>")
  
  $(document).bind('cocoon:after-insert', function(e,inserted_item) {
     $(".chosen").chosen({no_results_text: "Oops, nothing found!"});

    $(".select").on('change',function() {
      price = $(this).find(":selected").data('price');
      $(this).parent().parent().find("#price").val(price);
      quantity = $(this).parent().parent().find(".quantity").val();
      $(this).parent().parent().parent().parent().find(".subtotal").val((price * quantity).toFixed(1));     
      //$(this).parent().find("#price").val(price);
    });

    $(".quantity").on('change',function() {
       price = $(this).parent().parent().parent().find("#price").val();
       quantity = $(this).val();
       $(this).parent().parent().parent().find(".subtotal").val((price * quantity).toFixed(1)); 
     });  
   });
  
    price = $(".select").find(":selected").data('price');
    $(this).find("#price").val(price);
  
  
  

  
  $(".select").on('change',function() {
    price = $(this).find(":selected").data('price');
    $(this).parent().parent().find("#price").val(price);
    quantity = $(this).parent().parent().find(".quantity").val();
    $(this).parent().parent().parent().find(".subtotal").val((price * quantity).toFixed(1));
  });

   $(".quantity").on('change',function() {
    price = $(this).parent().parent().parent().find("#price").val();
    quantity = $(this).val();
    $(this).parent().parent().parent().find(".subtotal").val((price * quantity).toFixed(1));
  });
  
  $("#All").on('change',function() {
    all = $(this).parent().parent().parent().find("input[id*='invitedu_id_']")
  if ($(this).prop('checked')){
    all.prop('checked', true);
  }else{ 
    all.prop('checked', false);
  }

});


});


