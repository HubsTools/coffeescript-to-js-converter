input = document.querySelector('[data-action=input]')
output = document.querySelector('[data-action=output]')
convert = document.querySelector('[data-action=convert]')
download = document.querySelector('[data-action=download]')
clear = document.querySelector('[data-action=clear]')

# Convert Coffee2JS
Coffee2JS = ->
  yourJS = CoffeeScript.compile(input.value, bare: true)
  output.value = yourJS

# Convert Coffee2JS when input changes
input.onchange = ->
  Coffee2JS()
input.onkeyup = ->
  Coffee2JS()

# Convert Stylus2CSS when convert button is clicked
convert.onclick = ->
  Coffee2JS()
  
# Select all text when output is clicked
output.onclick = ->
  this.select()

# Download file
download.onclick = ->
  if !output.value
    alertify.error 'No output defined!'
  else
    alertify.prompt('Save file name', '', ((evt, value) ->
      blob = new Blob([ output.value ], type: 'text/javascript')
      saveAs blob, value + '.js'
    ), ->
      # User clicked cancel
      alertify.error 'Download operation aborted.'
    ).set 'basic', true

# Clear input
clear.onclick = ->
  input.value  = ''
  output.value = ''