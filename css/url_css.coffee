
fs = require 'fs'
exec = require('child_process').exec
_	 = require '../packages/underscore-string/underscore-string'
 
{style} = dk = require('../packages/drykup/drykup') expand: yes

console.log '**** compiling url_css'
# ----------------------------------------------------------------------

style "
	.unselectable {
		-moz-user-select:-moz-none
		-khtml-user-select:none
		-webkit-user-select:none
		user-select:none }
	
	.round3  	{-moz-border-radius:3  border-radius:3 }
	.round4  	{-moz-border-radius:4  border-radius:4 }
	.round5  	{-moz-border-radius:5  border-radius:5 }
	.round10 	{-moz-border-radius:10 border-radius:10}
	
	.opacity10  {opacity:0.1 filter:alpha(opacity=10)}
	.opacity40  {opacity:0.4 filter:alpha(opacity=40)}
	.opacity50  {opacity:0.5 filter:alpha(opacity=50)}
	.opacity70  {opacity:0.7 filter:alpha(opacity=70)}
	.opacity90  {opacity:0.9 filter:alpha(opacity=90)}
	
	#tabRow 	{c:b f:l w:100% h:25 bc:#faa fs:14}
	.urlTab 	{f:l ml:7 mt:4 p:2 o:h h:20 fw:b bc:#fcc b:1pxsg c:p
	 			 		moz-border-radius:5 border-radius:5}
	.selTab  	{bc:#fcc}
	#tabBody 	{c:b f:l w:100% h:60 bc:#fcc fs:13}

"

# ----------------------------------------------------------------------
fs.writeFileSync 'url.css', 
	dk.htmlOut.replace(/<\/?style>/g, '').replace(/\}/g, '}\n').replace /\t/g, ''

exec 'kanso push ..', (err, stdout, stderr) -> 
	console.log _.trim stdout
	if err or stderr then console.log "ERROR: kanso push exec " + err + '\n' + stderr
	
console.log '**** url_css compiled'
