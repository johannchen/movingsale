Template.contact.events
  'click #sendMessage': (evt, tmpl) ->
    if Session.get('uid')
      to = Emails.findOne().email
      from = tmpl.find('#from').value
      subject = tmpl.find('#subject').value
      message = tmpl.find('#message').value
      Meteor.call 'contactUs', to, from, subject, message
      tmpl.find('#subject').value = null
      tmpl.find('#message').value = null
    false
