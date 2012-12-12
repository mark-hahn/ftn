###
	url_model.js 
###  

log = require('lib/logger') 'url_model', dbg: 0

$ 		   = require 'jquery'
Backbone   = require 'backbone'
_		   = require 'underscore'

module.exports = Backbone.Model.extend

	initialize: ({@globalEvents}) ->
		log 'initialize'
	
		@.on 'change', ->
			{ptrn, keys, query} = attrs = @toJSON()
		
			path = ptrn
			for key in keys then path = path.replace /\*/, attrs[key]
			if query
				qarr = []
				for key, val of query then qarr.push key + '=' + val
				path += '?' + qarr.join '&'
			@.set {path}, silent: yes
			
			log 'change path', path
			
		

