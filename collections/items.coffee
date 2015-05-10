@Items = new Mongo.Collection 'items'

Meteor.methods
  addItem: (item) ->
    throw new Meteor.Error("not-authorized") unless Meteor.userId()
    item.createdAt = new Date()
    item.archived = false
    item.userId = Meteor.userId()
    Items.insert item
  updateCategory: (id, category) ->
    Items.update id,
      $addToSet: categories: category
  removeCategory: (id, category) ->
    Items.update id,
      $pull: categories: category
  archiveItem: (id) ->
    Items.update id,
      $set: archived: true
  unarchiveItem: (id) ->
    Items.update id,
      $set: archived: false
