local M = {}

M.gear_input = 0
M.debug = true
M.reverse_gear = 15
-- if timer is minus it is disabled
M.gear_timer = 0
-- the time it takes to change a gear after the action
M.gear_swaptime = 0.3
-- so it works with one joysitck 
-- WARINING THIS MODE IS TERRABLE and jank
-- IF USING this please map input 0 (1st) and input 2 (3rd) to same axies, but other ends
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
  --print("G "..gear)
  --print("V "..value)
  M.gear_timer = tonumber(os.clock() + M.gear_swaptime)
--please do not use this mode if not needed
  if M.joystick_mode == true then
  	if gear == 0 or gear == 2 then
	  print("02")
	  elseif value > 0.5 then
		print("0")
		M.gear_input = swap_bit(M.gear_input, 0)
	  elseif value < -0.5 then
		print("2")
		M.gear_input = swap_bit(M.gear_input, 2)
	  else 

	end
	if gear == 1 or gear == 3 then
	  print("13")
  	  if value > 0.5 then
		print("1")
		M.gear_input = swap_bit(M.gear_input, 1)
	  end
	  if value < -0.5 then
		print("3")
		M.gear_input = swap_bit(M.gear_input, 3)
	  end
	end	
--not joystick mode
  else
	print("jmsefjolesijfoseijfosejfsoijfoisfuiksjfoijse")
	M.gear_input = swap_bit(M.gear_input, gear)
  end
end

function apply_gear()
  print("switching to gear: "..bit.tobit(M.gear_input))
  if M.joystick_mode == true then
	if M.gear_input == 5 then
	  controller.mainController.shiftToGearIndex(bit.tobit(1))
    end
	if M.gear_input == 15 then
	  controller.mainController.shiftToGearIndex(bit.tobit(2))
    end
	if M.gear_input == 3 then
	  controller.mainController.shiftToGearIndex(bit.tobit(3))
    end
	if M.gear_input == M.reverse_gear then
	  controller.mainController.shiftToGearIndex(bit.tobit(-1))
    end
	if M.gear_input == M.reverse_gear then
	  controller.mainController.shiftToGearIndex(bit.tobit(-1))
    end
	if M.gear_input == M.reverse_gear then
	  controller.mainController.shiftToGearIndex(bit.tobit(-1))
    end
	if M.gear_input == M.reverse_gear then
	  controller.mainController.shiftToGearIndex(bit.tobit(-1))
    end
	if M.gear_input == M.reverse_gear then
	  controller.mainController.shiftToGearIndex(bit.tobit(-1))
    end

  else
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
end

function print_current_gear()
	print(M.gear_input)
end

function swap_bit(num, index)
  local mask = bit.lshift(1, index)
  return bit.bxor(num, mask)
end

function set_bit_zero()
	bit.band(M.gear_input, bit.bnot(bit.lshift(1, bit_pos)))
end

function help()
	print("---- gears help ----")
	print("Debug mode:"..M.debug)
	print("gears.help() prints this message \ngears.change_gear() changes the gear to value stored in M.gear_input \ngears.print_current_gear() prints the value of M.gear_input \n M.debug can be used to set on debug mode \n M.reverse_gear can be used to change which input number is reverse gear")
end

function reset()
	M.gear_input = 0
	M.debug = true
	M.reverse_gear = 15
	M.gear_timer = 0
	M.gear_swaptime = 0.3
end

M.reset = reset
M.help = help
M.apply_gear = apply_gear
M.change_gear_bit = change_gear_bit
M.swap_bit = swap_bit
M.print_current_gear = print_current_gear
M.updateGFX = onUpdate

return M
