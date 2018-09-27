$(document).ready(function(){
// the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
$('select').material_select();
// $('.modal').openModal();
var $modal1 = $('#modal1');
var $modal2 = $('#modal2');
$('#modal1').openModal();

var toggleMap = function() {
 
 if ($modal1.open) {
    $modal1.modal('close');
    $modal2.openModal();
  } else {
    $modal1.openModal();
  }
  
};

$('.map-toggle').on('click', function(){
  toggleMap();
});

});