
var i = 0
var active = false

function myFunction(){
  if (active == false){
    $("#change_pass").fadeIn(1000);
    (function next(counter, maxLoops) {
     // break if maxLoops has been reached
     if (counter++ >= maxLoops) return;

     setTimeout(function() {
         document.getElementById('change_pass').style.height = i + 'px';
         i = i + 10;

         // call next() recursively
         next(counter, maxLoops);
     }, 4);
   })(0, 21);
  active = true
  }else {
    $("#change_pass").fadeOut(200);
    (function next(counter, maxLoops) {
     // break if maxLoops has been reached
     if (counter++ >= maxLoops) return;

     setTimeout(function() {
         document.getElementById('change_pass').style.height = i + 'px';
         i = i - 10;

         // call next() recursively
         next(counter, maxLoops);
     }, 4);
   })(0, 21);
   active = false
  }
}
