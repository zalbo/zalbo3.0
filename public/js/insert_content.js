var pannel = false
$(function() {
    $('#zone_insert' )
    .mouseenter(function() {
      $('#line').fadeIn('fast');


    })
    .mouseleave(function() {
      if (pannel == false)
      $('#line').fadeOut('fast');
    });



});

function open_pannel_content() {
  pannel = true
  $('#line').fadeIn('fast');
  $('#pannel_button_content').fadeIn('fast');
}
