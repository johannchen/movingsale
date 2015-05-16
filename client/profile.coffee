Template.profile.onCreated ->
  @editingProfile = new ReactiveVar(null)

Template.profile.helpers
  profile: ->
    #Meteor.user().profile
    Sellers.findOne(userId: Meteor.userId()) || {name: ""}
  editingProfile: ->
    Template.instance().editingProfile.get()

Template.profile.events
  'click #cancel': (evt, tmpl) ->
    tmpl.editingProfile.set false
  'click #editProfile': (evt, tmpl) ->
    tmpl.editingProfile.set true
  'click #updateProfile': (evt, tmpl) ->
    name = tmpl.find('#name').value
    email = tmpl.find('#email').value
    address = tmpl.find('#address').value
    availableDate = tmpl.find('#availableDate').value
    profile =
      name: name
      address: address
    Meteor.users.update Meteor.userId(),
      $set: profile: profile
    Meteor.call 'upsertSeller', name, email, address, availableDate
    tmpl.editingProfile.set null
