local function hex2col(rgba)
--	setColorHEX(rgba)
--	where rgba is string as "#336699cc"
	local rb = tonumber(string.sub(rgba, 2, 3), 16)
	local gb = tonumber(string.sub(rgba, 4, 5), 16)
	local bb = tonumber(string.sub(rgba, 6, 7), 16)
	local ab = tonumber(string.sub(rgba, 8, 9), 16) or nil
--	print (rb, gb, bb, ab) -- prints 	51	102	153	204
--	print (love.math.colorFromBytes( rb, gb, bb, ab )) -- prints	0.2	0.4	0.6	0.8
	return love.math.colorFromBytes( rb, gb, bb, ab )
end

return hex2col