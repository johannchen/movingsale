Template.categories.helpers
  categories: ->
    Categories.find()
  buyers: ->
    buyers = []
    Items.find({archived: false, sold: true}).forEach (item) ->
      buyers.push item.buyer if item.buyer and buyers.indexOf(item.buyer) == -1
    buyers
  buyer: ->
    @

Template.categories.events
  'click #all': ->
    Session.set 'category', null
    Session.set 'showSold', false
    Session.set 'archived', false
    Session.set 'available', false
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
  'click #showSold': (evt, tmpl)->
    Session.set 'sold', true
    Session.set 'showSold', true
  'click #showOnSale': ->
    Session.set 'sold', false
    Session.set 'showSold', true
  'click #availableNow': ->
    Session.set 'available', true
  'change #buyer': (evt, tmpl)->
    buyer = tmpl.find('#buyer').value
    buyer = null if buyer is ''
    Session.set 'buyer', buyer
