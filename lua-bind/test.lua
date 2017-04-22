lskiplist = require "lskiplist"

local sl = lskiplist.new(function(a, b, scoreA, scoreB, pdiff)
	if scoreA ~= scoreB then
		return scoreA - scoreB
	end
	if a ~= b then
		return a - b
	end
	return pdiff
end)

for i = 1, 10 do
	local score = math.random(1, 1000)
	sl:insert(i, score)
end

local t = sl:rank_range()
for rank, v in pairs(t) do
	local score = sl:get_score(v)
	print("sorted", rank, v, sl:get_score(v))
end

sl:del_by_rank(5)

local s, e = 2, 8
local t = sl:rank_range(s, e)
for rank = s, e do
	local v = t[rank]
	local score = sl:get_score(v)
	print("after delete", rank, v, sl:get_score(v))
end

print(sl:rank_of(7))