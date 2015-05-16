Session.setDefault 'archived', false
Session.setDefault 'showSold', false

getItems = ->
  category = Session.get 'category'
  archived = Session.get 'archived'
  sold = Session.get 'sold'
  showSold = Session.get 'showSold'
  available = Session.get 'available'
  buyer = Session.get 'buyer'
  condition = {archived: archived}

  condition.categories = {$in: [category]} if category
  condition.sold = sold if showSold
  condition.available = available if available
  condition.buyer = buyer if buyer
  Items.find condition, sort: createdAt: -1

Template.items.helpers
  filter: ->
    filter = ''
    filter = 'Archived ' if Session.get 'archived'
    filter += Session.get 'category' if Session.get 'category'
    if Session.get 'showSold'
      if Session.get 'sold'
        filter += ' Sold'
      else
        filter += ' On Sale'
    filter += ' Available Now' if Session.get 'available'
    filter += ' ' + Session.get 'buyer' if Session.get 'buyer'
    filter

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
