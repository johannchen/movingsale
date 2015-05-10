@Categories = new Mongo.Collection 'categories'

Meteor.methods
  addCategory: (category) ->
    throw new Meteor.Error("not-authorized") unless Meteor.userId()
    Categories.insert
      name: category
      userId: Meteor.userId()
  deleteCategory: (id) ->
    Categories.remove id if Meteor.userId()
