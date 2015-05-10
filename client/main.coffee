Tracker.autorun ->
	# redirect to user page
	FlowRouter.go '/listing/' + Meteor.userId() if Meteor.userId()
