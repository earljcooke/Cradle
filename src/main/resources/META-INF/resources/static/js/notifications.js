toastr.options = {
  debug: false,
  positionClass: "toast-bottom-right",
  onclick: null,
  fadeIn: 300,
  fadeOut: 1000,
  timeOut: 8000,
  extendedTimeOut: 1000
};

function contactMessage() {
  toastr.success("Message has been sent");
}

function saveMessage() {
  toastr.success("Your settings have been saved");
}

function registerMessage() {
  toastr.success("User has been created");
}
