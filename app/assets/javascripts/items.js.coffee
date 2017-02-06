# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  numbers = new Bloodhound(
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('measurement')
    queryTokenizer: Bloodhound.tokenizers.whitespace
    local: [
      { measurement: 'quart' }
      { measurement: 'pound' }
      { measurement: 'gallon' }
      { measurement: 'ounce' }
      { measurement: 'pound' }
      { measurement: 'case' }
    ])
  # initialize the bloodhound suggestion engine
  numbers.initialize()
  # instantiate the typeahead UI
  $('.typeahead').typeahead null,
    displayKey: 'measurement'
    source: numbers.ttAdapter()
