Session.setDefault 'itemId', null

Template.item.helpers
  category: ->
    @
  catList: ->
    Categories.find()
  percentOff: ->
    Math.round((@cost - @price) / @cost * 100)

Template.item.events
  'click .offer': ->
    Session.set 'itemId', @_id
    $('#offer').modal('show')
  'keypress #newCat': (evt, tmpl) ->
    # enter key is pressed
    if evt.which is 13
      category = tmpl.find('#newCat').value
      Meteor.call 'updateCategory', @_id, category
      tmpl.find('#newCat').value = null
  'click .remove-cat': ->
    category = String @
    item = Template.currentData()
    Meteor. call 'removeCategory', item._id, category
  'click #archive': ->
    Meteor.call 'archiveItem', Template.currentData()._id
  'click #unarchive': ->
    Meteor.call 'unarchiveItem', Template.currentData()._id
  'click #sold': ->
    Meteor.call 'soldItem', @_id
  'click #onsale': ->
    Meteor.call 'onsaleItem', @_id
  'change #available': (evt, tmpl) ->
    Meteor.call 'updateAvailability', @_id, evt.target.checked
