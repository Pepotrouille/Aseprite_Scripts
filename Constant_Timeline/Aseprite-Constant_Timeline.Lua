
--[[
A script to convert a spritesheet into an animation where rows become layers and columns become frames.
Made by Marie Pepo
   - Itch.io: https://marie-pepo.itch.io/
   - LinkTree: https://linktr.ee/pepotrouille
Version 1.0
--]]


function ConstantTimeline(frameTimeMilisecond, smallerAdapted)

	local frameTime = frameTimeMilisecond / 1000
	local sprite = app.activeSprite
	local index = 1
	local currentDuration = 0
	while index <= #sprite.frames  and index < 1000 do
		currentDuration = sprite.frames[index].duration
		if currentDuration > frameTime then
			sprite.frames[index].duration = currentDuration - frameTime
			local frame = sprite:newFrame(sprite.frames[index])
			frame.duration = frameTime
		elseif smallerAdapted and currentDuration < frameTime then
			sprite.frames[index].duration = frameTime
			index = index + 1
		else
			index = index + 1
		end
	end
end


local dlg = Dialog("Constant Timeline")
dlg:entry{ id="frameTimeSecondValue", label="Time in miliseconds:", text="100" }
dlg:check{ id="smallerAdaptedValue", label="Convert smaller duration", selected=false}
dlg:button{ id="confirm", text="Confirm" }
dlg:button{ id="cancel", text="Cancel" }
dlg:show()
local data = dlg.data
if data.confirm then
	
	ConstantTimeline(data.frameTimeSecondValue, data.smallerAdaptedValue)
		
end