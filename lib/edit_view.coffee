###
	edit_view.js 
###  

$ 		   = require 'jquery'
Backbone   = require 'backbone'
_		   = require 'underscore'

{div} = dk = require('drykup') expand: yes

module.exports = Backbone.View.extend

	initialize: ({@globalEvents}) -> 
		console.log 'new EditView'
		
		@jsonEditor = new JSONEditor @el
		
	render: ->
		path = @model.get(path)
		
		$.getJSON path, (doc, status) ->
			if status isnt 'success'
				console.log 'edit_view getJSON err ' + status + ' ' + path
				return
				
			@jsonEditor.set doc
		
