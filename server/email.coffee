Meteor.methods
  makeOffer: (to, from, subject) ->
    Email.send
      to: to
      from: from
      subject: subject
  contactUs: (to, from, subject, message) ->
    Email.send
      to: to
      from: from
      subject: subject
      text: message
