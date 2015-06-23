@Sellers = new Mongo.Collection 'sellers'

Meteor.methods
  upsertSeller: (name, email, address, availableDate, currency) ->
    throw new Meteor.Error("not-authorized") unless Meteor.userId()
    Sellers.upsert {userId: Meteor.userId()},
      userId: Meteor.userId(),
      name: name
      email: email
      address: address
      availableDate: availableDate
      currency: currency
