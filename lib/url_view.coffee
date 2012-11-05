###
	url_view.js 
###  

$ 		   = require 'jquery'
Backbone   = require 'backbone'
_		   = require 'underscore'

{div} = dk = require('drykup') expand: yes

module.exports = Backbone.View.extend

	initialize: ({@globalEvents, @routes}) ->
		console.log 'new UrlView'
		
		for route in @routes
			[type, label] = route
			if label
				dk.htmlOut = ''
				div x:"c=urlTab", label
				@$el.append dk.htmlOut
 			
	render: ->
		console.log 'UrlView render', @urlModel.toJSON(), @el
		
		$('.urlTab', @$el).removeClass 'selTab'
		$('.urlTab:contains("' + @model.get('label') + '")', @$el).addClass 'selTab'
			
		bodyTxt = ''
		for key in @model.get 'keys'
			bodyTxt += key + ': ' +@model.get(key) + '<br>\n'
		query = @model.get('query')
		if query then bodyTxt += 'query: ' + query
			
		@$el.html bodyTxt

		@
