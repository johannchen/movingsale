Template.admin.helpers
  catList: ->
    Categories.find()
  archiveShown: ->
    Session.get 'archived'

Template.admin.events
  'click #clearItem': (evt, tmpl) ->
    tmpl.find('#newItem').reset()
  'click #addItem': (evt, tmpl) ->
    item = {}
    category = tmpl.find('#categories').value
    item.name = tmpl.find('#name').value
    item.cost = tmpl.find('#cost').value
    item.price = tmpl.find('#price').value
    item.condition = tmpl.find('#condition').value
    item.image = tmpl.find('#image').value
    item.vendor = tmpl.find('#vendor').value
    item.categories = [category] if category
    Meteor.call 'addItem', item
    tmpl.find('#newItem').reset()
  'click #showArchive': ->
    Session.set 'archived', true
  'click #hideArchive': ->
    Session.set 'archived', false
