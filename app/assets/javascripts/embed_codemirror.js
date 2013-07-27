var editor = CodeMirror.fromTextArea(document.getElementById("code"), {
  lineNumbers: true
});

var input = document.getElementById("select");

function selectTheme() {
  var theme = input.options[input.selectedIndex].innerHTML;
  editor.setOption("theme", theme);
}

var choice = document.location.search &&
             decodeURIComponent(document.location.search.slice(1));
  if (choice) {
    input.value = choice;
    editor.setOption("theme", choice);
}
