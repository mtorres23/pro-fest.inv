$(document).ready(function(){
// the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
$('select').material_select();

var $modal1 = $('#modal1');
var $modal2 = $('#modal2');
$('#modal1').openModal({
  dismissable: false
});

var toggleMap = function() {
 
 if ($modal1.open) {
    $modal1.closeModal();
    // $modal2.openModal();
  } else {
    $modal1.openModal();
  }
  
};

$('.map-toggle').on('click', function(){
  toggleMap();
});

// Add on map
$('.map-add').on('click', function(){
  var locTitle = $('#location_title').val();
  var locType = $('#location_loc_type').val();
  toggleMap();
  alert("title: " + locTitle);
  alert("type: " + locType);

  // Drop a large pin on the map at the center of the map...

      // Open the infowindow and populate the form with the form data


});

// Edit on map
$('.map-edit').on('click', function(){

});

});