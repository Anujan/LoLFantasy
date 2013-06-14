class Ad
  constructor: (@adsense, @id, @container, @options) ->

  load: ->
    if @ad_object? then @refresh() else @create()

  refresh: ->
    @ad_object.refresh()

  create: ->
    @ad_object = new google.ads.Ad @adsense.ad_client, @container, @options