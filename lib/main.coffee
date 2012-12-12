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

UrlModel   = require 'lib/url_model'
UrlView    = require 'lib/url_view'
EditView   = require 'lib/edit_view'
UrlRouter  = require 'lib/url_router'

$ ->
	globalEvents = _.clone Backbone.Events

	viewStackColl = Backbone.Collection.extend

	viewStackColl.add (urlModel  = new UrlModel  {globalEvents})

	urlView   = new UrlView   {
		globalEvents
		model: urlModel
		el: $('#urlTabs')[0]
		routes: UrlRouter.prototype.routes
	}

	editView  = new EditView  {
		globalEvents
		model: urlModel
		el: $('#jsoneditor')[0]
	}

	urlRouter = new UrlRouter {globalEvents, urlModel}

