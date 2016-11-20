// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap/alert
//= require bootstrap/dropdown
//= require_tree .
content = $('#content')    # where to load new content
viewMore = $('#view-more') # tag containing the "View More" link

isLoadingNextPage = false  # keep from loading two pages at once
lastLoadAt = null          # when you loaded the last page
minTimeBetweenPages = 5000 # milliseconds to wait between loading pages
loadNextPageAt = 1000      # pixels above the bottom

waitedLongEnoughBetweenPages = ->
  return lastLoadAt == null || new Date() - lastLoadAt > minTimeBetweenPages

approachingBottomOfPage = ->
  return document.documentElement.clientHeight +
      $(document).scrollTop() < document.body.offsetHeight - loadNextPageAt

nextPage = ->
  url = viewMore.find('a').attr('href')

  return if isLoadingNextPage || !url

  viewMore.addClass('loading')
  isLoadingNextPage = true
  lastLoadAt = new Date()

  $.ajax({
    url: url,
    method: 'GET',
    dataType: 'script',
    success: ->
      viewMore.removeClass('loading');
      isLoadingNextPage = false;
      lastLoadAt = new Date();
  })
# watch the scrollbar
$(window).scroll ->
  if approachingBottomOfPage() && waitedLongEnoughBetweenPages()
    nextPage()

# failsafe in case the user gets to the bottom
# without infinite scrolling taking affect.
viewMore.find('a').click (e) ->
  nextPage()
  e.preventDefaults()
