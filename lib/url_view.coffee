###
	url_view.js
###

$ 		   = require 'jquery'
Backbone   = require 'backbone'
_		   = require 'underscore'

{div} = dk = require('drykup') expand: yes

module.exports = Backbone.View.extend

	initialize: ({@globalEvents, @routes}) ->
		#console.log 'new UrlView'
		#console.log ($('#urlTabs')[0] is @el), (@$el is $(@el))
		#console.log 'UrlView @el', @el, @$el, @$el.attr 'id'

		@$urlTabRow = $ '#urlTabRow',  @$el
		@$urlPanes  = $ '#urlPanes',   @$el

		#console.log 'UrlView jqobjs', @$el, @$urlTabRow, @$urlPanes

		for route in @routes
			[type, label] = route
			if label
				dk.htmlOut = ''
				div x:"c=urlTab", label
				@$urlTabRow.append dk.htmlOut

		@model.on 'change', => @render()

	render: ->
		#console.log 'UrlView render', @model.toJSON(), @el

		$('.urlTab', @$urlTabRow).removeClass 'selTab'
		$('.urlTab:contains("' + @model.get('label') + '")', @$urlTabRow).addClass 'selTab'

		bodyTxt = ''
		for key in @model.get 'keys'
			bodyTxt += key + ': ' +@model.get(key) + '<br>\n'
		query = @model.get('query')
		if query then bodyTxt += 'query: ' + query

		#console.log 'UrlView urlPanes ' + @$urlPanes.length + ' ' + bodyTxt, @$urlPanes

		@$urlPanes.html bodyTxt

		@
