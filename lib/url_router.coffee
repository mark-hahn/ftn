###
	url_router.js   
###

Backbone   = require 'backbone'
_		   = require 'underscore'

module.exports = Backbone.Router.extend

	ftnPath: 'ftn/_design/ftn/index.html'

	routes: [
		['db',      'DB', 		'*', 					'db']
		['doc',     'Doc', 		'*/*', 					'db', 'doc'				]
		['attach',  'Attach', 	'*/*/*', 				'db', 'doc', 'attach'	]
		['des',     'Design', 	'*/_design/*', 			'db', 'design'			]
		['view',    'View', 	'*/_design/*/_view/*', 	'db', 'design', 'view'	]
	]	
	
	initialize: ({@globalEvents, @urlModel}) ->
		console.log 'new UrlRouter'
		
		for route in @routes
			[type, label, ptrn] = route
			
			regEx = new RegExp '^' + @ftnPath + '\\?u=/' + 
					ptrn.replace(/\*/g, '([^/\?#]*)') + '/?(\\?([^#]*))?$'
			
			do (route) => @route regEx, 'n', (parts...) -> @urlChange route, parts
		
		Backbone.history.start pushState: true
	
	
	urlChange: (route, parts) ->
		[type, label, ptrn, keys...] = route
		
		console.log '--- URL: ', type, parts
		
		attrs = {type, label, ptrn, keys}
		
		for key, i in keys then attrs[key] = parts[i]
		
		if (queries = parts[-1..-1][0]?.split '&')
			attrs.query = {}
			for query in queries
				[key, val] = query.split '='
				if key then attrs.query[key] = val ? 'true'
		
		@urlModel.set attrs
		
		console.log 'UrlRouter set attrs', attrs
