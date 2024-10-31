
--[[
A script to convert a spritesheet into an animation where rows become layers and columns become frames.
Made by Marie Pepo
   - Itch.io: https://marie-pepo.itch.io/
   - LinkTree: https://linktr.ee/pepotrouille
Version 1.0
--]]





function IntoGrid( x, y, visibility )

	-- Variables
	local theRectangle = Rectangle(0, 0, x, y)
	local sprite = app.activeSprite
	local nbLayers = sprite.height / y
	local nbFrames = sprite.width / x



	app.command.ImportSpriteSheet {
		ui=false,
		type=SpriteSheetType.ROWS,
		frameBounds=theRectangle,
		padding=Size(0, 0),
		partialTiles=false
		}

			
			
	for i=1,nbLayers do
	
		local layer = sprite:newLayer()
		layer.name = "layer" .. i
		layer.isVisible = visibility;
		for j=1, nbFrames do
		
			local oldCel = sprite.cels[ ((nbLayers - i)*nbFrames + j )]
			sprite:newCel(layer, sprite.frames[j], oldCel.image, Point())
			
		end
	end
	sprite:deleteLayer(sprite.layers[1])
	for i=1,#sprite.frames-(nbFrames) do
		sprite:deleteFrame(sprite.frames[nbFrames +1])
	end

end


function IntoGridFromBottom( x, y, visibility )

	-- Variables
	local theRectangle = Rectangle(0, 0, x, y)
	local sprite = app.activeSprite
	local nbLayers = sprite.height / y
	local nbFrames = sprite.width / x



	app.command.ImportSpriteSheet {
		ui=false,
		type=SpriteSheetType.ROWS,
		frameBounds=theRectangle,
		padding=Size(0, 0),
		partialTiles=false
		}

			
			
	for i=1,nbLayers do
	
		local layer = sprite:newLayer()
		layer.name = "layer" .. i
		layer.isVisible = visibility;
		for j=1, nbFrames do
		
			local oldCel = sprite.cels[((i-1)*nbFrames + j )]
			sprite:newCel(layer, sprite.frames[j], oldCel.image, Point())
			
		end
	end
	sprite:deleteLayer(sprite.layers[1])
	for i=1,#sprite.frames-(nbFrames) do
		sprite:deleteFrame(sprite.frames[nbFrames +1])
	end

end


--The wizard to make the choices of the parameters

local dlg = Dialog("Spritesheet into Layers")
dlg:entry{ id="xValue", label="Width:", text="16" }
dlg:entry{ id="yValue", label="Height:", text="16" }
dlg:check{ id="visibilityValue", label="All Layers are Visible:", selected=false}
dlg:check{ id="notTopLayer", label="Top Layer on the bottom", selected=false}
dlg:button{ id="confirm", text="Confirm" }
dlg:button{ id="cancel", text="Cancel" }
dlg:show()
local data = dlg.data
if data.confirm then
	if data.notTopLayer then
		IntoGridFromBottom( data.xValue, data.yValue, data.visibilityValue)
	else
		IntoGrid( data.xValue, data.yValue, data.visibilityValue)
	end
end


