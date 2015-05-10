Template.navbar.helpers
  chinese: ->
    Session.get('language') is "zh"

Template.navbar.events
  'keypress #search': (evt, tmpl) ->
    if evt.which is 13
      search = tmpl.find('#search').value
      if search
        Session.set 'search', search
        Session.set 'category', null
        Session.set 'skip', 0
      false

  'click .english': ->
    Session.set 'language', 'en'
    TAPi18n.setLanguage('en')
    accountsUIBootstrap3.setLanguage "en"

  'click .chinese': ->
    Session.set 'language', 'zh'
    TAPi18n.setLanguage('zh')
    accountsUIBootstrap3.setLanguage "zh"
