var Coffee2JS, clear, convert, download, input, output;

input = document.querySelector('[data-action=input]');

output = document.querySelector('[data-action=output]');

convert = document.querySelector('[data-action=convert]');

download = document.querySelector('[data-action=download]');

clear = document.querySelector('[data-action=clear]');

Coffee2JS = function() {
  var yourJS;
  yourJS = CoffeeScript.compile(input.value, {
    bare: true
  });
  return output.value = yourJS;
};

input.onchange = function() {
  return Coffee2JS();
};

input.onkeyup = function() {
  return Coffee2JS();
};

convert.onclick = function() {
  return Coffee2JS();
};

output.onclick = function() {
  return this.select();
};

download.onclick = function() {
  if (!output.value) {
    return alertify.error('No output defined!');
  } else {
    return alertify.prompt('Save file name', '', (function(evt, value) {
      var blob;
      blob = new Blob([output.value], {
        type: 'text/css'
      });
      return saveAs(blob, value + '.css');
    }), function() {
      return alertify.error('Download operation aborted.');
    }).set('basic', true);
  }
};

clear.onclick = function() {
  input.value = '';
  return output.value = '';
};
