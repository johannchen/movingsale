Template.categories.helpers
  categories: ->
    Categories.find()
  sold: ->
    Session.get 'sold'
###
  buyers: ->
    buyers = []
    Items.find().forEach (item) ->
      buyers.push item.buyer
    buyers
###

Template.categories.events
  'click #all': ->
    Session.set 'category', null
  'click .category': ->
    Session.set 'category', @name
  'dblclick .category': ->
    if Meteor.user()
      Meteor.call 'deleteCategory', @_id if confirm 'Are you sure to delete this category ' + @name + '?'
  'keypress #newCategory': (evt, tmpl) ->
    # enter key is pressed
    if evt.which is 13
      category = tmpl.find('#newCategory').value
      Meteor.call 'addCategory', category
      tmpl.find('#newCategory').value = null
  'click #showArchive': ->
    Session.set 'archived', true
  'click #showSold': ->
    Session.set 'sold', true
    Session.set 'showSold', true
  'click #showOnSale': ->
    Session.set 'sold', false
    Session.set 'showSold', true
  'click #showAll': ->
    Session.set 'showSold', false
    Session.set 'archived', false
