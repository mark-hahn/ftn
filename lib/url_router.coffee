###
	url_router.js   
###

log = require('lib/logger') 'url_router', dbg: 0

Backbone   = require 'backbone'
_		   = require 'underscore'

module.exports = Backbone.Router.extend

	ftnPath: 'ftn/_design/ftn/index.html'

	routes: [
		['root',    'Root', 	'']
		['db',      'DB', 		'*', 					'db']
		['doc',     'Doc', 		'*/*', 					'db', 'id'				]
		['attach',  'Attach', 	'*/*/*', 				'db', 'id', 'attach'	]
		['des',     'Design', 	'*/_design/*', 			'db', 'design'			]
		['view',    'View', 	'*/_design/*/_view/*', 	'db', 'design', 'view'	]
	]	
	
	initialize: ({@globalEvents, @urlModel}) ->
		log 'initialize'
		
		for route in @routes
			[type, label, ptrn] = route
			
			regEx = new RegExp (
				if not ptrn
					'^' + @ftnPath + '/\?$'
				else 
					'^' + @ftnPath + '\\?u=/' + ptrn.replace(/\*/g, '([^/\?#]*)') + '/?(\\?([^#]*))?$'
			)
			
			log 'route ' + type, regEx
					
			do (route) => @route regEx, 'n', (parts...) => @urlChange route, parts
		
		Backbone.history.start pushState: true
	
	
	urlChange: (route, parts) ->
		[type, label, ptrn, keys...] = route
		
		log 'info',  '--- URL: ', type, parts
		
		attrs = {type, label, ptrn, keys}
		
		for key, i in keys then attrs[key] = parts[i]
		
		if (queries = parts[-1..-1][0]?.split '&')
			attrs.query = {}
			for query in queries
				[key, val] = query.split '='
				if key then attrs.query[key] = val ? 'true'
		
		log 'set urlModel attrs', attrs
		
		@urlModel.set attrs
		
 