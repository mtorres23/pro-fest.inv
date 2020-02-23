$(document).ready(function() {
  // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
  // $('select').material_select();
  const options = {
    dismissable: false,
    in_duration: 200
  };
  var $modal1 = $("#modal1");
  var $modal2 = $("#modal2");

  $("#modal1").openModal(options);
  var overlay = $(".lean-overlay");
  var toggleMap = function() {
    console.log($modal2);
    if (!overlay) {
      $modal2.closeModal();
      $modal1.openModal();
      // $modal2.openModal();
    } else {
      $modal2.openModal(options);
    }
  };

  var toggleModals = function(x, y) {
    x.closeModal();
    y.openModal();
  };

  $(".map-toggle").on("click", function() {
    toggleMap();
  });

  // Add on map
  $(".map-add").on("click", function() {
    var locTitle = $("#title").val();
    var locType = $("#type").val();
    toggleMap();
    alert("title: " + locTitle);
    alert("type: " + locType);

    // Drop a large pin on the map at the center of the map...

    // Open the infowindow and populate the form with the form data
  });

  // Edit on map
  $(".map-edit").on("click", function() {});
});
