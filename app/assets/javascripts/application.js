// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui.min
//= require foundation
//= require tag-it.min
//= require_tree .

$(function(){ $(document).foundation(); });

$(document).ready(function(){
  $( ".datepicker" ).datepicker({
    changeMonth: true,
    changeYear: true,
    yearRange: "-100:+0",
    dateFormat: 'dd/mm/yy'
  });
  $("#days_week").tagit({
    availableTags: ["Lunes","Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"]
  });
});

function verify_rut(rut) {
  if (rut.toString().trim() != '' && rut.toString().indexOf('-') > 0) {
      var caracteres = new Array();
      var serie = new Array(2, 3, 4, 5, 6, 7);
      var dig = rut.toString().substr(rut.toString().length - 1, 1);
      rut = rut.toString().substr(0, rut.toString().length - 2);

      for (var i = 0; i < rut.length; i++) {
          caracteres[i] = parseInt(rut.charAt((rut.length - (i + 1))));
      }

      var sumatoria = 0;
      var k = 0;
      var resto = 0;

      for (var j = 0; j < caracteres.length; j++) {
          if (k == 6) {
              k = 0;
          }
          sumatoria += parseInt(caracteres[j]) * parseInt(serie[k]);
          k++;
      }

      resto = sumatoria % 11;
      dv = 11 - resto;

      if (dv == 10) {
          dv = "K";
      }
      else if (dv == 11) {
          dv = 0;
      }

      if (dv.toString().trim().toUpperCase() == dig.toString().trim().toUpperCase())
          return true;
      else
          return false;
  }
  else {
      return false;
  }
}