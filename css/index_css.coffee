
fs = require 'fs'
exec = require('child_process').exec
_	 = require '../packages/underscore-string/underscore-string'
 
{style} = dk = require('../packages/drykup/drykup') expand: yes

console.log '**** compiling index_css'
# ----------------------------------------------------------------------

style "
	body 			{m:0 p:0 b:none ff:helvetica,arial,sans-serif fs:13}
	
	#indexHdr  		{c:b f:l w:100% h:23 bc:#ffa}
	#indexLogo 		{c:b f:l p:r l:10 t:-2 p:4 w:90 h:20 fs:15 fw:b}
	#indexCompiled 	{f:l ml:20 h:20 p:4 fs:12}
	
	#jsoneditor 	{c:b f:l w:100% h:400}
"

# ----------------------------------------------------------------------
fs.writeFileSync 'index.css', 
	dk.htmlOut.replace(/<\/?style>/g, '').replace(/\}/g, '}\n').replace /\t/g, ''

exec 'kanso push ..', (err, stdout, stderr) -> 
	#console.log _.trim stdout
	if err or stderr then #console.log "ERROR: kanso push exec " + err + '\n' + stderr
	
#console.log '**** index_css compiled'
