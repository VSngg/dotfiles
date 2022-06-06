-- load standard vis module, providing parts of the Lua API
require('vis')

vis.events.subscribe(vis.events.INIT, function()
	-- Your global configuration options
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	-- Your per window configuration options e.g.
	-- vis:command('set number')
	vis:command('set number')
	vis:command('set autoindent')
	vis:command('set cursorline')
	vis:command('set expandtab on')
	vis:command('set tabwidth 4')
	vis:command('set theme gruvbox256')
	-- vis:command('set cc 72')
	vis:command('langmap фисвуапршолдьтщзйкыегмцчня abcdefghijklmnopqrstuvwxyz')
end)



