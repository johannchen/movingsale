Template.offer.helpers
  item: ->
    Items.findOne(Session.get 'itemId') if Session.get 'itemId'

Template.offer.events
  'click #makeOffer': (evt, tmpl) ->
    to = Emails.findOne().email
    from = tmpl.find('#email').value
    subject = "Offer " + @name + ": RMB ￥" + tmpl.find('#offerPrice').value
    Meteor.call 'makeOffer', to, from, subject
    $('#offer').modal('hide')
