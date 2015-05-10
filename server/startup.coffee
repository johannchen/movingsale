Meteor.startup ->
  if Meteor.users.find().count() is 0
    Accounts.createUser
      email: 'johannchen@gmail.com'
      password: 'changeme'
      profile: name: 'johann'
