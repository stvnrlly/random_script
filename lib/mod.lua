local mod = require 'core/mods'

m = {
  extra_alt = false
}

mod.hook.register("system_post_startup", "random script selector", function()
	local f = _menu.m.SELECT.key
	_menu.m.SELECT.key = function(n,z) 
	  -- add our own alt in case the regular code changes
    if n == 1 then
      m.extra_alt = z == 1 and true or false
    end
    -- hop to a random script
  	if n==3 and z==1 and m.extra_alt then
  		_menu.m.SELECT.pos = math.random(_menu.m.SELECT.len-1)
  		_menu.redraw()
  		return
	  -- otherwise, do the normal stuff
  	else
  	  f(n,z)
    end
	end
end)
