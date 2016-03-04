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
  $('#line').fadeIn('fast');
  $('#pannel_button_content').fadeIn('fast');
  pannel = true;
}

function close_pannel_content() {
  pannel = true
  $('#line').fadeOut('fast');
  $('#pannel_button_content').fadeOut('fast');
  pannel = false;
}


// var order = 0
// function add_text_content() {
//   $("#layout_form")
$("#layout_form").append('<div class="field"><input value=' + order +' type="hidden" name="contents[][order]" id="contents__order"><label for="content__photo">Insert Photo</label><input class="photo_input" type="file" name="contents[][photo]" id="contents__photo"><input value="<%=params[:project_id]%>" type="hidden" name="contents[][project_id]" id="contents__project_id"><input value="<%=params[:id]%>" type="hidden" name="contents[][page_id]" id="contents__page_id"></div>');
//     .append('<div class="field"><input value=' + order + ' type="hidden" name="contents[][order]" id="contents__order"><br><textarea rows="20" type="text" name="contents[][text]" id="contents__text" ></textarea><input value="<%=params[:project_id]%>" type="hidden" name="contents[][project_id]" id="contents__project_id"><input value="<%=params[:id]%>" type="hidden" name="contents[][page_id]" id="contents__page_id"></div>');
//     order ++ ;
// };
// $("#button_photo").click(function() {
//
// });

var order = 0


function add_text_content(){
  var row = 2
  $("#layout_form").append('<div class="field"><input value=' + order + ' type="hidden" name="contents[][order]" id="contents__order"><br><textarea rows="1" type="text" name="contents[][text]" class="contents__text" id='+ order + '></textarea><input value="<%=params[:project_id]%>" type="hidden" name="contents[][project_id]" id="contents__project_id"><input value="<%=params[:id]%>" type="hidden" name="contents[][page_id]" id="contents__page_id"></div>');

  (function next(counter, maxLoops) {
    console.log(counter);
    console.log(maxLoops);
     // break if maxLoops has been reached
     if (counter++ >= maxLoops) return;

     setTimeout(function() {


         document.getElementById(order - 1).rows = row;
         row = row + 1;
         // call next() recursively
         next(counter, maxLoops);
     }, 50);
   })(0, 21);
   order ++ ;

}
