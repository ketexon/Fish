local math = {}

function math.min(a,b)
 return a < b and a or b
end

function math.max(a,b)
    return a > b and a or b
end

function math.clamp(x,a,b)
    return math.min(math.max(x, a),b)
end

return math