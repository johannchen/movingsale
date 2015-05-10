Accounts.onCreateUser (options, user) ->
	# send email to admin
	Email.send
		to: 'johannchen@gmail.com'
		from: options.email
		subject: 'New user sign up in Moving Sale'
		text: 'Please go to ' + Meteor.absoluteUrl()
	# add email to list
	Emails.insert
		email: options.email
		userId: user._id
	# default hook's 'profile' behavior
	user.profile = options.profile if options.profile
	user
