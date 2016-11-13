// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require dataTables/jquery.dataTables
//= require dataTables/jquery.dataTables.foundation
//= require selectize
//= require jquery-ui
//= require autocomplete-rails
//= require foundation
//= require_tree .

$(document).ready(function(){ 
	$(document).foundation(); 
	$('#jobsTable').DataTable();
	$('#reportsTable').DataTable();
	$('#reportsNegTable').DataTable();
	$('#jobTypesLead').DataTable();
	$('#jobTypesMold1').DataTable();
	$('#jobTypesMold2').DataTable();
	$('#jobTypesAsbestos').DataTable();
	$('#jobTypesBacteria1').DataTable();
	$('#jobTypesBacteria2').DataTable();

});


$(document).ajaxComplete(function() {
  	$(document).foundation();
	$('#jobsTable').DataTable();
	$('#reportsTable').DataTable();
	$('#reportsNegTable').DataTable();
	$('#jobTypesLead').DataTable();
	$('#jobTypesMold1').DataTable();
	$('#jobTypesMold2').DataTable();
	$('#jobTypesAsbestos').DataTable();
	$('#jobTypesBacteria1').DataTable();
	$('#jobTypesBacteria2').DataTable();

});

// $(function() {
//   $('#xrf_coc_turnaround').selectize({
//     create: true,
//     sortField: 'text'
//   });
// });

// $(function() {
//   $('#xrf_coc_xrfunit').selectize({
//     create: true,
//     sortField: 'text'
//   });
// });

// $(function() {
//   $('#xrf_coc_xrfmode').selectize({
//     create: true,
//     sortField: 'text'
//   });
// });

// $(function() {
//   $('#xrf_coc_actionlevel').selectize({
//     create: true,
//     sortField: 'text'
//   });
// });

// $(function() {
//   $('#xrf_coc_abatementlevel').selectize({
//     create: true,
//     sortField: 'text'
//   });
// });

