 $(".dropdown-menu li a").click(function(){
  var selText = $(this).text();
  $(this).parents('.btn-group').find('.dropdown-toggle').html(selText+' <span class="caret"></span>');
});

function confirmAllocation() {
    var result = confirm("Please confirm that you want to allocate patients \nPress OK to proceed.\nPress Cancel to check information one more time.");
    if (result === true) {
      alert("Patients were allocated successfully!");
      return true;
    } else {
      return false;
    }
}