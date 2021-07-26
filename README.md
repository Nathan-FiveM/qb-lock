# qb-lockpick
 NoPixel Based Lockpick for QBFramework

# Template
exports['qb-lockpick']:StartLockPickCircle(amount, time, function(success)

# Example useage

	exports['qb-lockpick']:StartLockPickCircle(1, 1, function(success)
		if success then
			print("WIN")
		else
			print("FAIL")
		end
	end)
	
# Amount of time to spin and amount of time to trigger are currently held within the js I am trying to export it to lua
# Amount and Time now work, but functioning success now doesn't go over to the export.