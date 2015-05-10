Template.profile.onCreated ->
  @editingProfile = new ReactiveVar(null)

Template.profile.helpers
  profile: ->
    Meteor.user().profile
  editingProfile: ->
    Template.instance().editingProfile.get()

Template.profile.events
  'click #editProfile': (evt, tmpl) ->
    tmpl.editingProfile.set true
  'click #updateProfile': (evt, tmpl) ->
    profile =
      name: tmpl.find('#name').value
    Meteor.users.update Meteor.userId(),
      $set: profile: profile
    tmpl.editingProfile.set null
