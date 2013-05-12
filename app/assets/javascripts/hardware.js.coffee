$ = jQuery
$ ->
  data = JSON.parse($('#location_data').val())
  server_racks = []
  rack_units = []

  $('#purchase_no').on change: ->
    return if not $(this).is(':checked')
    $('#purchase_div').hide()

  $('#purchase_yes').on change: ->
    return if not $(this).is(':checked')
    $('#purchase_div').show()

  $('#location_parent').on change: ->
    return if not $(this).is(':checked')
    $('#datacenters_div').hide()
    $('#server_racks_div').hide()
    $('#rack_units_div').hide()

    $('#parent_hardware_div').show()
    $('#positions_div').show()

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
    $('#server_rack').change()

  $('#server_rack').on change: ->
    rack_units = []
    this_id = parseInt($(this).val())
    for server_rack in server_racks
      rack_units = server_rack['rack_units'] if server_rack['id'] == this_id
    $('#rack_unit option').remove()
    for rack_unit in rack_units
      text = "row #{rack_unit['row_number']}"
      if rack_unit['hardwares'].length == 0
        text += " (free position)"
      else
        text += " (already occupied by #{rack_unit['hardwares'].length} pcs of hw)"
      $('#rack_unit').append($('<option></option>').attr('value', rack_unit['id']).text(text))
    if rack_units.length == 0
      $('#rack_units_div').hide()
    else
      $('#rack_units_div').show()

  $('.key_select').live change: ->
    if $(this).val() != '' && $(this).attr('cloned') != 'true'
      $(this).attr('cloned', 'true')
      $('.parameter_div:first').clone().appendTo('#parameters_fieldset').show()

  # init
  $('input[type=radio]:checked').change()
  if $('#name').val() == ''
    $('input[type=radio]:checked').change()
    #$('#location_physical').click()
    #$('#location_parent').click()
    #$('#purchase_yes').click()
    #$('#purchase_no').click()
    $('.parameter_div:first').hide()

