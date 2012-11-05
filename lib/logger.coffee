###
	logger.js 
###  

_ = require 'underscore'

enabledDef =
	dbg:  1
	
	info: yes
	err:  yes

module.exports = (page = 'anonymous', enabledIn = {}) ->

	(type, args...) ->
		if type not of enabledDef then args.unshift type; type = 'dbg'
		
		if enabledDef[type] and (enabledIn[type] or not enabledIn[type]?)
			typeStr = (if type is 'dbg' then '' else type.toUpperCase())
			console.log page, typeStr, args...
	