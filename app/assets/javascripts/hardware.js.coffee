unless Array::filter
  Array::filter = (callback) ->
    element for element in this when callback(element)

$ = jQuery
$ ->
  data = JSON.parse($('#location_data').val())
  server_racks = []
  rack_units = []

  $('#location_parent').on change: ->
    return if not $(this).is(':checked')
    $('#datacenters_div').hide()
    $('#server_racks_div').hide()
    $('#rack_units_div').hide()

    $('#parent_hardware_div').show()
    $('#positions_div').show()
    #$('#parent_hardware').change()

  $('#location_physical').on change: ->
    return if not $(this).is(':checked')
    $('#parent_hardware_div').hide()
    $('#positions_div').hide()

    $('#datacenters_div').show()
    $('#server_racks_div').hide()
    $('#rack_units_div').hide()
    $('#datacenter').change()

  $('#datacenter').on change: ->
    server_racks = []
    this_id = parseInt($(this).val())
    for d in data
      server_racks = d['server_racks'] if d['id'] == this_id
    $('#server_rack option').remove()
    $('#server_rack').append($('<option></option>').attr('selected', true))
    for rack in server_racks
      $('#server_rack').append($('<option></option>').attr('value', rack['id']).text(rack['name']))
    if server_racks.length == 0
      $('#server_racks_div').hide()
    else
      $('#server_racks_div').show()

  $('#server_rack').on change: ->
    rack_units = []
    this_id = parseInt($(this).val())
    for server_rack in server_racks
      rack_units = server_rack['rack_units'] if server_rack['id'] == this_id
    $('#rack_unit option').remove()
    for rack_unit in rack_units
      $('#rack_unit').append($('<option></option>').attr('value', rack_unit['id']).text("row #{rack_unit['row_number']}"))
    if rack_units.length == 0
      $('#rack_units_div').hide()
    else
      $('#rack_units_div').show()

  #$('#parent_hardware').on change: ->


  # init
  $('#location_parent').click()