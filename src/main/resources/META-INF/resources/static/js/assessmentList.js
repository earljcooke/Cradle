// Code based on https://www.w3schools.com/howto/howto_js_filter_table.asp
function searchPatient() {
    // Declare variables
    var input, filter, table, tr, td, txtValue;
    input = document.getElementById('searchAssessmentInput');
    filter = input.value.toUpperCase();
    table = document.getElementById("assessmentTable");
    tr = table.getElementsByTagName('tr');

    for (var i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[1];
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}