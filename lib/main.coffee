###
	ftn main.js 
	this loads and runs the entire app
### 

$ 		   = require 'jquery'
db 		   = require 'db'
adapter    = require 'backbone-adapter'
JSONEditor = require 'jsoneditor/jsoneditor'

Backbone = require 'backbone'
Backbone.db   	= '/';
Backbone.sync 	= adapter.sync;

ftnUrl = require 'lib/ftn_url'

$ ->
	editor = new JSONEditor $('#jsoneditor')[0]
	
	$.getJSON ftnUrl.url, (doc, status) ->
		return if not status is 'success' 
		
		editor.set doc
		
		
		
