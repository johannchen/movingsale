Meteor.publish "categories", (id) ->
  Categories.find({userId: id}, sort: name: 1)

Meteor.publish "items", (id) ->
  Items.find(userId: id)
Meteor.publish "seller", (id) ->
  Emails.find(userId: id)
