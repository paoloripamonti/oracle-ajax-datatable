//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require dataTables/jquery.dataTables
//= require turbolinks
//= require bootstrap
//= require_tree .

$('.datepicker').datepicker();

$(".datatable-serverside").dataTable({
  "serverSide": true,
  "ajax": $(".datatable-serverside").data('source'),
  "lengthMenu": [[2, 5, 10, 20, 50, 100, -1], [2, 5, 10, 20, 50, 100, "All"]],
  "pageLength": 10
});


$('.open-modal').click(function() {
  var target;
  target = $(this).attr('data-modal-target');
  $(target).modal({
    keyboard: true
  });
  return false;
});
