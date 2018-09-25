$(document).ready(function(){
// the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
$('select').material_select();
$('.modal').modal();
var $modal1 = $('#modal1');
var $modal2 = $('#modal2');
$('#modal1').modal('open');

var toggleMap = function() {
 
 if ($modal1.open) {
    $modal1.modal('close');
    $modal2.modal('open');
  } else {
    $modal1.modal('open');
  }
  
};

$('.map-toggle').on('click', function(){
  toggleMap();
});

});