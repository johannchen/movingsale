Session.setDefault 'archived', false
getItems = ->
  category = Session.get 'category'
  archived = Session.get 'archived'
  if category
    Items.find {archived: archived, categories: $in: [category]},
      sort: createdAt: -1
  else
    #Items.find {archived: archived},
    Items.find {},
      sort: createdAt: -1

Template.items.helpers
  total: ->
    getItems().count()
  noItemFound: ->
    getItems().count() == 0
  items: ->
    items = []
    row = []
    index = 0
    myItems = getItems()
    myItems.forEach (item) ->
      row.push item
      unless index % 2 == 0
        items.push row: row
        row = []
      index++
    #last odd item
    items.push row: row if row.length > 0
    items
