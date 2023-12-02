local M = {}

--- convert a 8 bit unsigned integer number to hex string
-- @tparam number nValue the 8 bit unsigned integer
-- @treturn string the two digit hex number
local function dec2hex(nValue) -- http://www.indigorose.com/forums/threads/10192-Convert-Hexadecimal-to-Decimal
  if type(nValue) == "string" then
    nValue = String.ToNumber(nValue);
  end
  local nHexVal = string.format("%x", nValue);  -- %X returns uppercase hex, %x gives lowercase letters
  local sHexVal = nHexVal.."";
  if nValue < 16 then
    return "0"..tostring(sHexVal)
  else
    return sHexVal
  end
end

--- blend two hex colors
-- @tparam string color1 the first color to blend
-- @tparam string color2 the second color to blend
-- @tparam number 0-1 indicates how much of color 1 to blend into color2
-- @treturn string the blended hex code
function M.blend_colors(color1, color2, blend)
  local r1, g1, b1 = string.match(color1, "#([0-9a-fA-F][0-9a-fA-F])([0-9a-fA-F][0-9a-fA-F])([0-9a-fA-F][0-9a-fA-F])")
  local r2, g2, b2 = string.match(color2, "#([0-9a-fA-F][0-9a-fA-F])([0-9a-fA-F][0-9a-fA-F])([0-9a-fA-F][0-9a-fA-F])")
  local r3 = math.floor(tonumber(r1, 16)*(blend) + tonumber(r2, 16)*(1-blend))
  local g3 = math.floor(tonumber(g1, 16)*(blend) + tonumber(g2, 16)*(1-blend))
  local b3 = math.floor(tonumber(b1, 16)*(blend) + tonumber(b2, 16)*(1-blend))
  return "#"..dec2hex(r3).. dec2hex(g3)..dec2hex(b3)
end

return M
