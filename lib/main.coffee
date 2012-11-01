###
	ftn main.js 
	this loads and runs the entire app
### 

db 		 = require 'db'
adapter  = require 'backbone-adapter'
$ 		 = require 'jquery'

Backbone = require 'backbone'
Backbone.db   = '/';
Backbone.sync = adapter.sync;

require 'jsoneditor/jsoneditor'
ftnUrl = require 'lib/ftn_url'

$ ->
	editor = new JSONEditor $('#jsoneditor')[0]
	
	$.getJSON ftnUrl.url, (doc, status) ->
		console.log status, doc
		
		return if not status is 'success' 
		
		editor.set doc
		
