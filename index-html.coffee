###  
	index-html.coffee: creates the index.html file
###

console.log '**** index.html compiling'

fs   = require 'fs'
exec = require('child_process').exec
_	 = require './packages/underscore-string/underscore-string'

{doctype,html,head,meta,title,script,body,div, text} = 
		dk = require('./packages/drykup/drykup') expand: yes

doctype 5 
html ->
	head ->
		meta "http-equiv": "Content-Type", content:"text/html; charset=UTF-8"
		title "FTN"
		
		text '<link href="jsoneditor/jsoneditor.css" rel="stylesheet">'
		
		script src:"modules.js", ''
		script "require('lib/main')"
		
	body x:"font-family:tahoma,sans-serif", ->
		div x:"c:b f:l w:100% h:23 bc:#ffa p:r l:-10 t:-8", ->
			div x:"c:b f:l p:r l:10 t:-2 p:4 w:90 h:20 fs:15 fw:b", 'FTN'
			div {x:"f:l ml:20 h:20 p:4 fs:12"}, 
				'(Compiled ' + (new Date().toLocaleString()[0..20]) + ')'
				
		div x:"i=jsoneditor w:100% h:400"	
		
fs.writeFileSync 'index.html', dk.htmlOut

exec 'kanso push', (err, stdout, stderr) -> 
	console.log _.trim stdout
	if err or stderr then console.log "ERROR: kanso push exec " + err + '\n' + stderr

console.log '**** index.html compiled'
