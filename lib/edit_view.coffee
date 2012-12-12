###
	edit_view.js 
###  

log = require('lib/logger') 'edit_view', dbg: 0

$ 		   = require 'jquery'
Backbone   = require 'backbone'
_		   = require 'underscore'

{div} = dk = require('drykup') expand: yes

basePath = /^(https?:\/\/[^\/]*\/)/.exec(location.href)?[1]

module.exports = Backbone.View.extend

	initialize: ({@globalEvents}) -> 
		log 'initialize'
		
		@jsonEditor = new JSONEditor @el
		
		log '@jsonEditor', @jsonEditor
		
		@model.on 'change', => @render()
		
	render: ->
		log 'render'
		
		path = @model.get 'path'
		
		log 'render path ' + path
		
		$.getJSON basePath + path, (doc, status) =>
			if status isnt 'success'
				log 'err', 'render getJSON ' + status + ' ' + path
				return
			
			log 'render getJSON' + status + ' ' + path, doc
			
			@jsonEditor.set doc
		
