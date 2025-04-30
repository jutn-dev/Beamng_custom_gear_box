local M = {}

M.gear_input = 0
M.debug = false
M.reverse_gear = 15
function change_gear()
  if M.debug then
	if M.gear_input == reverse_gear then
		print("switching to gear: R"))
	else
		print("switching to gear: "..bit.tobit(M.gear_input))
	end
  end
  if M.gear_input == reverse_gear then
	controller.mainController.shiftToGearIndex(bit.tobit(-1))
  else
	controller.mainController.shiftToGearIndex(bit.tobit(M.gear_input))
  end
end

function print_current_gear()
	print(M.gear_input)
end

function swap_bit(num, index)
  local mask = bit.lshift(1, index)
  return bit.bxor(num, mask)
end

function help()
	print("---- gears help ----")
	print("Debug mode:"..M.debug)
	print("gears.help() prints this message \ngears.change_gear() changes the gear to value stored in M.gear_input \ngears.print_current_gear() prints the value of M.gear_input \n M.debug can be used to set on debug mode \n M.reverse_gear can be used to change which input number is reverse gear")
end

M.help = help
M.change_gear = change_gear
M.swap_bit = swap_bit
M.print_current_gear = print_current_gear

return M
