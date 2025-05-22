local M = {}

M.gear_input = 0
M.debug = true
M.reverse_gear = 15
-- if timer is minus it is disabled
M.gear_timer = 0
-- the time it takes to change a gear after the action
M.gear_swaptime = 0.3
M.joystick_mode = true
function onUpdate()
  if M.gear_timer > 0 then
  	if os.clock() > M.gear_timer then
	  apply_gear()
	  M.gear_timer = -1
  	end
  end
end

--value is used for joystck mode
-- in joystck mode 0 and 2 are the same
-- in joystck mode 1 and 3 are the same
function change_gear_bit(gear, value)
  print("G "..gear)
  print("V "..value)

  if joystick_mode then
  	if gear == 0 || gear == 2 then
	  if value > 0 then
		M.gear_input = swap_bit(M.gear_input, 0)
	  else

	  end
	end
	if gear == 1 || gear == 3 then
  	
	end	
  end
  M.gear_input = swap_bit(M.gear_input, gear)
  M.gear_timer = tonumber(os.clock() + M.gear_swaptime)
end

function apply_gear()
  if M.debug then
	if M.gear_input == M.reverse_gear then
		print("switching to gear: R")
	else
		print("switching to gear: "..bit.tobit(M.gear_input))
	end
  end
  if M.gear_input == M.reverse_gear then
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

functon reset()
	M.gear_input = 0
	M.debug = true
	M.reverse_gear = 15
	M.gear_timer = 0
	M.gear_swaptime = 0.3
end

M.help = help
M.apply_gear = apply_gear
M.change_gear_bit = change_gear_bit
M.swap_bit = swap_bit
M.print_current_gear = print_current_gear
M.updateGFX = onUpdate

return M
