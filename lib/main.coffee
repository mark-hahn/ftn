###
	ftn main.js 
	this loads and runs the entire app
### 

db 		 = require 'db'
Backbone = require 'backbone'
adapter  = require 'backbone-adapter'
$ 		 = require 'jquery'

require 'jsoneditor/jsoneditor'

Backbone.db   = '/';
Backbone.sync = adapter.sync;

$ ->
	editor = new JSONEditor $('#jsoneditor')[0]

