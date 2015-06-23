Template.registerHelper "currencySymbol", (currency) ->
  if currency is 'rmb' then '￥' else '$'
