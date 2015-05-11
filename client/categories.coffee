Template.categories.helpers
  categories: ->
    Categories.find()

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
