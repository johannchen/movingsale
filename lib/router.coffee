FlowRouter.route '/listing/:id',
  subscriptions: (params) ->
    Session.set 'uid', params.id
    @register 'categories', Meteor.subscribe('categories', params.id)
    @register 'items', Meteor.subscribe('items', params.id)
    @register 'seller', Meteor.subscribe('seller', params.id)
  action: ->
    FlowLayout.render 'mainLayout',
      top: 'navbar'
      left: 'categories'
      main: 'items'
      right: 'right'

FlowRouter.route '/',
  action: ->
    FlowLayout.render 'topDownLayout',
      top: 'navbar'
      main: 'about'
