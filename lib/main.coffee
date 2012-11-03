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
#	['favicon', '', 'asdf']
#	
	['db',      'DB', 		'*', 					'db']
	['doc',     'Doc', 		'*/*', 					'db', 'doc'				]
	['attach',  'Attach', 	'*/*/*', 				'db', 'doc', 'attach'	]
	['des',     'Design', 	'*/_design/*', 			'db', 'design'			]
	['view',    'View', 	'*/_design/*/_view/*', 	'db', 'design', 'view'	]
]

$ -> 
	for route in routes
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
			query = @.model.get('query')
			if query then bodyTxt += 'query: ' + query
				
			$('#tabBody').html bodyTxt

	tabsView = new TabsView
		el: $('#tabRow')[0]
		model: urlModel
	
	
	buildUrl = (attrs) ->
		{ptrn: path, keys, query} = attrs
		
		for key in keys then path = path.replace /\*/, attrs[key]
		if query
			qarr = []; for key, val of query then qarr.push key + '=' + val
			path += '?' + qarr.join '&'
		
		$.getJSON '/' + path, (doc, status) ->
			return if not status is 'success' 
			editor.set doc
	
		urlModel.set attrs
		
		
	urlChange = (parts...) ->
		[type, label, ptrn, keys...] = @
		
		console.log '--- URL: ', type, parts
		
		attrs = {type, label, ptrn, keys}
		
		for key, i in keys then attrs[key] = parts[i]
		
		if (queries = parts[-1..-1][0]?.split '&')
			attrs.query = {}
			for query in queries
				[key, val] = query.split '='
				if key then attrs.query[key] = val ? 'true'
		
		buildUrl attrs
		
	
	UrlRouter = Backbone.Router.extend
		initialize: ->
			for route in routes
				[type, label, ptrn] = route
				
				regEx = new RegExp '^' + ftnPath + '\\?u=/' + 
						ptrn.replace(/\*/g, '([^/\?#]*)') + '/?(\\?([^#]*))?$'
				@route regEx, 'n', _.bind urlChange, route
				
			null
	
	urlRouter = new UrlRouter()
	Backbone.history.start pushState: true
