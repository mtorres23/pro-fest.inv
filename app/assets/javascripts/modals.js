$(document).ready(function() {
  // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
  // $('select').material_select();
  var options = {
    dismissable: false
  };
  var $modal1 = $("#modal1");
  var $modal2 = $("#modal2");

  $modal1.openModal(options);

  var toggleMap = function() {
    console.log($modal1);
    if ($modal1.open) {
      $modal1.closeModal();
      // $modal2.openModal();
    } else {
      $modal1.openModal(options);
    }
  };

  $(".map-toggle").on("click", function() {
    toggleMap();
  });

  // Add on map
  $(".map-add").on("click", function() {
    var locTitle = $("#title").val();
    var locType = $("#type").val();
    toggleMap();

    // Drop a large pin on the map at the center of the map...

    // Open the infowindow and populate the form with the form data
  });

  // Edit on map
  $(".map-edit").on("click", function() {});
});
