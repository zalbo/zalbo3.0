
var i = -70


window.onload = function myFunction(){
    setTimeout(function(){enter();},2500);


  }

function enter() {
  (function next(counter, maxLoops) {
   // break if maxLoops has been reached
   if (counter++ >= maxLoops) return;

   setTimeout(function() {
       document.getElementById('btn-back').style.left = i + 'px';
       i = i + 2;

       // call next() recursively
       next(counter, maxLoops);
   }, 10);
 })(0, 35);
}
