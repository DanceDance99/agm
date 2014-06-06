class @Booking
  @departDates: []
  @returnDates: []
  
jQuery ->
  jQuery('.new_booking').on('change','#booking_passengers, #booking_from_id, #booking_to_id, #booking_round_trip_true', (e)->
    
    shuttle_id = jQuery('#booking_modal_button').data('shuttle-id')
    
    if(jQuery('#booking_from_id').val() and jQuery('#booking_to_id').val())
      
      jQuery('.depart_description').html(jQuery('#booking_from_id option:selected').text() + " to " + jQuery('#booking_to_id option:selected').text())
      if jQuery('#booking_round_trip').is(':checked')
        jQuery('.return_description').html(jQuery('#booking_to_id option:selected').text() + " to " + jQuery('#booking_from_id option:selected').text())
      else
        jQuery('.return_description').html('')
      
      jQuery.post("/shuttles/" + shuttle_id + "/bookings/dates", jQuery('.new_booking').serialize(), (e) ->
        
        jQuery('#depart_date_datepicker').datepicker('destroy')
        jQuery('#return_date_datepicker').datepicker('destroy')
        
        
        jQuery('#depart_date_datepicker').datepicker(
          defaultDate: ''
          altFormat: "yy-mm-dd"
          altField: '#depart_date_hidden_datepicker'
          beforeShowDay: (date) ->
            
            # format javascript date to match rails
            date = date.getFullYear() + '-' + ('0' + (date.getMonth()+1)).slice(-2) + '-' + ('0' + date.getDate()).slice(-2);
            
            if $.inArray(date, Booking.departDates) != -1
              return [true, "", "Available"]
            else
              return [false, "", "Unavailable"]
        )

        jQuery('#return_date_datepicker').datepicker(
          defaultDate: ''
          altFormat: "yy-mm-dd"
          altField: '#return_date_hidden_datepicker'
          beforeShowDay: (date) ->
            
            # format javascript date to match rails
            date = date.getFullYear() + '-' + ('0' + (date.getMonth()+1)).slice(-2) + '-' + ('0' + date.getDate()).slice(-2);
            
            
            if $.inArray(date, Booking.returnDates) != -1
              return [true, "", "Available"]
            else
              return [false, "", "Unavailable"]
        )
      )
      
  )
  
  
  jQuery('.new_booking').on('change','#booking_round_trip_true, #booking_round_trip_false', (e)->
    jQuery('#return_date_datepicker').toggle(jQuery('[name=booking\\[round_trip\\]]:checked').val() == 'true')
  )
          