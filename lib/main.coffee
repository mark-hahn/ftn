###
	ftn main.js 
	this loads and runs the entire app
###  

$ 		   = require 'jquery'
db 		   = require 'db'
adapter    = require 'backbone-adapter'
JSONEditor = require 'jsoneditor/jsoneditor'
Backbone   = require 'backbone'
_		   = require 'underscore'

{div} = dk = require('drykup') expand: yes

ftnPath = 'ftn/_design/ftn/index.html'

routes = [
	['favicon', '', 'asdf']
	
	['view',    'View', 	'*/_design/*/_view/*', 	'db', 'design', 'view'	]
	['des',     'Design', 	'*/_design/*', 			'db', 'design'			]
	['attach',  'Attach', 	'*/*/*', 				'db', 'doc', 'attach'	]
	['doc',     'Doc', 		'*/*', 					'db', 'doc'				]
	['db',      'DB', 		'*', 					'db']
]

routesForDisplay = _.clone routes
routesForDisplay.reverse()

$ -> 
	for route in routesForDisplay
		[type, label, ptrn, keys...] = route
		if label
			dk.htmlOut = ''
			div x:"c=urlTab", label
			$('#tabRow').append dk.htmlOut

	editor = new JSONEditor $('#jsoneditor')[0]
	
	
	UrlModel = Backbone.Model.extend {}
	urlModel = new UrlModel()
	
	TabsView = Backbone.View.extend
		initialize: ->
			@model.on 'change', =>
				@render()
		
		render: ->
			$('.urlTab', @$el)
				.removeClass 'selTab'
			$('.urlTab:contains("' + @.model.get('label') + '")', @$el)
				.addClass 'selTab'
				
			bodyTxt = ''
			for key in @.model.get 'keys'
				bodyTxt += key + ': ' + @.model.get(key) + '<br>\n'
				
			$('#tabBody').html bodyTxt

	tabsView = new TabsView
		el: $('#tabRow')[0]
		model: urlModel
		
		
#	$.getJSON '/' + path, (doc, status) ->
#		return if not status is 'success' 
#		console.log 'getJSON: ', doc
#		editor.set doc

	
	
	buildUrl = (attrs) ->
		{ptrn: path, keys} = attrs
		for key in keys then path = path.replace /\*/, attrs[key]
		urlModel.set attrs
		
	
	urlChange = (parts...) ->
		[type, label, ptrn, keys...] = @

		console.log '--- URL: ', type, parts
		
		attrs = {type, label, ptrn, keys}
		for key, i in keys then attrs[key] = parts[i]
		
		buildUrl attrs
		
	
	UrlRouter = Backbone.Router.extend
		initialize: ->
			for route in routes
				[type, label, ptrn] = route
				
				regEx = new RegExp  '^' + ptrn.replace(/\*/g, '([^/]*)') + '$'
				console.log regEx
				
				path = ftnPath + '?u=/' + ptrn.replace /\*/g, ':x'
				console.log path
				@route path, 'n', _.bind urlChange, route
			null
	
	urlRouter = new UrlRouter()
	Backbone.history.start pushState: true
