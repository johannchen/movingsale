Session.setDefault 'archived', false
Session.setDefault 'showSold', false

getItems = ->
  category = Session.get 'category'
  archived = Session.get 'archived'
  sold = Session.get 'sold'
  showSold = Session.get 'showSold'
  condition = {archived: archived}

  condition.categories = {$in: [category]} if category
  condition.sold = sold if showSold
  Items.find condition, sort: createdAt: -1

Template.items.helpers
  count: ->
    getItems().count()
  total: ->
    sum = 0
    getItems().forEach (item) ->
      sum += parseInt(item.price)
    sum
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
