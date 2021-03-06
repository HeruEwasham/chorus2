@Kodi.module "MovieApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.PageLayout extends App.Views.LayoutWithHeaderView
    className: 'movie-show detail-container'

  class Show.HeaderLayout extends App.Views.LayoutDetailsHeaderView
    className: 'movie-details'

  class Show.Details extends App.Views.ItemView
    template: 'apps/movie/show/details_meta'
    triggers:
      'click .play': 'movie:play'
      'click .add': 'movie:add'
      'click .stream': 'movie:localplay'
      'click .download': 'movie:download'
    events:
      "click .watched"    : "toggleWatched"
    attributes: ->
      @watchedAttributes()

  class Show.MovieTeaser extends App.Views.CardView
    tagName: "div"
    className: "card-detail"
    triggers:
      'click .play': 'movie:play'

  class Show.Content extends App.Views.LayoutView
    template: 'apps/movie/show/content'
    className: "movie-content content-sections"
    onRender:
      $('[data-toggle="tooltip"]', @$el).tooltip()
    triggers:
      'click .youtube': 'movie:youtube'
    regions:
      regionCast: '.region-cast'
      regionSets: '.region-sets'

  class Show.Set extends App.Views.LayoutView
    template: 'apps/movie/show/set'
    className: 'movie-set'
    onRender: ->
      if @options
        if @options.set
          $('h2.set-name', @$el).html( @options.set )
    regions: ->
      regionCollection: '.collection-items'