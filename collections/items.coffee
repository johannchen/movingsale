@Items = new Mongo.Collection 'items'

Meteor.methods
  addItem: (item) ->
    throw new Meteor.Error("not-authorized") unless Meteor.userId()
    item.createdAt = new Date()
    item.archived = false
    item.sold = false
    item.userId = Meteor.userId()
    Items.insert item
  updateCategory: (id, category) ->
    Items.update id,
      $addToSet: categories: category
  removeCategory: (id, category) ->
    Items.update id,
      $pull: categories: category
  removeItem: (id) ->
    Items.remove id
  archiveItem: (id) ->
    Items.update id,
      $set: archived: true
  unarchiveItem: (id) ->
    Items.update id,
      $set: archived: false
  soldItem: (id) ->
    Items.update id,
      $set: sold: true
  onsaleItem: (id) ->
    Items.update id,
      $set: sold: false
  updateAvailability: (id, available) ->
    Items.update id,
      $set: available: available
