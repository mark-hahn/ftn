###
	ftn main.js 
	this loads and runs the entire app
### 

console.log 'ftn main started'

db 		 = require 'db'
Backbone = require 'backbone'
adapter  = require 'backbone-adapter'

Backbone.db   = '/';
Backbone.sync = adapter.sync;

console.log 'ftn main finished'
