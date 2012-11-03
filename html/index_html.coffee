###  
	index-html.coffee: creates the index.html file
###

console.log '**** index_html compiling'

fs   = require 'fs'
exec = require('child_process').exec
_	 = require '../packages/underscore-string/underscore-string'

{doctype,html,head,meta,title,script,body,div, text} = 
		dk = require('../packages/drykup/drykup') expand: yes
 
doctype 5 
html ->
	head ->
		meta "http-equiv": "Content-Type", content:"text/html; charset=UTF-8"
		title "FTN"

		text '<link href="css/index.css" 				rel="stylesheet">'
		text '<link href="css/url.css" 					rel="stylesheet">'
		text '<link href="jsoneditor/jsoneditor.css" 	rel="stylesheet">'
		
		script src:"modules.js", ''
		script "require('lib/main')"
		
	body ->
	
		div x:"i=indexHdr", ->
			div x:"i=indexLogo", 'FTN'
			div {x:"i=indexCompiled"}, 
				'(Compiled ' + (new Date().toLocaleString()[0..20]) + ')'
		
		div x:"i=tabRow"
		div x:"i=tabBody"
		
		div x:"i=jsoneditor"	

fs.writeFileSync '../index.html', dk.htmlOut
exec 'kanso push ..', (err, stdout, stderr) -> 
	console.log _.trim stdout
	if err or stderr then console.log "ERROR: kanso push exec " + err + '\n' + stderr
	
console.log '**** index_html compiled'
