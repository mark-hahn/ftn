###  
	index-html.coffee: creates the lib/index.html file 
	invoked by feeton/bin/pre-push
	coffee /feeton/index-html.coffee
	v0.0.1
###
console.log '**** index.html compiling'

fs = require 'fs'

{doctype,html,head,meta,title,body,div,script,h4,img,table,tr,td,text} = \
	dk = require('drykup') expand: yes
 
doctype 5 
html ->  
	head ->
		meta "http-equiv": "Content-Type", content:"text/html; charset=UTF-8"
		title "Feeton"
		script src:"modules.js", ''
		script "require('lib/main')"
	body x:"font-family:tahoma,sans-serif", ->
		div x:"c:b f:l w:100% h:23 bc:#ffa p:r l:-10 t:-8", ->
			div x:"c:b f:l p:r l:10 t:-2 p:4 w:90 h:20 fs:15 fw:b", 'Feeton'
			div {x:"f:l ml:20 h:20 p:4 fs:12"}, 
				'(Compiled ' + (new Date().toLocaleString()[0..20]) + ')'
	
fs.writeFileSync 'lib/index.html', dk.htmlOut

console.log '**** index.html compiled'
