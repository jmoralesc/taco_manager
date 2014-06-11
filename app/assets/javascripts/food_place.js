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

  //$("#order_food_place_id").prepend("<option></option>");
  //$("#select-r").prepend("<option value='' selected='selected'>Choose food place</option>");
  //​$("<option>", { value: '', selected: true }).prependTo(".chosen");​​​​​​​​​​​

});


