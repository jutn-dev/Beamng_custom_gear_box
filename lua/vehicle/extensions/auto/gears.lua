local M = {}

M.gear_input = 0
M.debug = false
function change_gear()
  if M.debug then
	print("gear:"..bit.tobit(M.gear_input))
  end
  if M.gear_input == 15 then
	controller.mainController.shiftToGearIndex(bit.tobit(-1))
  else
	controller.mainController.shiftToGearIndex(bit.tobit(M.gear_input))
  end
end

function swap_bit(num, index)
  local mask = bit.lshift(1, index)
  return bit.bxor(num, mask)
end

M.change_gear = change_gear
M.swap_bit = swap_bit

return M
