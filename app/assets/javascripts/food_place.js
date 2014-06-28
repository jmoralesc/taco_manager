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

  $(".payed").on('change',function() {
    $(".pay").submit();
  
   });

  
  $('.user').on("mouseenter", function (){
   $(this).popover('show');
   });
   
   $('.user').on("mouseleave", function (){
   $(this).popover('hide');
   
   });

   $('.pop-preview').on("mouseenter", function (){

     $(this).popover({

      html: true,
      trigger: 'hover',
      content: function () {
      return '<img src="'+$ (this).data('img') + '" class="img-rounded' +'" />';}

     });
      
   });
   
   $('.pop-preview').on("mouseleave", function (){
     $(this).popover('hide');
   
   });

 $('.stars').raty({readOnly : true,
                   score: function() {
    return $(this).attr('data-score');
  }});


 $('.eval').raty({ score: function() {
    return $(this).attr('data-score');
  },
                   half:       true,
                   size:       24,
                   path: '/assets/' ,
                   starHalf:   'star-half-big.png',
                   starOff:    'star-off-big.png',
                   starOn:     'star-on-big.png',
                   target     : '.count-stars',
                   targetType : 'number',
                   targetKeep : true, 
                   click: function() {
                   $(this).parent().submit(); 
  }
});

 $('#style_display').on("change", function(){
    
    base_url = window.location.pathname.split('?')[0];
    console.log(base_url);

    if ($(this).val() == 'thumbnails'){

     window.location = base_url +"?per=6&style="+$(this).val();
   
   }else{
    
     window.location = base_url + "?per=20&style=" + $(this).val();
   }  

 });

});


