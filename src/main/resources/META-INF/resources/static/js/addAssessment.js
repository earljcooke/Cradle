var counter = 0;
var med_div = document.getElementById('medication_set');
var remove_button = document.getElementById('removeMedication');

function addMed() {
    var arr_index = "medications[" + counter.toString() + "]";

    var fieldset = document.createElement('div');
    fieldset.id = counter.toString();
    fieldset.className = "form-group";

    var first_row = document.createElement('div');
    first_row.className = "row";
    var second_row = document.createElement('div');
    second_row.className = "row";

    var first_col = document.createElement('div');
    first_col.className = "col";
    var second_col = document.createElement('div');
    second_col.className = "col-sm-2";
    var third_col = document.createElement('div');
    third_col.className = "col-sm-3";
    var fourth_col = document.createElement('div');
    fourth_col.className = "col";
    var fifth_col = document.createElement('div');
    fifth_col.className = "col";

    var nameInput = document.createElement('input');
    var nameIndex = arr_index + ".medicationName";
    nameInput.id = nameIndex;
    nameInput.type = 'text';
    nameInput.name = nameIndex;
    nameInput.className = "reading-field";
    nameInput.required = true;
    var nameLabel = document.createElement('label');
    nameLabel.setAttribute("for", nameIndex);
    nameLabel.innerHTML = "Medication Name";

    var doseInput = document.createElement('input');
    var doseIndex = arr_index + ".dose";
    doseInput.id = doseIndex;
    doseInput.type = 'number';
    doseInput.name = doseIndex;
    doseInput.className = "reading-field";
    doseInput.step = "0.01";
    doseInput.min = "0";
    doseInput.required = true;
    var doseLabel = document.createElement('label');
    doseLabel.setAttribute("for", doseIndex);
    doseLabel.innerHTML = "Medication Dose";

    var unitsInput = document.createElement('input');
    var unitsIndex = arr_index + ".doseUnits";
    unitsInput.id = unitsIndex;
    unitsInput.type = 'text';
    unitsInput.name = unitsIndex;
    unitsInput.className = "reading-field";
    unitsInput.required = true;
    unitsInput.placeholder = "e.g., pills per day or mg";
    var unitsLabel = document.createElement('label');
    unitsLabel.setAttribute("for", doseIndex);
    unitsLabel.innerHTML = "Dose Units";

    var periodInput = document.createElement('input');
    var periodIndex = arr_index + ".periodOfConsumption";
    periodInput.id = periodIndex;
    periodInput.type = 'number';
    periodInput.name = periodIndex;
    periodInput.className = "reading-field";
    periodInput.min = "0";
    periodInput.required = true;
    var periodLabel = document.createElement('label');
    periodLabel.setAttribute("for", periodIndex);
    periodLabel.className = "period_small";
    periodLabel.innerHTML = "Period of medication's consumption (in days)";

    var sideInput = document.createElement('input');
    var sideIndex = arr_index + ".sideEffects";
    sideInput.id = sideIndex;
    sideInput.type = 'text';
    sideInput.name = sideIndex;
    sideInput.className = "reading-field side-no-border";
    sideInput.placeholder = "You can put side effects here";
    var sideLabel = document.createElement('label');
    sideLabel.setAttribute("for", sideIndex);
    sideLabel.innerHTML = "Side Effects";

    first_col.appendChild(nameLabel);
    first_col.appendChild(nameInput);
    second_col.appendChild(doseLabel);
    second_col.appendChild(doseInput);
    third_col.appendChild(unitsLabel);
    third_col.appendChild(unitsInput);
    fourth_col.appendChild(periodLabel);
    fourth_col.appendChild(periodInput);
    fifth_col.appendChild(sideLabel);
    fifth_col.appendChild(sideInput);

    first_row.appendChild(first_col);
    first_row.appendChild(second_col);
    first_row.appendChild(third_col);
    first_row.appendChild(fourth_col);
    second_row.appendChild(fifth_col);

    fieldset.appendChild(first_row);
    fieldset.appendChild(document.createElement('br'));
    fieldset.appendChild(second_row);
    fieldset.appendChild(document.createElement('hr'));

    med_div.appendChild(fieldset);

    counter ++;
    remove_button.style.visibility = "visible";
}

function removeMed() {
    counter --;
    var element = document.getElementById(counter.toString());
    element.parentNode.removeChild(element);
    if (counter <= 0) {
        remove_button.style.visibility = "hidden";
    }
}