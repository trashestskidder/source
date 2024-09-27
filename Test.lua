local luxurylibrary = {}

if game:GetService("CoreGui"):FindFirstChild("luxury.ui") then
	game:GetService("CoreGui"):FindFirstChild("luxury.ui"):Destroy()
end

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local tween = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local Tweeninfo = TweenInfo.new

local tween = function(object,waits,Style,...)
	game:GetService("TweenService"):Create(object,TweenInfo.new(waits,Style),...):Play()
end

local function formatCommas(n)
	local str = string.format("%.f", n)
	return #str % 3 == 0 and str:reverse():gsub("(%d%d%d)", "%1,"):reverse():sub(2) or str:reverse():gsub("(%d%d%d)", "%1,"):reverse()
end

local function MakeDraggable(topbarobject, object)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil

	local function Update(input)
		local Delta = input.Position - DragStart
		local pos =
			UDim2.new(
				StartPosition.X.Scale,
				StartPosition.X.Offset + Delta.X,
				StartPosition.Y.Scale,
				StartPosition.Y.Offset + Delta.Y
			)
		local Tween = game:GetService("TweenService"):Create(object, TweenInfo.new(0.2), {Position = pos})
		Tween:Play()
	end

	topbarobject.InputBegan:Connect(
		function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true
				DragStart = input.Position
				StartPosition = object.Position

				input.Changed:Connect(
					function()
						if input.UserInputState == Enum.UserInputState.End then
							Dragging = false
						end
					end
				)
			end
		end
	)

	topbarobject.InputChanged:Connect(
		function(input)
			if
				input.UserInputType == Enum.UserInputType.MouseMovement or
				input.UserInputType == Enum.UserInputType.Touch
			then
				DragInput = input
			end
		end
	)

	game:GetService("UserInputService").InputChanged:Connect(
		function(input)
			if input == DragInput and Dragging then
				Update(input)
			end
		end
	)
end

local ActualTypes = {
	Shadow = "ImageLabel",
	Circle = "ImageLabel",
	Circle2 = "ImageLabel",
}

local Properties = {
	Shadow = {
		Name = "Shadow",
		BackgroundTransparency = 1,
		Image = "http://www.roblox.com/asset/?id=5554236805",
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(23,23,277,277),
		Size = UDim2.fromScale(1,1) + UDim2.fromOffset(30,30),
		Position = UDim2.fromOffset(-15,-15)
	},
	Circle = {
		BackgroundTransparency = 1,
		Image = "http://www.roblox.com/asset/?id=5554831670"
	},
	Circle2 = {
		BackgroundTransparency = 1,
		Image = "http://www.roblox.com/asset/?id=14970076293"
	},
}

local Types = {
	"Shadow",
	"Circle",
	"Circle2",
}

local FindType = function(String)
	for _, Type in next, Types do
		if Type:sub(1, #String):lower() == String:lower() then
			return Type
		end
	end
	return false
end

local Objects = {}

function Objects.new(Type)
	local TargetType = FindType(Type)
	if TargetType then
		local NewImage = Instance.new(ActualTypes[TargetType])
		if Properties[TargetType] then
			for Property, Value in next, Properties[TargetType] do
				NewImage[Property] = Value
			end
		end
		return NewImage
	else
		return Instance.new(Type)
	end
end

local GetXY = function(GuiObject)
	local Max, May = GuiObject.AbsoluteSize.X, GuiObject.AbsoluteSize.Y
	local Px, Py = math.clamp(Mouse.X - GuiObject.AbsolutePosition.X, 0, Max), math.clamp(Mouse.Y - GuiObject.AbsolutePosition.Y, 0, May)
	return Px/Max, Py/May
end

local CircleAnim = function(Type,GuiObject, EndColour, StartColour)
	local PX, PY = GetXY(GuiObject)
	local Circle = Objects.new(Type)
	Circle.Size = UDim2.fromScale(0,0)
	Circle.Position = UDim2.fromScale(PX,PY)
	Circle.ImageColor3 = StartColour or GuiObject.ImageColor3
	Circle.ZIndex = 200
	Circle.Parent = GuiObject
	local Size = GuiObject.AbsoluteSize.X
	TweenService:Create(Circle, TweenInfo.new(0.5), {Position = UDim2.fromScale(PX,PY) - UDim2.fromOffset(Size/2,Size/2), ImageTransparency = 1, ImageColor3 = EndColour, Size = UDim2.fromOffset(Size,Size)}):Play()
	spawn(function()
		wait(0.5)
		Circle:Destroy()
	end)
end

luxurylibrary.create = function(args: boolean) :boolean
	if args then
		local luxuryui = Instance.new("ScreenGui")
		
		luxuryui.Name = "luxury.ui"
		luxuryui.Parent = game:GetService("CoreGui")
		luxuryui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

		luxurylibrary.createmain = function()
			local mainframe = Instance.new("Frame")
			local mainframeuicorner = Instance.new("UICorner")
			local topbar = Instance.new("Frame")
			local logo = Instance.new("ImageLabel")
			local scrollingitem = Instance.new("Frame")
			local scrollingframe_item = Instance.new("ScrollingFrame")
			local scrollingframe_itemuilist = Instance.new("UIListLayout")
			local scrollingframe_itemuipadding = Instance.new("UIPadding")
			local button_item = Instance.new("TextButton")
			local button_itemuicorner = Instance.new("UICorner")
			local button_itemimage = Instance.new("ImageLabel")
			local button_itemimagegradient = Instance.new("UIGradient")
			local container = Instance.new("Frame")
			local page = Instance.new("Frame")
			local pageuicorner = Instance.new("UICorner")
			local Frame = Instance.new("Frame")
			local TextLabel = Instance.new("TextLabel")
			local button_itemimage_2 = Instance.new("ImageLabel")
			local button_itemimagegradient_2 = Instance.new("UIGradient")
			local Frame_2 = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local ScrollingFrame = Instance.new("ScrollingFrame")
			local UIListLayout = Instance.new("UIListLayout")
			local UIPadding = Instance.new("UIPadding")
			local Frame_4 = Instance.new("Frame")
			local UIListLayout_2 = Instance.new("UIListLayout")
			local UIPadding_2 = Instance.new("UIPadding")
			local button_item_2 = Instance.new("TextButton")
			local button_itemuicorner_2 = Instance.new("UICorner")
			local button_itemimage_3 = Instance.new("ImageLabel")
			local button_item_3 = Instance.new("TextButton")
			local button_itemuicorner_3 = Instance.new("UICorner")
			local button_itemimage_4 = Instance.new("ImageLabel")
			local button_item_4 = Instance.new("TextButton")
			local button_itemuicorner_4 = Instance.new("UICorner")
			local button_itemimage_5 = Instance.new("ImageLabel")
			local button_item_5 = Instance.new("TextButton")
			local button_itemuicorner_5 = Instance.new("UICorner")
			local button_itemimage_6 = Instance.new("ImageLabel")
			local button_item_6 = Instance.new("TextButton")
			local button_itemuicorner_6 = Instance.new("UICorner")
			local button_itemimage_7 = Instance.new("ImageLabel")
			local pageuilist = Instance.new("UIListLayout")
			local pageuipadding = Instance.new("UIPadding")
			
			mainframe.Name = "mainframe"
			mainframe.Parent = luxuryui
			mainframe.Active = true
			mainframe.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
			mainframe.BorderColor3 = Color3.fromRGB(0, 0, 0)
			mainframe.BorderSizePixel = 0
			mainframe.Position = UDim2.new(0.5, 0, 0.5, 0)
			mainframe.Size = UDim2.new(0, 0, 0, 0)
			mainframe.ClipsDescendants = true
			mainframe.AnchorPoint = Vector2.new(0.5,0.5)
			
			tween(mainframe,0.5,Enum.EasingStyle.Back,{Size = UDim2.new(0, getgenv().SizweX, 0, getgenv().SizweY)})

			mainframeuicorner.CornerRadius = UDim.new(0, 15)
			mainframeuicorner.Name = "mainframe.uicorner"
			mainframeuicorner.Parent = mainframe

			topbar.Name = "topbar"
			topbar.Parent = mainframe
			topbar.Active = true
			topbar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			topbar.BackgroundTransparency = 1.000
			topbar.BorderColor3 = Color3.fromRGB(0, 0, 0)
			topbar.BorderSizePixel = 0
			topbar.Size = UDim2.new(0, 700, 0, 53)
			
			MakeDraggable(topbar,mainframe)

			logo.Name = "logo"
			logo.Parent = topbar
			logo.Active = true
			logo.AnchorPoint = Vector2.new(0.5, 0.5)
			logo.BackgroundTransparency = 1.000
			logo.BorderSizePixel = 0
			logo.Position = UDim2.new(0.0521428585, 0, 0.5, 0)
			logo.Size = UDim2.new(0, 45, 0, 45)
			logo.Image = "http://www.roblox.com/asset/?id=12095230917"
			logo.ScaleType = Enum.ScaleType.Fit

			scrollingitem.Name = "scrollingitem"
			scrollingitem.Parent = mainframe
			scrollingitem.Active = true
			scrollingitem.AnchorPoint = Vector2.new(0.5, 0.5)
			scrollingitem.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			scrollingitem.BackgroundTransparency = 1.000
			scrollingitem.BorderColor3 = Color3.fromRGB(0, 0, 0)
			scrollingitem.BorderSizePixel = 0
			scrollingitem.Position = UDim2.new(0.0529999994, 0, 0.529999971, 0)
			scrollingitem.Size = UDim2.new(0, 56, 0, 561)

			scrollingframe_item.Name = "scrollingframe_item"
			scrollingframe_item.Parent = scrollingitem
			scrollingframe_item.Active = true
			scrollingframe_item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			scrollingframe_item.BackgroundTransparency = 1.000
			scrollingframe_item.BorderColor3 = Color3.fromRGB(0, 0, 0)
			scrollingframe_item.BorderSizePixel = 0
			scrollingframe_item.Size = UDim2.new(0, 56, 0, 561)
			scrollingframe_item.ScrollBarThickness = 0

			scrollingframe_itemuilist.Name = "scrollingframe_item.uilist"
			scrollingframe_itemuilist.Parent = scrollingframe_item
			scrollingframe_itemuilist.SortOrder = Enum.SortOrder.LayoutOrder
			scrollingframe_itemuilist.Padding = UDim.new(0, 10)

			scrollingframe_itemuipadding.Name = "scrollingframe_item.uipadding"
			scrollingframe_itemuipadding.Parent = scrollingframe_item
			scrollingframe_itemuipadding.PaddingLeft = UDim.new(0, 5)
			scrollingframe_itemuipadding.PaddingTop = UDim.new(0, 5)

			button_item.Name = "button_item"
			button_item.Parent = scrollingframe_item
			button_item.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
			button_item.BorderColor3 = Color3.fromRGB(0, 0, 0)
			button_item.BorderSizePixel = 0
			button_item.Size = UDim2.new(0, 46, 0, 46)
			button_item.AutoButtonColor = false
			button_item.Font = Enum.Font.SourceSans
			button_item.Text = ""
			button_item.TextColor3 = Color3.fromRGB(0, 0, 0)
			button_item.TextSize = 14.000
			button_item.TextTransparency = 1.000

			button_itemuicorner.Name = "button_item.uicorner"
			button_itemuicorner.Parent = button_item

			button_itemimage.Name = "button_item.image"
			button_itemimage.Parent = button_item
			button_itemimage.Active = true
			button_itemimage.AnchorPoint = Vector2.new(0.5, 0.5)
			button_itemimage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			button_itemimage.BackgroundTransparency = 1.000
			button_itemimage.BorderColor3 = Color3.fromRGB(0, 0, 0)
			button_itemimage.BorderSizePixel = 0
			button_itemimage.Position = UDim2.new(0.5, 0, 0.5, 0)
			button_itemimage.Size = UDim2.new(0, 26, 0, 26)
			button_itemimage.Image = "http://www.roblox.com/asset/?id=6035107928"

			button_itemimagegradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 196, 57)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 127))}
			button_itemimagegradient.Name = "button_item.image.gradient"
			button_itemimagegradient.Parent = button_itemimage
			
			local button_item2 = Instance.new("TextButton")
			local button_itemuicorner2 = Instance.new("UICorner")
			local button_itemimage2 = Instance.new("ImageLabel")
			local button_itemimagegradient2 = Instance.new("UIGradient")

			button_item2.Name = "button_item2"
			button_item2.Parent = scrollingframe_item
			button_item2.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
			button_item2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			button_item2.BorderSizePixel = 0
			button_item2.Size = UDim2.new(0, 46, 0, 46)
			button_item2.AutoButtonColor = false
			button_item2.Font = Enum.Font.SourceSans
			button_item2.Text = ""
			button_item2.TextColor3 = Color3.fromRGB(0, 0, 0)
			button_item2.TextSize = 14.000
			button_item2.TextTransparency = 1.000

			button_itemuicorner2.Name = "button_item.uicorner"
			button_itemuicorner2.Parent = button_item2

			button_itemimage2.Name = "button_item.image"
			button_itemimage2.Parent = button_item2
			button_itemimage2.Active = true
			button_itemimage2.AnchorPoint = Vector2.new(0.5, 0.5)
			button_itemimage2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			button_itemimage2.BackgroundTransparency = 1.000
			button_itemimage2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			button_itemimage2.BorderSizePixel = 0
			button_itemimage2.Position = UDim2.new(0.5, 0, 0.5, 0)
			button_itemimage2.Size = UDim2.new(0, 26, 0, 26)
			button_itemimage2.Image = "http://www.roblox.com/asset/?id=6035078892"

			button_itemimagegradient2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 196, 57)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 127))}
			button_itemimagegradient2.Name = "button_item.image.gradient"
			button_itemimagegradient2.Parent = button_itemimage2

			container.Name = "container"
			container.Parent = mainframe
			container.Active = true
			container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			container.BackgroundTransparency = 1.000
			container.BorderColor3 = Color3.fromRGB(0, 0, 0)
			container.BorderSizePixel = 0
			container.ClipsDescendants = true
			container.Position = UDim2.new(0.0971428603, 0, 0.0861538425, 0)
			container.Size = UDim2.new(0, 624, 0, 587)
			
			local UIPageLayout = Instance.new("UIPageLayout")

			UIPageLayout.Parent = container
			UIPageLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIPageLayout.Circular = true
			UIPageLayout.EasingStyle = Enum.EasingStyle.Circular
			UIPageLayout.ScrollWheelInputEnabled = false
			UIPageLayout.TweenTime = 0.500

			page.Name = "page"
			page.Parent = container
			page.Active = true
			page.AnchorPoint = Vector2.new(0.5, 0.5)
			page.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			page.BorderColor3 = Color3.fromRGB(0, 0, 0)
			page.BorderSizePixel = 0
			page.Position = UDim2.new(0.5, 0, 0.5, 0)
			page.Size = UDim2.new(0, 622, 0, 586)
			page.LayoutOrder = 0
			
			local page2 = Instance.new("Frame")
			
			page2.Name = "page"
			page2.Parent = container
			page2.Active = true
			page2.AnchorPoint = Vector2.new(0.5, 0.5)
			page2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			page2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			page2.BorderSizePixel = 0
			page2.Position = UDim2.new(0.5, 0, 0.5, 0)
			page2.Size = UDim2.new(0, 622, 0, 586)
			page2.LayoutOrder = 1
			
			local pageuicorner2 = Instance.new("UICorner")
			
			pageuicorner2.Name = "page.uicorner"
			pageuicorner2.Parent = page2
			
			button_item.MouseButton1Down:Connect(function()
				UIPageLayout:JumpToIndex(0)
			end)
			
			button_item2.MouseButton1Down:Connect(function()
				UIPageLayout:JumpToIndex(1)
			end)
			
			local Frametee = Instance.new("Frame")
			local TextLabelss = Instance.new("TextLabel")
			local button_itemimage_22 = Instance.new("ImageLabel")
			
			Frametee.Parent = page2
			Frametee.Active = true
			Frametee.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Frametee.BackgroundTransparency = 1
			Frametee.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Frametee.BorderSizePixel = 0
			Frametee.Size = UDim2.new(0, 601, 0, 229)

			TextLabelss.Parent = Frametee
			TextLabelss.Active = true
			TextLabelss.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabelss.BackgroundTransparency = 1
			TextLabelss.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabelss.BorderSizePixel = 0
			TextLabelss.Position = UDim2.new(0.00831946731, 0, 0, 0)
			TextLabelss.Size = UDim2.new(0, 596, 0, 26)
			TextLabelss.FontFace = Font.fromId(12187365977,Enum.FontWeight.Bold)
			TextLabelss.Text = "STATUS CHECK"
			TextLabelss.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabelss.TextSize = 20.000
			TextLabelss.TextWrapped = true
			TextLabelss.TextXAlignment = Enum.TextXAlignment.Left

			button_itemimage_22.Name = "button_item.image"
			button_itemimage_22.Parent = TextLabelss
			button_itemimage_22.Active = true
			button_itemimage_22.AnchorPoint = Vector2.new(0.5, 0.5)
			button_itemimage_22.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			button_itemimage_22.BackgroundTransparency = 1.000
			button_itemimage_22.BorderColor3 = Color3.fromRGB(0, 0, 0)
			button_itemimage_22.BorderSizePixel = 0
			button_itemimage_22.Position = UDim2.new(0.24, 0, 0.5, 0)
			button_itemimage_22.Size = UDim2.new(0, 20, 0, 20)
			button_itemimage_22.Image = "http://www.roblox.com/asset/?id=6035078892"

			local pageuilist2 = Instance.new("UIListLayout")
			local pageuipadding2 = Instance.new("UIPadding")

			pageuilist2.Name = "page.uilist"
			pageuilist2.Parent = page2
			pageuilist2.SortOrder = Enum.SortOrder.LayoutOrder
			pageuilist2.Padding = UDim.new(0, 5)

			pageuipadding2.Name = "page.uipadding"
			pageuipadding2.Parent = page2
			pageuipadding2.PaddingLeft = UDim.new(0, 10)
			pageuipadding2.PaddingTop = UDim.new(0, 10)

			local button_itemimagegradient_22 = Instance.new("UIGradient")

			button_itemimagegradient_22.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 196, 57)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 127))}
			button_itemimagegradient_22.Name = "button_item.image.gradient"
			button_itemimagegradient_22.Parent = button_itemimage_22

			local Frame_2sss = Instance.new("ScrollingFrame")
			local UIListLayoutsss = Instance.new("UIListLayout")

			Frame_2sss.Parent = Frametee
			Frame_2sss.Active = true
			Frame_2sss.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Frame_2sss.BackgroundTransparency = 1
			Frame_2sss.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Frame_2sss.BorderSizePixel = 0
			Frame_2sss.Position = UDim2.new(0.008, 0, 0.135371178, 0)
			Frame_2sss.Size = UDim2.new(0, 308, 0, 532)
			Frame_2sss.ScrollBarThickness = 0
			Frame_2sss.Name = "Frame_2sss"

			UIListLayoutsss.Parent = Frame_2sss
			UIListLayoutsss.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayoutsss.Padding = UDim.new(0, 5)
			
			local Frame_3sss = Instance.new("ScrollingFrame")
			local UIListLayout3sss = Instance.new("UIListLayout")

			Frame_3sss.Parent = Frametee
			Frame_3sss.Active = true
			Frame_3sss.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Frame_3sss.BackgroundTransparency = 1
			Frame_3sss.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Frame_3sss.BorderSizePixel = 0
			Frame_3sss.Position = UDim2.new(0.550, 0, 0.135371178, 0)
			Frame_3sss.Size = UDim2.new(0, 313, 0, 532)
			Frame_3sss.Name = "Frame_3sss"
			Frame_3sss.ScrollBarThickness = 0
			
			UIListLayout3sss.Parent = Frame_3sss
			UIListLayout3sss.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout3sss.Padding = UDim.new(0, 5)
			
			local side = function(args)
				if args == 1 then
					return Frame_2sss
				elseif args == 2 then
					return Frame_3sss
				else
					return Frame_2sss
				end
			end
			
			local luxuryadded = {}
			function luxuryadded:AddLabel(args)
				local sides = args.Side or 1
				local check = args.Check or false
				local mode = args.Mode or false
				local Title = args.Title or "Tools"
				local func = {}

				local Frametext = Instance.new("Frame")
				local TextLabel = Instance.new("TextLabel")
				local Frame_2 = Instance.new("Frame")
				local UICorner = Instance.new("UICorner")
				local Frame_3 = Instance.new("Frame")
				local UICorner_2 = Instance.new("UICorner")
				local ImageLabel = Instance.new("ImageLabel")
				spawn(function()
					Frametext.Parent = side(sides)
					Frametext.Active = true
					Frametext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Frametext.BackgroundTransparency = 1.000
					Frametext.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Frametext.BorderSizePixel = 0
					Frametext.Size = UDim2.new(0, 250, 0, 37)
					
					TextLabel.Parent = Frametext
					TextLabel.Active = true
					TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel.BackgroundTransparency = 1.000
					TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
					TextLabel.BorderSizePixel = 0
					TextLabel.Size = UDim2.new(0, 297, 0, 37)
					TextLabel.FontFace = Font.fromId(12187365977,Enum.FontWeight.Bold)
					TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel.TextSize = 14.000
					TextLabel.TextWrapped = true
					TextLabel.Text = Title
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left
					TextLabel.RichText = true

					if not mode then
						TextLabel.TextTransparency = 0.955
						
						Frame_2.Parent = Frametext
						Frame_2.Active = true
						Frame_2.AnchorPoint = Vector2.new(0.5, 0.5)
						Frame_2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
						Frame_2.BackgroundTransparency = 0.400
						Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
						Frame_2.BorderSizePixel = 0
						Frame_2.Position = UDim2.new(0.949999988, 0, 0.5, 0)
						Frame_2.Size = UDim2.new(0, 24, 0, 24)

						UICorner.CornerRadius = UDim.new(0, 4)
						UICorner.Parent = Frame_2
						
						Frame_3.Parent = Frame_2
						Frame_3.Active = true
						Frame_3.AnchorPoint = Vector2.new(0.5, 0.5)
						Frame_3.BackgroundColor3 = Color3.fromRGB(85, 255, 127)
						Frame_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
						Frame_3.BorderSizePixel = 0
						Frame_3.Position = UDim2.new(0.5, 0, 0.5, 0)
						Frame_3.Size = UDim2.new(0, 0, 0, 0)

						UICorner_2.CornerRadius = UDim.new(0, 4)
						UICorner_2.Parent = Frame_3

						ImageLabel.Parent = Frame_3
						ImageLabel.Active = true
						ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
						ImageLabel.BackgroundTransparency = 1.000
						ImageLabel.BorderSizePixel = 0
						ImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
						ImageLabel.Size = UDim2.new(0, 20, 0, 20)
						ImageLabel.Image = "rbxassetid://14728994522"
						ImageLabel.ImageColor3 = Color3.fromRGB(20,20,20)
						ImageLabel.ImageTransparency = 1
						
						if check then
							ImageLabel.Image = "rbxassetid://14728994522"
							tween(Frame_3,0.1,Enum.EasingStyle.Quart,{Size = UDim2.new(0, 24, 0, 24),BackgroundColor3 = Color3.fromRGB(85, 255, 127)})
							tween(ImageLabel,0.1,Enum.EasingStyle.Quart,{ImageTransparency = 0,ImageColor3 = Color3.fromRGB(0, 0, 0)})
							tween(TextLabel,0.1,Enum.EasingStyle.Quart,{TextTransparency = 0})
						else
							ImageLabel.Image = "rbxassetid://14728964779"
							tween(Frame_3,0.1,Enum.EasingStyle.Quart,{Size = UDim2.new(0, 24, 0, 24),BackgroundColor3 = Color3.fromRGB(255, 46, 46)})
							tween(ImageLabel,0.1,Enum.EasingStyle.Quart,{ImageTransparency = 0,ImageColor3 = Color3.fromRGB(255,255,255),Size = UDim2.new(0, 16, 0, 16)})
							tween(TextLabel,0.1,Enum.EasingStyle.Quart,{TextTransparency = 0.955})
						end
					else
						
						TextLabel.TextTransparency = 0
					end
				end)
				func.change = function(args)
					if args then
						ImageLabel.Image = "rbxassetid://14728994522"
						tween(Frame_3,0.1,Enum.EasingStyle.Quart,{Size = UDim2.new(0, 24, 0, 24),BackgroundColor3 = Color3.fromRGB(85, 255, 127)})
						tween(ImageLabel,0.1,Enum.EasingStyle.Quart,{ImageTransparency = 0,ImageColor3 = Color3.fromRGB(0, 0, 0)})
						tween(TextLabel,0.1,Enum.EasingStyle.Quart,{TextTransparency = 0})
					else
						ImageLabel.Image = "rbxassetid://14728964779"
						tween(Frame_3,0.1,Enum.EasingStyle.Quart,{Size = UDim2.new(0, 24, 0, 24),BackgroundColor3 = Color3.fromRGB(255, 46, 46)})
						tween(ImageLabel,0.1,Enum.EasingStyle.Quart,{ImageTransparency = 0,ImageColor3 = Color3.fromRGB(255,255,255),Size = UDim2.new(0, 16, 0, 16)})
						tween(TextLabel,0.1,Enum.EasingStyle.Quart,{TextTransparency = 0.955})
					end
				end
				return func
			end

			pageuicorner.Name = "page.uicorner"
			pageuicorner.Parent = page

			Frame.Parent = page
			Frame.Active = true
			Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Frame.BackgroundTransparency = 1.000
			Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Frame.BorderSizePixel = 0
			Frame.Size = UDim2.new(0, 601, 0, 229)

			TextLabel.Parent = Frame
			TextLabel.Active = true
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel.BorderSizePixel = 0
			TextLabel.Position = UDim2.new(0.00831946731, 0, 0, 0)
			TextLabel.Size = UDim2.new(0, 596, 0, 26)
			TextLabel.FontFace = Font.fromId(12187365977,Enum.FontWeight.Bold)
			TextLabel.Text = "INVENTORY"
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextSize = 20.000
			TextLabel.TextWrapped = true
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left

			button_itemimage_2.Name = "button_item.image"
			button_itemimage_2.Parent = TextLabel
			button_itemimage_2.Active = true
			button_itemimage_2.AnchorPoint = Vector2.new(0.5, 0.5)
			button_itemimage_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			button_itemimage_2.BackgroundTransparency = 1.000
			button_itemimage_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			button_itemimage_2.BorderSizePixel = 0
			button_itemimage_2.Position = UDim2.new(0.194966465, 0, 0.5, 0)
			button_itemimage_2.Size = UDim2.new(0, 20, 0, 20)
			button_itemimage_2.Image = "http://www.roblox.com/asset/?id=6035107928"

			button_itemimagegradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 196, 57)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 127))}
			button_itemimagegradient_2.Name = "button_item.image.gradient"
			button_itemimagegradient_2.Parent = button_itemimage_2

			Frame_2.Parent = Frame
			Frame_2.Active = true
			Frame_2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
			Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Frame_2.BorderSizePixel = 0
			Frame_2.Position = UDim2.new(0.00831946731, 0, 0.165938869, 0)
			Frame_2.Size = UDim2.new(0, 593, 0, 120)
			
			local Frame_2uistroke = Instance.new("UIStroke",Frame_2)
			Frame_2uistroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			Frame_2uistroke.Color = Color3.fromRGB(255, 255, 255)
			Frame_2uistroke.LineJoinMode = Enum.LineJoinMode.Round
			Frame_2uistroke.Thickness = 1
			Frame_2uistroke.Transparency = 0.9

			UICorner.Parent = Frame_2

			ScrollingFrame.Parent = Frame_2
			ScrollingFrame.Active = true
			ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ScrollingFrame.BackgroundTransparency = 1.000
			ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ScrollingFrame.BorderSizePixel = 0
			ScrollingFrame.Size = UDim2.new(0, 593, 0, 120)
			ScrollingFrame.ScrollBarThickness = 0

			UIListLayout.Parent = ScrollingFrame
			UIListLayout.FillDirection = Enum.FillDirection.Horizontal
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0, 8)

			UIPadding.Parent = ScrollingFrame
			UIPadding.PaddingLeft = UDim.new(0, 5)
			UIPadding.PaddingTop = UDim.new(0, 5)

			Frame_4.Parent = Frame
			Frame_4.Active = true
			Frame_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Frame_4.BackgroundTransparency = 1.000
			Frame_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Frame_4.BorderSizePixel = 0
			Frame_4.Position = UDim2.new(0.00831946731, 0, 0.720524013, 0)
			Frame_4.Size = UDim2.new(0, 593, 0, 58)

			UIListLayout_2.Parent = Frame_4
			UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal
			UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout_2.Padding = UDim.new(0, 10)

			UIPadding_2.Parent = Frame_4
			UIPadding_2.PaddingTop = UDim.new(0, 5)

			button_item_2.Name = "button_item"
			button_item_2.Parent = Frame_4
			button_item_2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
			button_item_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			button_item_2.BorderSizePixel = 0
			button_item_2.Position = UDim2.new(0.00831946731, 0, 0.720524013, 0)
			button_item_2.Size = UDim2.new(0, 46, 0, 46)
			button_item_2.AutoButtonColor = false
			button_item_2.Font = Enum.Font.SourceSans
			button_item_2.Text = ""
			button_item_2.TextColor3 = Color3.fromRGB(0, 0, 0)
			button_item_2.TextSize = 14.000
			button_item_2.TextTransparency = 1.000
			
			local button_item_2uistroke = Instance.new("UIStroke",button_item_2)
			button_item_2uistroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			button_item_2uistroke.Color = Color3.fromRGB(255, 255, 255)
			button_item_2uistroke.LineJoinMode = Enum.LineJoinMode.Round
			button_item_2uistroke.Thickness = 1
			button_item_2uistroke.Transparency = 0.9

			button_itemuicorner_2.Name = "button_item.uicorner"
			button_itemuicorner_2.Parent = button_item_2

			button_itemimage_3.Name = "button_item.image"
			button_itemimage_3.Parent = button_item_2
			button_itemimage_3.Active = true
			button_itemimage_3.AnchorPoint = Vector2.new(0.5, 0.5)
			button_itemimage_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			button_itemimage_3.BackgroundTransparency = 1.000
			button_itemimage_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
			button_itemimage_3.BorderSizePixel = 0
			button_itemimage_3.Position = UDim2.new(0.5, 0, 0.5, 0)
			button_itemimage_3.Size = UDim2.new(0, 26, 0, 26)
			button_itemimage_3.Image = "rbxassetid://15050731177"
			button_itemimage_3.ImageTransparency = 0.85

			button_item_3.Name = "button_item"
			button_item_3.Parent = Frame_4
			button_item_3.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
			button_item_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
			button_item_3.BorderSizePixel = 0
			button_item_3.LayoutOrder = 3
			button_item_3.Position = UDim2.new(0.108153075, 0, 0.720524013, 0)
			button_item_3.Size = UDim2.new(0, 46, 0, 46)
			button_item_3.AutoButtonColor = false
			button_item_3.Font = Enum.Font.SourceSans
			button_item_3.Text = ""
			button_item_3.TextColor3 = Color3.fromRGB(0, 0, 0)
			button_item_3.TextSize = 14.000
			button_item_3.TextTransparency = 1.000
			
			local button_item_3uistroke = Instance.new("UIStroke",button_item_3)
			button_item_3uistroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			button_item_3uistroke.Color = Color3.fromRGB(255, 255, 255)
			button_item_3uistroke.LineJoinMode = Enum.LineJoinMode.Round
			button_item_3uistroke.Thickness = 1
			button_item_3uistroke.Transparency = 0.9

			button_itemuicorner_3.Name = "button_item.uicorner"
			button_itemuicorner_3.Parent = button_item_3

			button_itemimage_4.Name = "button_item.image"
			button_itemimage_4.Parent = button_item_3
			button_itemimage_4.Active = true
			button_itemimage_4.AnchorPoint = Vector2.new(0.5, 0.5)
			button_itemimage_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			button_itemimage_4.BackgroundTransparency = 1.000
			button_itemimage_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
			button_itemimage_4.BorderSizePixel = 0
			button_itemimage_4.Position = UDim2.new(0.5, 0, 0.5, 0)
			button_itemimage_4.Size = UDim2.new(0, 26, 0, 26)
			button_itemimage_4.Image = "rbxassetid://15050743881"
			button_itemimage_4.ImageTransparency = 0.85

			button_item_4.Name = "button_item"
			button_item_4.Parent = Frame_4
			button_item_4.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
			button_item_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
			button_item_4.BorderSizePixel = 0
			button_item_4.LayoutOrder = 1
			button_item_4.Position = UDim2.new(0.108153075, 0, 0.720524013, 0)
			button_item_4.Size = UDim2.new(0, 46, 0, 46)
			button_item_4.AutoButtonColor = false
			button_item_4.Font = Enum.Font.SourceSans
			button_item_4.Text = ""
			button_item_4.TextColor3 = Color3.fromRGB(0, 0, 0)
			button_item_4.TextSize = 14.000
			button_item_4.TextTransparency = 1.000
			
			local button_item_4uistroke = Instance.new("UIStroke",button_item_4)
			button_item_4uistroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			button_item_4uistroke.Color = Color3.fromRGB(255, 255, 255)
			button_item_4uistroke.LineJoinMode = Enum.LineJoinMode.Round
			button_item_4uistroke.Thickness = 1
			button_item_4uistroke.Transparency = 0.9

			button_itemuicorner_4.Name = "button_item.uicorner"
			button_itemuicorner_4.Parent = button_item_4

			button_itemimage_5.Name = "button_item.image"
			button_itemimage_5.Parent = button_item_4
			button_itemimage_5.Active = true
			button_itemimage_5.AnchorPoint = Vector2.new(0.5, 0.5)
			button_itemimage_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			button_itemimage_5.BackgroundTransparency = 1.000
			button_itemimage_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
			button_itemimage_5.BorderSizePixel = 0
			button_itemimage_5.Position = UDim2.new(0.5, 0, 0.5, 0)
			button_itemimage_5.Size = UDim2.new(0, 26, 0, 26)
			button_itemimage_5.Image = "rbxassetid://15050758580"
			button_itemimage_5.ImageTransparency = 0.85

			button_item_5.Name = "button_item"
			button_item_5.Parent = Frame_4
			button_item_5.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
			button_item_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
			button_item_5.BorderSizePixel = 0
			button_item_5.LayoutOrder = 4
			button_item_5.Position = UDim2.new(0.108153075, 0, 0.720524013, 0)
			button_item_5.Size = UDim2.new(0, 46, 0, 46)
			button_item_5.AutoButtonColor = false
			button_item_5.Font = Enum.Font.SourceSans
			button_item_5.Text = ""
			button_item_5.TextColor3 = Color3.fromRGB(0, 0, 0)
			button_item_5.TextSize = 14.000
			button_item_5.TextTransparency = 1.000
			
			local button_item_5uistroke = Instance.new("UIStroke",button_item_5)
			button_item_5uistroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			button_item_5uistroke.Color = Color3.fromRGB(255, 255, 255)
			button_item_5uistroke.LineJoinMode = Enum.LineJoinMode.Round
			button_item_5uistroke.Thickness = 1
			button_item_5uistroke.Transparency = 0.9

			button_itemuicorner_5.Name = "button_item.uicorner"
			button_itemuicorner_5.Parent = button_item_5

			button_itemimage_6.Name = "button_item.image"
			button_itemimage_6.Parent = button_item_5
			button_itemimage_6.Active = true
			button_itemimage_6.AnchorPoint = Vector2.new(0.5, 0.5)
			button_itemimage_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			button_itemimage_6.BackgroundTransparency = 1.000
			button_itemimage_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
			button_itemimage_6.BorderSizePixel = 0
			button_itemimage_6.Position = UDim2.new(0.5, 0, 0.5, 0)
			button_itemimage_6.Size = UDim2.new(0, 26, 0, 26)
			button_itemimage_6.Image = "rbxassetid://15050766537"
			button_itemimage_6.ImageTransparency = 0.85

			button_item_6.Name = "button_item"
			button_item_6.Parent = Frame_4
			button_item_6.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
			button_item_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
			button_item_6.BorderSizePixel = 0
			button_item_6.LayoutOrder = 2
			button_item_6.Position = UDim2.new(0.108153075, 0, 0.720524013, 0)
			button_item_6.Size = UDim2.new(0, 46, 0, 46)
			button_item_6.AutoButtonColor = false
			button_item_6.Font = Enum.Font.SourceSans
			button_item_6.Text = ""
			button_item_6.TextColor3 = Color3.fromRGB(0, 0, 0)
			button_item_6.TextSize = 14.000
			button_item_6.TextTransparency = 1.000
			
			local button_item_6uistroke = Instance.new("UIStroke",button_item_6)
			button_item_6uistroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			button_item_6uistroke.Color = Color3.fromRGB(255, 255, 255)
			button_item_6uistroke.LineJoinMode = Enum.LineJoinMode.Round
			button_item_6uistroke.Thickness = 1
			button_item_6uistroke.Transparency = 0.9

			button_itemuicorner_6.Name = "button_item.uicorner"
			button_itemuicorner_6.Parent = button_item_6

			button_itemimage_7.Name = "button_item.image"
			button_itemimage_7.Parent = button_item_6
			button_itemimage_7.Active = true
			button_itemimage_7.AnchorPoint = Vector2.new(0.5, 0.5)
			button_itemimage_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			button_itemimage_7.BackgroundTransparency = 1.000
			button_itemimage_7.BorderColor3 = Color3.fromRGB(0, 0, 0)
			button_itemimage_7.BorderSizePixel = 0
			button_itemimage_7.Position = UDim2.new(0.5, 0, 0.5, 0)
			button_itemimage_7.Size = UDim2.new(0, 26, 0, 26)
			button_itemimage_7.Image = "rbxassetid://15050776011"
			button_itemimage_7.ImageTransparency = 0.85

			pageuilist.Name = "page.uilist"
			pageuilist.Parent = page
			pageuilist.SortOrder = Enum.SortOrder.LayoutOrder
			pageuilist.Padding = UDim.new(0, 5)

			pageuipadding.Name = "page.uipadding"
			pageuipadding.Parent = page
			pageuipadding.PaddingLeft = UDim.new(0, 10)
			pageuipadding.PaddingTop = UDim.new(0, 10)
			
			local button_item_5_2 = Instance.new("TextButton")
			local button_item_5_2corner_5 = Instance.new("UICorner")
			local button_item_5_2image_6 = Instance.new("ImageLabel")

			button_item_5_2.Name = "button_item"
			button_item_5_2.Parent = Frame_4
			button_item_5_2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
			button_item_5_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			button_item_5_2.BorderSizePixel = 0
			button_item_5_2.LayoutOrder = 4
			button_item_5_2.Position = UDim2.new(0.108153075, 0, 0.720524013, 0)
			button_item_5_2.Size = UDim2.new(0, 46, 0, 46)
			button_item_5_2.AutoButtonColor = false
			button_item_5_2.Font = Enum.Font.SourceSans
			button_item_5_2.Text = ""
			button_item_5_2.TextColor3 = Color3.fromRGB(0, 0, 0)
			button_item_5_2.TextSize = 14.000
			button_item_5_2.TextTransparency = 1.000

			local button_item_5_2uistroke = Instance.new("UIStroke",button_item_5_2)
			button_item_5_2uistroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			button_item_5_2uistroke.Color = Color3.fromRGB(255, 255, 255)
			button_item_5_2uistroke.LineJoinMode = Enum.LineJoinMode.Round
			button_item_5_2uistroke.Thickness = 1
			button_item_5_2uistroke.Transparency = 0.9

			button_item_5_2corner_5.Name = "button_item.uicorner"
			button_item_5_2corner_5.Parent = button_item_5_2

			button_item_5_2image_6.Name = "button_item.image"
			button_item_5_2image_6.Parent = button_item_5_2
			button_item_5_2image_6.Active = true
			button_item_5_2image_6.AnchorPoint = Vector2.new(0.5, 0.5)
			button_item_5_2image_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			button_item_5_2image_6.BackgroundTransparency = 1.000
			button_item_5_2image_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
			button_item_5_2image_6.BorderSizePixel = 0
			button_item_5_2image_6.Position = UDim2.new(0.5, 0, 0.5, 0)
			button_item_5_2image_6.Size = UDim2.new(0, 32, 0, 32)
			button_item_5_2image_6.Image = "rbxassetid://15054358009"
			button_item_5_2image_6.ImageTransparency = 0.85
			
			local MainUI = game.Players.LocalPlayer.PlayerGui.Main
			local Inv = require(MainUI.UIController.Inventory)
			local Sprite = require(MainUI.UIController.Inventory.Spritesheets)
			local itemList = getupvalue(Inv.UpdateSort,2)
			local tier = getupvalue(Inv.UpdateSelected,7)
			
			local FightGet = {
				["Superhuman"] = {
					ID = "http://www.roblox.com/asset/?id=10338473987",
					ImageRectOffset = Vector2.new(0,0),
					ImageRectSize = Vector2.new(0,0),
				},
				["GodHuman"] = {
					ID = "http://www.roblox.com/asset/?id=9945562382",
					ImageRectOffset = Vector2.new(300,200),
					ImageRectSize = Vector2.new(100,100),
				},
				["DragonTalon"] = {
					ID = "http://www.roblox.com/asset/?id=9945562382",
					ImageRectOffset = Vector2.new(100,500),
					ImageRectSize = Vector2.new(100,100),
				},
				["ElectricClaw"] = {
					ID = "http://www.roblox.com/asset/?id=9945562382",
					ImageRectOffset = Vector2.new(200,0),
					ImageRectSize = Vector2.new(100,100),
				},
				["SharkmanKarate"] = {
					ID = "http://www.roblox.com/asset/?id=9945562382",
					ImageRectOffset = Vector2.new(0,0),
					ImageRectSize = Vector2.new(100,100),
				},
				["DeathStep"] = {
					ID = "http://www.roblox.com/asset/?id=9945562382",
					ImageRectOffset = Vector2.new(400,300),
					ImageRectSize = Vector2.new(100,100),
				},
			}

			local GetMeleeText = function()
				local AllMelee = {
					"Godhuman",
					"Superhuman",
					"SharkmanKarate",
					"DragonTalon",
					"ElectricClaw",
					"DeathStep"
				}

				local AllHaveMelee = {}

				for i,v in pairs(AllMelee) do
					if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buy"..tostring(v) , true) == 1 then
						table.insert(AllHaveMelee,tostring(v)) 
						if tostring(v) == "Godhuman" then
							table.insert(AllHaveMelee,"GodHuman")
						end
					end
					task.wait(0.01)
				end
				return AllHaveMelee
			end
			
			button_item_5.MouseButton1Down:Connect(function()
				for i,v in pairs(ScrollingFrame:GetChildren()) do
					if v:IsA("Frame") then
						v:Destroy()
					end
				end
				for i,v in pairs(Frame_4:GetChildren()) do
					if v:IsA("TextButton") then
						for i,v in pairs(v:GetChildren()) do
							if v:IsA("ImageLabel") then
								tween(v,0.1,Enum.EasingStyle.Quart,{ImageTransparency = 0.85})
								if v.Rotation == -360 then
									v.Rotation = 0
								end
							end
							tween(button_itemimage_6,0.1,Enum.EasingStyle.Quart,{ImageTransparency = 0})
							tween(button_itemimage_6,1,Enum.EasingStyle.Back,{Rotation = -360})
						end
					end
				end
				for i,v in pairs(itemList) do
					if v.Visible and v.details.Type == "Material" then -- v.details.Type == "Sword
						for Image,list in pairs(Sprite) do
							local FName = v.details.Name:gsub(",",""):gsub(":",""):gsub("'","")
							local IconSize = list[FName.."1.png"]
							local IconOutlineSize = list[FName.."2.png"]

							if IconSize then
								local num = (IconSize[3] and 1 or 2)

								local Frame_3 = Instance.new("Frame")
								local UICorner_2 = Instance.new("UICorner")

								UICorner_2.Parent = Frame_3

								Frame_3.Parent = ScrollingFrame
								Frame_3.Active = true
								Frame_3.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
								Frame_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
								Frame_3.BorderSizePixel = 0
								Frame_3.Size = UDim2.new(0, 110, 0, 110)

								local image = Instance.new("ImageLabel")
								local image_uicorner = Instance.new("UICorner")

								image.Name = "image"
								image.Parent = Frame_3
								image.AnchorPoint = Vector2.new(0.5,0.5)
								image.Position = UDim2.new(0.5, 0, 0.5, 0)
								image.BackgroundTransparency = 1
								image.Active = true
								image.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
								image.BorderSizePixel = 0
								image.Size = UDim2.new(0, 100, 0, 100)
								image.Image = Image
								image.ImageRectOffset = Vector2.new(IconSize[1] / num, IconSize[2] / num);
								image.ImageRectSize = Vector2.new(IconSize[3] and 150, IconSize[4] and 150);
								image.ImageTransparency = 1
								
								local TextLabel = Instance.new("TextLabel")

								TextLabel.Parent = Frame_3
								TextLabel.Active = true
								TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								TextLabel.BackgroundTransparency = 1.000
								TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
								TextLabel.BorderSizePixel = 0
								TextLabel.Position = UDim2.new(0.045, 0, 0.74545455, 0)
								TextLabel.Size = UDim2.new(0, 96, 0, 22)
								TextLabel.FontFace = Font.fromId(12187365977,Enum.FontWeight.Bold)
								TextLabel.Text = "x "..v.details.Count
								TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
								TextLabel.TextSize = 25.000
								TextLabel.TextWrapped = true
								TextLabel.TextXAlignment = Enum.TextXAlignment.Right
								TextLabel.TextSize = 25.000
								TextLabel.TextTransparency = 1
								
								local TextButton = Instance.new("TextButton")

								TextButton.Parent = Frame_3
								TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								TextButton.BackgroundTransparency = 1.000
								TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
								TextButton.BorderSizePixel = 0
								TextButton.Size = UDim2.new(0, 110, 0, 110)
								TextButton.Font = Enum.Font.SourceSans
								TextButton.Text = ""
								TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
								TextButton.TextSize = 14.000
								
								local Frame = Instance.new("Frame")
								local UICorner = Instance.new("UICorner")
								local TextLabel_2 = Instance.new("TextLabel")

								Frame.Parent = TextButton
								Frame.Active = true
								Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
								Frame.BackgroundTransparency = 1
								Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
								Frame.BorderSizePixel = 0
								Frame.Size = UDim2.new(0, 110, 0, 110)

								UICorner.Parent = Frame

								TextLabel_2.Parent = Frame
								TextLabel_2.Active = true
								TextLabel_2.AnchorPoint = Vector2.new(0.5, 0.5)
								TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								TextLabel_2.BackgroundTransparency = 1.000
								TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
								TextLabel_2.BorderSizePixel = 0
								TextLabel_2.Position = UDim2.new(0.5, 0, 0.5, 0)
								TextLabel_2.Size = UDim2.new(0, 110, 0, 72)
								TextLabel_2.FontFace = Font.fromId(12187365977,Enum.FontWeight.Bold)
								TextLabel_2.Text = v.details.Name
								TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
								TextLabel_2.TextSize = 14.000
								TextLabel_2.TextWrapped = true
								TextLabel_2.TextTransparency = 1

								TextButton.MouseEnter:Connect(function()
									tween(Frame,1,Enum.EasingStyle.Quart,{BackgroundTransparency = 0.45})
									tween(TextLabel_2,1,Enum.EasingStyle.Quart,{TextTransparency = 0})
								end)

								TextButton.MouseLeave:Connect(function()
									tween(TextLabel_2,0.25,Enum.EasingStyle.Quart,{TextTransparency = 1})
									repeat task.wait() until TextLabel_2.TextTransparency == 1
									tween(Frame,1,Enum.EasingStyle.Back,{BackgroundTransparency = 1})
								end)

								tween(image,1,Enum.EasingStyle.Back,{ImageTransparency = 0.65})
								tween(TextLabel,1,Enum.EasingStyle.Back,{TextTransparency = 0})

								image_uicorner.CornerRadius = UDim.new(0, 4)
								image_uicorner.Name = "image_uicorner"
								image_uicorner.Parent = image
							end

						end
					end
				end
			end)
			
			button_item_3.MouseButton1Down:Connect(function()
				for i,v in pairs(ScrollingFrame:GetChildren()) do
					if v:IsA("Frame") then
						v:Destroy()
					end
				end
				for i,v in pairs(Frame_4:GetChildren()) do
					if v:IsA("TextButton") then
						for i,v in pairs(v:GetChildren()) do
							if v:IsA("ImageLabel") then
								tween(v,0.1,Enum.EasingStyle.Quart,{ImageTransparency = 0.85})
								if v.Rotation == -360 then
									v.Rotation = 0
								end
							end
							tween(button_itemimage_4,0.1,Enum.EasingStyle.Quart,{ImageTransparency = 0})
							tween(button_itemimage_4,1,Enum.EasingStyle.Back,{Rotation = -360})
						end
					end
				end
				for i,v in pairs(itemList) do
					if v.Visible and v.details.Type == "Blox Fruit" then -- v.details.Type == "Sword
						for Image,list in pairs(Sprite) do
							local FName = v.details.Name:gsub(",",""):gsub(":",""):gsub("'","")
							local IconSize = list[FName.."1.png"]
							local IconOutlineSize = list[FName.."2.png"]

							if IconSize then
								local num = (IconSize[3] and 1 or 2)

								local Frame_3 = Instance.new("Frame")
								local UICorner_2 = Instance.new("UICorner")

								UICorner_2.Parent = Frame_3

								Frame_3.Parent = ScrollingFrame
								Frame_3.Active = true
								Frame_3.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
								Frame_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
								Frame_3.BorderSizePixel = 0
								Frame_3.Size = UDim2.new(0, 110, 0, 110)

								local image = Instance.new("ImageLabel")
								local image_uicorner = Instance.new("UICorner")

								image.Name = "image"
								image.Parent = Frame_3
								image.AnchorPoint = Vector2.new(0.5,0.5)
								image.Position = UDim2.new(0.5, 0, 0.5, 0)
								image.BackgroundTransparency = 1
								image.Active = true
								image.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
								image.BorderSizePixel = 0
								image.Size = UDim2.new(0, 100, 0, 100)
								image.Image = Image
								image.ImageRectOffset = Vector2.new(IconSize[1] / num, IconSize[2] / num);
								image.ImageRectSize = Vector2.new(IconSize[3] and 150, IconSize[4] and 150);
								image.ImageTransparency = 1
								
								local TextLabel = Instance.new("TextLabel")

								TextLabel.Parent = Frame_3
								TextLabel.Active = true
								TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								TextLabel.BackgroundTransparency = 1.000
								TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
								TextLabel.BorderSizePixel = 0
								TextLabel.Position = UDim2.new(0.045, 0, 0.74545455, 0)
								TextLabel.Size = UDim2.new(0, 96, 0, 22)
								TextLabel.FontFace = Font.fromId(12187365977,Enum.FontWeight.Bold)
								TextLabel.Text = "x "..v.details.Count
								TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
								TextLabel.TextSize = 25.000
								TextLabel.TextWrapped = true
								TextLabel.TextXAlignment = Enum.TextXAlignment.Right
								TextLabel.TextSize = 25.000
								TextLabel.TextTransparency = 1
								
								local TextButton = Instance.new("TextButton")

								TextButton.Parent = Frame_3
								TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								TextButton.BackgroundTransparency = 1.000
								TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
								TextButton.BorderSizePixel = 0
								TextButton.Size = UDim2.new(0, 110, 0, 110)
								TextButton.Font = Enum.Font.SourceSans
								TextButton.Text = ""
								TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
								TextButton.TextSize = 14.000
								
								local Frame = Instance.new("Frame")
								local UICorner = Instance.new("UICorner")
								local TextLabel_2 = Instance.new("TextLabel")

								Frame.Parent = TextButton
								Frame.Active = true
								Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
								Frame.BackgroundTransparency = 1
								Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
								Frame.BorderSizePixel = 0
								Frame.Size = UDim2.new(0, 110, 0, 110)

								UICorner.Parent = Frame

								TextLabel_2.Parent = Frame
								TextLabel_2.Active = true
								TextLabel_2.AnchorPoint = Vector2.new(0.5, 0.5)
								TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								TextLabel_2.BackgroundTransparency = 1.000
								TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
								TextLabel_2.BorderSizePixel = 0
								TextLabel_2.Position = UDim2.new(0.5, 0, 0.5, 0)
								TextLabel_2.Size = UDim2.new(0, 110, 0, 72)
								TextLabel_2.FontFace = Font.fromId(12187365977,Enum.FontWeight.Bold)
								TextLabel_2.Text = v.details.Name
								TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
								TextLabel_2.TextSize = 14.000
								TextLabel_2.TextWrapped = true
								TextLabel_2.TextTransparency = 1
								
								TextButton.MouseButton1Down:Connect(function()
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadFruit",v.details.Name)
								end)
								
								TextButton.MouseEnter:Connect(function()
									tween(Frame,1,Enum.EasingStyle.Quart,{BackgroundTransparency = 0.45})
									tween(TextLabel_2,1,Enum.EasingStyle.Quart,{TextTransparency = 0})
								end)
								
								TextButton.MouseLeave:Connect(function()
									tween(TextLabel_2,0.25,Enum.EasingStyle.Quart,{TextTransparency = 1})
									repeat task.wait() until TextLabel_2.TextTransparency == 1
									tween(Frame,1,Enum.EasingStyle.Back,{BackgroundTransparency = 1})
								end)

								tween(image,1,Enum.EasingStyle.Back,{ImageTransparency = 0.65})
								tween(TextLabel,1,Enum.EasingStyle.Back,{TextTransparency = 0})

								image_uicorner.CornerRadius = UDim.new(0, 4)
								image_uicorner.Name = "image_uicorner"
								image_uicorner.Parent = image
							end

						end
					end
				end
			end)
			
			button_item_6.MouseButton1Down:Connect(function()
				for i,v in pairs(ScrollingFrame:GetChildren()) do
					if v:IsA("Frame") then
						v:Destroy()
					end
				end
				for i,v in pairs(Frame_4:GetChildren()) do
					if v:IsA("TextButton") then
						for i,v in pairs(v:GetChildren()) do
							if v:IsA("ImageLabel") then
								tween(v,0.1,Enum.EasingStyle.Quart,{ImageTransparency = 0.85})
								if v.Rotation == -360 then
									v.Rotation = 0
								end
							end
							tween(button_itemimage_7,0.1,Enum.EasingStyle.Quart,{ImageTransparency = 0})
							tween(button_itemimage_7,1,Enum.EasingStyle.Back,{Rotation = -360})
						end
					end
				end
				for i,v in pairs(itemList) do
					if v.Visible and v.details.Type == "Accessory" then -- v.details.Type == "Sword
						for Image,list in pairs(Sprite) do
							local FName = v.details.Name:gsub(",",""):gsub(":",""):gsub("'","")
							local IconSize = list[FName.."1.png"]
							local IconOutlineSize = list[FName.."2.png"]

							if IconSize then
								local num = (IconSize[3] and 1 or 2)

								local Frame_3 = Instance.new("Frame")
								local UICorner_2 = Instance.new("UICorner")

								UICorner_2.Parent = Frame_3

								Frame_3.Parent = ScrollingFrame
								Frame_3.Active = true
								Frame_3.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
								Frame_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
								Frame_3.BorderSizePixel = 0
								Frame_3.Size = UDim2.new(0, 110, 0, 110)

								local image = Instance.new("ImageLabel")
								local image_uicorner = Instance.new("UICorner")

								image.Name = "image"
								image.Parent = Frame_3
								image.AnchorPoint = Vector2.new(0.5,0.5)
								image.Position = UDim2.new(0.5, 0, 0.5, 0)
								image.BackgroundTransparency = 1
								image.Active = true
								image.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
								image.BorderSizePixel = 0
								image.Size = UDim2.new(0, 100, 0, 100)
								image.Image = Image
								image.ImageRectOffset = Vector2.new(IconSize[1] / num, IconSize[2] / num);
								image.ImageRectSize = Vector2.new(IconSize[3] and 150, IconSize[4] and 150);
								image.ImageTransparency = 1
								
								local TextButton = Instance.new("TextButton")

								TextButton.Parent = Frame_3
								TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								TextButton.BackgroundTransparency = 1.000
								TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
								TextButton.BorderSizePixel = 0
								TextButton.Size = UDim2.new(0, 110, 0, 110)
								TextButton.Font = Enum.Font.SourceSans
								TextButton.Text = ""
								TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
								TextButton.TextSize = 14.000

								local Frame = Instance.new("Frame")
								local UICorner = Instance.new("UICorner")
								local TextLabel_2 = Instance.new("TextLabel")

								Frame.Parent = TextButton
								Frame.Active = true
								Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
								Frame.BackgroundTransparency = 1
								Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
								Frame.BorderSizePixel = 0
								Frame.Size = UDim2.new(0, 110, 0, 110)

								UICorner.Parent = Frame

								TextLabel_2.Parent = Frame
								TextLabel_2.Active = true
								TextLabel_2.AnchorPoint = Vector2.new(0.5, 0.5)
								TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								TextLabel_2.BackgroundTransparency = 1.000
								TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
								TextLabel_2.BorderSizePixel = 0
								TextLabel_2.Position = UDim2.new(0.5, 0, 0.5, 0)
								TextLabel_2.Size = UDim2.new(0, 110, 0, 72)
								TextLabel_2.FontFace = Font.fromId(12187365977,Enum.FontWeight.Bold)
								TextLabel_2.Text = v.details.Name
								TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
								TextLabel_2.TextSize = 14.000
								TextLabel_2.TextWrapped = true
								TextLabel_2.TextTransparency = 1
								
								TextButton.MouseButton1Down:Connect(function()
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem",v.details.Name)
								end)

								TextButton.MouseEnter:Connect(function()
									tween(Frame,1,Enum.EasingStyle.Quart,{BackgroundTransparency = 0.45})
									tween(TextLabel_2,1,Enum.EasingStyle.Quart,{TextTransparency = 0})
								end)

								TextButton.MouseLeave:Connect(function()
									tween(TextLabel_2,0.25,Enum.EasingStyle.Quart,{TextTransparency = 1})
									repeat task.wait() until TextLabel_2.TextTransparency == 1
									tween(Frame,1,Enum.EasingStyle.Back,{BackgroundTransparency = 1})
								end)

								tween(image,1,Enum.EasingStyle.Back,{ImageTransparency = 0})

								image_uicorner.CornerRadius = UDim.new(0, 4)
								image_uicorner.Name = "image_uicorner"
								image_uicorner.Parent = image
							end

						end
					end
				end
			end)
			
			button_item_4.MouseButton1Down:Connect(function()
				for i,v in pairs(ScrollingFrame:GetChildren()) do
					if v:IsA("Frame") then
						v:Destroy()
					end
				end
				for i,v in pairs(Frame_4:GetChildren()) do
					if v:IsA("TextButton") then
						for i,v in pairs(v:GetChildren()) do
							if v:IsA("ImageLabel") then
								tween(v,0.1,Enum.EasingStyle.Quart,{ImageTransparency = 0.85})
								if v.Rotation == -360 then
									v.Rotation = 0
								end
							end
							tween(button_itemimage_5,0.1,Enum.EasingStyle.Quart,{ImageTransparency = 0})
							tween(button_itemimage_5,1,Enum.EasingStyle.Back,{Rotation = -360})
						end
					end
				end
				for i,v in pairs(itemList) do
					if v.Visible and v.details.Type == "Gun" then -- v.details.Type == "Sword
						for Image,list in pairs(Sprite) do
							local FName = v.details.Name:gsub(",",""):gsub(":",""):gsub("'","")
							local IconSize = list[FName.."1.png"]
							local IconOutlineSize = list[FName.."2.png"]

							if IconSize then
								local num = (IconSize[3] and 1 or 2)

								local Frame_3 = Instance.new("Frame")
								local UICorner_2 = Instance.new("UICorner")

								UICorner_2.Parent = Frame_3

								Frame_3.Parent = ScrollingFrame
								Frame_3.Active = true
								Frame_3.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
								Frame_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
								Frame_3.BorderSizePixel = 0
								Frame_3.Size = UDim2.new(0, 110, 0, 110)

								local image = Instance.new("ImageLabel")
								local image_uicorner = Instance.new("UICorner")

								image.Name = "image"
								image.Parent = Frame_3
								image.AnchorPoint = Vector2.new(0.5,0.5)
								image.Position = UDim2.new(0.5, 0, 0.5, 0)
								image.BackgroundTransparency = 1
								image.Active = true
								image.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
								image.BorderSizePixel = 0
								image.Size = UDim2.new(0, 100, 0, 100)
								image.Image = Image
								image.ImageRectOffset = Vector2.new(IconSize[1] / num, IconSize[2] / num);
								image.ImageRectSize = Vector2.new(IconSize[3] and 150, IconSize[4] and 150);
								image.ImageTransparency = 1

								local TextButton = Instance.new("TextButton")

								TextButton.Parent = Frame_3
								TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								TextButton.BackgroundTransparency = 1.000
								TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
								TextButton.BorderSizePixel = 0
								TextButton.Size = UDim2.new(0, 110, 0, 110)
								TextButton.Font = Enum.Font.SourceSans
								TextButton.Text = ""
								TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
								TextButton.TextSize = 14.000

								local Frame = Instance.new("Frame")
								local UICorner = Instance.new("UICorner")
								local TextLabel_2 = Instance.new("TextLabel")

								Frame.Parent = TextButton
								Frame.Active = true
								Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
								Frame.BackgroundTransparency = 1
								Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
								Frame.BorderSizePixel = 0
								Frame.Size = UDim2.new(0, 110, 0, 110)

								UICorner.Parent = Frame

								TextLabel_2.Parent = Frame
								TextLabel_2.Active = true
								TextLabel_2.AnchorPoint = Vector2.new(0.5, 0.5)
								TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								TextLabel_2.BackgroundTransparency = 1.000
								TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
								TextLabel_2.BorderSizePixel = 0
								TextLabel_2.Position = UDim2.new(0.5, 0, 0.5, 0)
								TextLabel_2.Size = UDim2.new(0, 110, 0, 72)
								TextLabel_2.FontFace = Font.fromId(12187365977,Enum.FontWeight.Bold)
								TextLabel_2.Text = v.details.Name
								TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
								TextLabel_2.TextSize = 14.000
								TextLabel_2.TextWrapped = true
								TextLabel_2.TextTransparency = 1
								
								TextButton.MouseButton1Down:Connect(function()
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem",v.details.Name)
								end)

								TextButton.MouseEnter:Connect(function()
									tween(Frame,1,Enum.EasingStyle.Quart,{BackgroundTransparency = 0.45})
									tween(TextLabel_2,1,Enum.EasingStyle.Quart,{TextTransparency = 0})
								end)

								TextButton.MouseLeave:Connect(function()
									tween(TextLabel_2,0.25,Enum.EasingStyle.Quart,{TextTransparency = 1})
									repeat task.wait() until TextLabel_2.TextTransparency == 1
									tween(Frame,1,Enum.EasingStyle.Back,{BackgroundTransparency = 1})
								end)

								tween(image,1,Enum.EasingStyle.Back,{ImageTransparency = 0})

								image_uicorner.CornerRadius = UDim.new(0, 4)
								image_uicorner.Name = "image_uicorner"
								image_uicorner.Parent = image
							end

						end
					end
				end
			end)
			
			button_item_2.MouseButton1Down:Connect(function()
				for i,v in pairs(ScrollingFrame:GetChildren()) do
					if v:IsA("Frame") then
						v:Destroy()
					end
				end
				for i,v in pairs(Frame_4:GetChildren()) do
					if v:IsA("TextButton") then
						for i,v in pairs(v:GetChildren()) do
							if v:IsA("ImageLabel") then
								tween(v,0.1,Enum.EasingStyle.Quart,{ImageTransparency = 0.85})
								if v.Rotation == -360 then
									v.Rotation = 0
								end
							end
							tween(button_itemimage_3,0.1,Enum.EasingStyle.Quart,{ImageTransparency = 0})
							tween(button_itemimage_3,1,Enum.EasingStyle.Back,{Rotation = -360})
						end
					end
				end
				for i,v in pairs(itemList) do
					if v.Visible and v.details.Type == "Sword" then -- v.details.Type == "Sword
						for Image,list in pairs(Sprite) do
							local FName = v.details.Name:gsub(",",""):gsub(":",""):gsub("'","")
							local IconSize = list[FName.."1.png"]
							local IconOutlineSize = list[FName.."2.png"]

							if IconSize then
								local num = (IconSize[3] and 1 or 2)
								
								local Frame_3 = Instance.new("Frame")
								local UICorner_2 = Instance.new("UICorner")
								
								UICorner_2.Parent = Frame_3
								
								Frame_3.Parent = ScrollingFrame
								Frame_3.Active = true
								Frame_3.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
								Frame_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
								Frame_3.BorderSizePixel = 0
								Frame_3.Size = UDim2.new(0, 110, 0, 110)
								
								local image = Instance.new("ImageLabel")
								local image_uicorner = Instance.new("UICorner")

								image.Name = "image"
								image.Parent = Frame_3
								image.AnchorPoint = Vector2.new(0.5,0.5)
								image.Position = UDim2.new(0.5, 0, 0.5, 0)
								image.BackgroundTransparency = 1
								image.Active = true
								image.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
								image.BorderSizePixel = 0
								image.Size = UDim2.new(0, 100, 0, 100)
								image.Image = Image
								image.ImageRectOffset = Vector2.new(IconSize[1] / num, IconSize[2] / num);
								image.ImageRectSize = Vector2.new(IconSize[3] and 150, IconSize[4] and 150);
								image.ImageTransparency = 1

								local TextButton = Instance.new("TextButton")

								TextButton.Parent = Frame_3
								TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								TextButton.BackgroundTransparency = 1.000
								TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
								TextButton.BorderSizePixel = 0
								TextButton.Size = UDim2.new(0, 110, 0, 110)
								TextButton.Font = Enum.Font.SourceSans
								TextButton.Text = ""
								TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
								TextButton.TextSize = 14.000

								local Frame = Instance.new("Frame")
								local UICorner = Instance.new("UICorner")
								local TextLabel_2 = Instance.new("TextLabel")

								Frame.Parent = TextButton
								Frame.Active = true
								Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
								Frame.BackgroundTransparency = 1
								Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
								Frame.BorderSizePixel = 0
								Frame.Size = UDim2.new(0, 110, 0, 110)

								UICorner.Parent = Frame

								TextLabel_2.Parent = Frame
								TextLabel_2.Active = true
								TextLabel_2.AnchorPoint = Vector2.new(0.5, 0.5)
								TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								TextLabel_2.BackgroundTransparency = 1.000
								TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
								TextLabel_2.BorderSizePixel = 0
								TextLabel_2.Position = UDim2.new(0.5, 0, 0.5, 0)
								TextLabel_2.Size = UDim2.new(0, 110, 0, 72)
								TextLabel_2.FontFace = Font.fromId(12187365977,Enum.FontWeight.Bold)
								TextLabel_2.Text = v.details.Name
								TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
								TextLabel_2.TextSize = 14.000
								TextLabel_2.TextWrapped = true
								TextLabel_2.TextTransparency = 1
								
								TextButton.MouseButton1Down:Connect(function()
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem",v.details.Name)
								end)

								TextButton.MouseEnter:Connect(function()
									tween(Frame,1,Enum.EasingStyle.Quart,{BackgroundTransparency = 0.45})
									tween(TextLabel_2,1,Enum.EasingStyle.Quart,{TextTransparency = 0})
								end)

								TextButton.MouseLeave:Connect(function()
									tween(TextLabel_2,0.25,Enum.EasingStyle.Quart,{TextTransparency = 1})
									repeat task.wait() until TextLabel_2.TextTransparency == 1
									tween(Frame,1,Enum.EasingStyle.Back,{BackgroundTransparency = 1})
								end)

								tween(image,1,Enum.EasingStyle.Back,{ImageTransparency = 0})

								image_uicorner.CornerRadius = UDim.new(0, 4)
								image_uicorner.Name = "image_uicorner"
								image_uicorner.Parent = image
							end

						end
					end
				end
			end)
			
			button_item_5_2. MouseButton1Down:Connect(function()
				for i,v in pairs(ScrollingFrame:GetChildren()) do
					if v:IsA("Frame") then
						v:Destroy()
					end
				end
				for i,v in pairs(Frame_4:GetChildren()) do
					if v:IsA("TextButton") then
						for i,v in pairs(v:GetChildren()) do
							if v:IsA("ImageLabel") then
								tween(v,0.1,Enum.EasingStyle.Quart,{ImageTransparency = 0.85})
								if v.Rotation == -360 then
									v.Rotation = 0
								end
							end
							tween(button_item_5_2image_6,0.1,Enum.EasingStyle.Quart,{ImageTransparency = 0})
							tween(button_item_5_2image_6,1,Enum.EasingStyle.Back,{Rotation = -360})
						end
					end
				end
				local getloadmelee = function()
					local melee = GetMeleeText()
					for i,v in pairs(melee) do
						for getnum,getreal in pairs(FightGet) do
							if getnum == v then
								local Frame_3 = Instance.new("Frame")
								local UICorner_2 = Instance.new("UICorner")

								UICorner_2.Parent = Frame_3

								Frame_3.Parent = ScrollingFrame
								Frame_3.Active = true
								Frame_3.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
								Frame_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
								Frame_3.BorderSizePixel = 0
								Frame_3.Size = UDim2.new(0, 110, 0, 110)

								local image = Instance.new("ImageLabel")
								local image_uicorner = Instance.new("UICorner")

								image.Name = "image"
								image.Parent = Frame_3
								image.AnchorPoint = Vector2.new(0.5,0.5)
								image.Position = UDim2.new(0.5, 0, 0.5, 0)
								image.BackgroundTransparency = 1
								image.Active = true
								image.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
								image.BorderSizePixel = 0
								image.Size = UDim2.new(0, 100, 0, 100)
								
								for o,oo in pairs(FightGet) do
									if o == getnum then
										for i,v in pairs(oo) do
											if i == "ID" then
												image.Image = v
											end
											if i == "ImageRectOffset" then
												image.ImageRectOffset = v
											end
											if i == "ImageRectSize" then
												image.ImageRectSize = v
											end
										end
									end
								end

								image.ImageTransparency = 1

								local TextButton = Instance.new("TextButton")

								TextButton.Parent = Frame_3
								TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								TextButton.BackgroundTransparency = 1.000
								TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
								TextButton.BorderSizePixel = 0
								TextButton.Size = UDim2.new(0, 110, 0, 110)
								TextButton.Font = Enum.Font.SourceSans
								TextButton.Text = ""
								TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
								TextButton.TextSize = 14.000

								local Frame = Instance.new("Frame")
								local UICorner = Instance.new("UICorner")
								local TextLabel_2 = Instance.new("TextLabel")

								Frame.Parent = TextButton
								Frame.Active = true
								Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
								Frame.BackgroundTransparency = 1
								Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
								Frame.BorderSizePixel = 0
								Frame.Size = UDim2.new(0, 110, 0, 110)

								UICorner.Parent = Frame

								TextLabel_2.Parent = Frame
								TextLabel_2.Active = true
								TextLabel_2.AnchorPoint = Vector2.new(0.5, 0.5)
								TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								TextLabel_2.BackgroundTransparency = 1.000
								TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
								TextLabel_2.BorderSizePixel = 0
								TextLabel_2.Position = UDim2.new(0.5, 0, 0.5, 0)
								TextLabel_2.Size = UDim2.new(0, 110, 0, 72)
								TextLabel_2.FontFace = Font.fromId(12187365977,Enum.FontWeight.Bold)
								TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
								TextLabel_2.TextSize = 14.000
								TextLabel_2.TextWrapped = true
								TextLabel_2.TextTransparency = 1
								TextLabel_2.Text = getnum

								TextButton.MouseEnter:Connect(function()
									tween(Frame,1,Enum.EasingStyle.Quart,{BackgroundTransparency = 0.45})
									tween(TextLabel_2,1,Enum.EasingStyle.Quart,{TextTransparency = 0})
								end)

								TextButton.MouseLeave:Connect(function()
									tween(TextLabel_2,0.25,Enum.EasingStyle.Quart,{TextTransparency = 1})
									repeat task.wait() until TextLabel_2.TextTransparency == 1
									tween(Frame,1,Enum.EasingStyle.Back,{BackgroundTransparency = 1})
								end)

								tween(image,1,Enum.EasingStyle.Back,{ImageTransparency = 0})

								image_uicorner.CornerRadius = UDim.new(0, 4)
								image_uicorner.Name = "image_uicorner"
								image_uicorner.Parent = image
							end
						end
					end
				end
				getloadmelee()
			end)
			
			local statusframe = Instance.new("Frame")
			local statustopic = Instance.new("TextLabel")
			local statusicon = Instance.new("ImageLabel")
			local button_itemimagegradient = Instance.new("UIGradient")
			local statusinner = Instance.new("Frame")
			local statusinneruilist = Instance.new("UIListLayout")
			local name = Instance.new("TextLabel")
			local beli = Instance.new("TextLabel")
			local fragment = Instance.new("TextLabel")
			local bounty = Instance.new("TextLabel")
			local race = Instance.new("TextLabel")
			local devilfruit = Instance.new("TextLabel")

			statusframe.Name = "statusframe"
			statusframe.Parent = page
			statusframe.Active = true
			statusframe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			statusframe.BackgroundTransparency = 1.000
			statusframe.BorderColor3 = Color3.fromRGB(0, 0, 0)
			statusframe.BorderSizePixel = 0
			statusframe.Size = UDim2.new(0, 601, 0, 229)

			statustopic.Name = "status.topic"
			statustopic.Parent = statusframe
			statustopic.Active = true
			statustopic.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			statustopic.BackgroundTransparency = 1.000
			statustopic.BorderColor3 = Color3.fromRGB(0, 0, 0)
			statustopic.BorderSizePixel = 0
			statustopic.Position = UDim2.new(0.00831946731, 0, 0, 0)
			statustopic.Size = UDim2.new(0, 596, 0, 26)
			statustopic.FontFace = Font.fromId(12187365977,Enum.FontWeight.Bold)
			statustopic.Text = "STATUS "
			statustopic.TextColor3 = Color3.fromRGB(255, 255, 255)
			statustopic.TextSize = 20.000
			statustopic.TextWrapped = true
			statustopic.TextXAlignment = Enum.TextXAlignment.Left

			statusicon.Name = "status.icon"
			statusicon.Parent = statustopic
			statusicon.Active = true
			statusicon.AnchorPoint = Vector2.new(0.5, 0.5)
			statusicon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			statusicon.BackgroundTransparency = 1.000
			statusicon.BorderColor3 = Color3.fromRGB(0, 0, 0)
			statusicon.BorderSizePixel = 0
			statusicon.Position = UDim2.new(0.13624163, 0, 0.5, 0)
			statusicon.Size = UDim2.new(0, 20, 0, 20)
			statusicon.Image = "rbxassetid://15052134223"

			button_itemimagegradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 196, 57)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 127))}
			button_itemimagegradient.Name = "button_item.image.gradient"
			button_itemimagegradient.Parent = statusicon

			statusinner.Name = "statusinner"
			statusinner.Parent = statusframe
			statusinner.Active = true
			statusinner.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			statusinner.BackgroundTransparency = 1.000
			statusinner.BorderColor3 = Color3.fromRGB(0, 0, 0)
			statusinner.BorderSizePixel = 0
			statusinner.Position = UDim2.new(0.00831946731, 0, 0.139737993, 0)
			statusinner.Size = UDim2.new(0, 593, 0, 190)

			statusinneruilist.Name = "statusinner.uilist"
			statusinneruilist.Parent = statusinner
			statusinneruilist.SortOrder = Enum.SortOrder.LayoutOrder

			name.Name = "name"
			name.Parent = statusinner
			name.Active = true
			name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			name.BackgroundTransparency = 1.000
			name.BorderColor3 = Color3.fromRGB(0, 0, 0)
			name.BorderSizePixel = 0
			name.Size = UDim2.new(0, 593, 0, 25)
			name.FontFace = Font.fromId(12187365977,Enum.FontWeight.Bold)
			name.Text = 'Name :  <font color="rgb(255, 196, 57)">'..game:GetService("Players").LocalPlayer.Name .." ("..game:GetService("Players").LocalPlayer.DisplayName..")</font>"
			name.TextColor3 = Color3.fromRGB(255, 255, 255)
			name.TextSize = 14.000
			name.TextWrapped = true
			name.TextXAlignment = Enum.TextXAlignment.Left
			name.RichText = true

			beli.Name = "beli"
			beli.Parent = statusinner
			beli.Active = true
			beli.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			beli.BackgroundTransparency = 1.000
			beli.BorderColor3 = Color3.fromRGB(0, 0, 0)
			beli.BorderSizePixel = 0
			beli.Size = UDim2.new(0, 593, 0, 25)
			beli.FontFace = Font.fromId(12187365977,Enum.FontWeight.Bold)
			beli.Text = "Beli :"
			beli.TextColor3 = Color3.fromRGB(255, 255, 255)
			beli.TextSize = 14.000
			beli.TextWrapped = true
			beli.TextXAlignment = Enum.TextXAlignment.Left
			beli.RichText = true

			fragment.Name = "fragment"
			fragment.Parent = statusinner
			fragment.Active = true
			fragment.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			fragment.BackgroundTransparency = 1.000
			fragment.BorderColor3 = Color3.fromRGB(0, 0, 0)
			fragment.BorderSizePixel = 0
			fragment.Size = UDim2.new(0, 593, 0, 25)
			fragment.FontFace = Font.fromId(12187365977,Enum.FontWeight.Bold)
			fragment.Text = "Fragment :"
			fragment.TextColor3 = Color3.fromRGB(255, 255, 255)
			fragment.TextSize = 14.000
			fragment.TextWrapped = true
			fragment.TextXAlignment = Enum.TextXAlignment.Left
			fragment.RichText = true

			bounty.Name = "bounty"
			bounty.Parent = statusinner
			bounty.Active = true
			bounty.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			bounty.BackgroundTransparency = 1.000
			bounty.BorderColor3 = Color3.fromRGB(0, 0, 0)
			bounty.BorderSizePixel = 0
			bounty.Size = UDim2.new(0, 593, 0, 25)
			bounty.FontFace = Font.fromId(12187365977,Enum.FontWeight.Bold)
			bounty.Text = "Bounty :"
			bounty.TextColor3 = Color3.fromRGB(255, 255, 255)
			bounty.TextSize = 14.000
			bounty.TextWrapped = true
			bounty.TextXAlignment = Enum.TextXAlignment.Left
			bounty.RichText = true

			race.Name = "race"
			race.Parent = statusinner
			race.Active = true
			race.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			race.BackgroundTransparency = 1.000
			race.BorderColor3 = Color3.fromRGB(0, 0, 0)
			race.BorderSizePixel = 0
			race.Size = UDim2.new(0, 593, 0, 25)
			race.FontFace = Font.fromId(12187365977,Enum.FontWeight.Bold)
			race.Text = "Race :"
			race.TextColor3 = Color3.fromRGB(255, 255, 255)
			race.TextSize = 14.000
			race.TextWrapped = true
			race.TextXAlignment = Enum.TextXAlignment.Left
			race.RichText = true

			devilfruit.Name = "devilfruit"
			devilfruit.Parent = statusinner
			devilfruit.Active = true
			devilfruit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			devilfruit.BackgroundTransparency = 1.000
			devilfruit.BorderColor3 = Color3.fromRGB(0, 0, 0)
			devilfruit.BorderSizePixel = 0
			devilfruit.Size = UDim2.new(0, 593, 0, 25)
			devilfruit.FontFace = Font.fromId(12187365977,Enum.FontWeight.Bold)
			devilfruit.Text = "Devil Fruit :"
			devilfruit.TextColor3 = Color3.fromRGB(255, 255, 255)
			devilfruit.TextSize = 14.000
			devilfruit.TextWrapped = true
			devilfruit.TextXAlignment = Enum.TextXAlignment.Left
			devilfruit.RichText = true
			
			local Frame_View = Instance.new("Frame")
			local ViewportFrame = Instance.new("ViewportFrame")

			Frame_View.Parent = statusframe
			Frame_View.Active = true
			Frame_View.BackgroundColor3 = Color3.fromRGB(30,30,30)
			Frame_View.BackgroundTransparency = 1
			Frame_View.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Frame_View.BorderSizePixel = 0
			Frame_View.Position = UDim2.new(0.60565722, 0, -0.15, 0)
			Frame_View.Size = UDim2.new(0, 233, 0, 201)

			ViewportFrame.BackgroundTransparency = 0
			ViewportFrame.BackgroundColor3 = Color3.fromRGB(30,30,30)
			ViewportFrame.BorderSizePixel = 0
			ViewportFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ViewportFrame.Parent = Frame_View
			ViewportFrame.ClipsDescendants = false
			ViewportFrame.Size = UDim2.new(0, 233, 0, 201)
			
			local camera = Instance.new("Camera")
			ViewportFrame.CurrentCamera	= camera

			local luxuryimage = Instance.new("Frame")
			local FrameButton = Instance.new("TextButton")
			local UICorner = Instance.new("UICorner")
			local TextLabel = Instance.new("TextLabel")
			local TextLabel_2 = Instance.new("TextLabel")
			
			luxuryimage.Name = "luxuryimage"
			luxuryimage.Parent = statusframe
			luxuryimage.Active = true
			luxuryimage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			luxuryimage.BackgroundTransparency = 1.000
			luxuryimage.BorderColor3 = Color3.fromRGB(0, 0, 0)
			luxuryimage.BorderSizePixel = 0
			luxuryimage.Position = UDim2.new(0, 0, 0.8125, 0)
			luxuryimage.Size = UDim2.new(0, 601, 0, 148)

			FrameButton.Parent = luxuryimage
			FrameButton.Active = true
			FrameButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
			FrameButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
			FrameButton.BorderSizePixel = 0
			FrameButton.Position = UDim2.new(0, 0, 0.115000002, 0)
			FrameButton.Size = UDim2.new(0, 270, 0, 45)
			FrameButton.AutoButtonColor = false
			FrameButton.Text = ""
			FrameButton.ClipsDescendants = true
			
			FrameButton.MouseButton1Down:Connect(function()
				CircleAnim("Circle",FrameButton,Color3.fromRGB(255,255,255),Color3.fromRGB(255,255,255))
				setclipboard(tostring(game.JobId))
			end)

			UICorner.Parent = FrameButton

			TextLabel.Parent = FrameButton
			TextLabel.Active = true
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel.BorderSizePixel = 0
			TextLabel.Position = UDim2.new(0.0370370373, 0, 0.13333334, 0)
			TextLabel.Size = UDim2.new(0, 236, 0, 16)
			TextLabel.FontFace = Font.fromId(12187365977,Enum.FontWeight.Bold)
			TextLabel.Text = "JobId"
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextSize = 14.000
			TextLabel.TextWrapped = true
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left

			TextLabel_2.Parent = FrameButton
			TextLabel_2.Active = true
			TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel_2.BackgroundTransparency = 1.000
			TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel_2.BorderSizePixel = 0
			TextLabel_2.Position = UDim2.new(0.0370370373, 0, 0.48888889, 0)
			TextLabel_2.Size = UDim2.new(0, 236, 0, 16)
			TextLabel_2.FontFace = Font.fromId(12187365977,Enum.FontWeight.Bold)
			TextLabel_2.Text = game.JobId
			TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel_2.TextSize = 14.000
			TextLabel_2.TextTransparency = 0.450
			TextLabel_2.TextWrapped = true
			TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left
			
			local TextButton = Instance.new("TextButton")
			local UICorner = Instance.new("UICorner")
			local TextButton_2 = Instance.new("TextButton")
			local UICorner_2 = Instance.new("UICorner")

			TextButton.Parent = luxuryimage
			TextButton.BackgroundColor3 = Color3.fromRGB(255, 196, 57)
			TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextButton.BorderSizePixel = 0
			TextButton.Position = UDim2.new(0, 0, 0.5, 0)
			TextButton.Size = UDim2.new(0, 270, 0, 20)
			TextButton.FontFace = Font.fromId(12187365977,Enum.FontWeight.Bold)
			TextButton.Text = "Server Hop"
			TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
			TextButton.TextSize = 12.000
			TextButton.AutoButtonColor = false
			TextButton.ClipsDescendants = true
			
			local joinid = function()
				local Frame = Instance.new("Frame")
				local UICorner = Instance.new("UICorner")
				local Frame_2 = Instance.new("Frame")
				local TextButton = Instance.new("TextButton")
				local ImageLabel = Instance.new("ImageLabel")
				local TextLabel = Instance.new("TextLabel")
				local TextBox = Instance.new("TextBox")

				Frame.Parent = luxuryimage
				Frame.Active = true
				Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
				Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Frame.BorderSizePixel = 0
				Frame.Position = UDim2.new(0.469217956, 0, 0.114864863, 0)
				Frame.Size = UDim2.new(0, 316, 0, 45)

				UICorner.Parent = Frame

				Frame_2.Parent = Frame
				Frame_2.Active = true
				Frame_2.AnchorPoint = Vector2.new(0.5, 0.5)
				Frame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Frame_2.BackgroundTransparency = 1.000
				Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Frame_2.BorderSizePixel = 0
				Frame_2.Position = UDim2.new(0.980000019, 0, 0.5, 0)
				Frame_2.Size = UDim2.new(0, 48, 0, 45)

				TextButton.Parent = Frame_2
				TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextButton.BackgroundTransparency = 1.000
				TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextButton.BorderSizePixel = 0
				TextButton.Size = UDim2.new(0, 48, 0, 45)
				TextButton.Font = Enum.Font.SourceSans
				TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
				TextButton.TextSize = 14.000
				TextButton.TextTransparency = 1.000

				ImageLabel.Parent = TextButton
				ImageLabel.Active = true
				ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
				ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ImageLabel.BackgroundTransparency = 1.000
				ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ImageLabel.BorderSizePixel = 0
				ImageLabel.Position = UDim2.new(0.25, 0, 0.5, 0)
				ImageLabel.Size = UDim2.new(0, 25, 0, 25)
				ImageLabel.Image = "rbxassetid://15055117627"

				TextLabel.Parent = Frame
				TextLabel.Active = true
				TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel.BackgroundTransparency = 1.000
				TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextLabel.BorderSizePixel = 0
				TextLabel.Position = UDim2.new(0.0338723883, 0, 0.13333334, 0)
				TextLabel.Size = UDim2.new(0, 267, 0, 16)
				TextLabel.FontFace = Font.fromId(12187365977,Enum.FontWeight.Bold)
				TextLabel.Text = "Join JobId"
				TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel.TextSize = 14.000
				TextLabel.TextWrapped = true
				TextLabel.TextXAlignment = Enum.TextXAlignment.Left

				TextBox.Parent = Frame
				TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextBox.BackgroundTransparency = 1.000
				TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextBox.BorderSizePixel = 0
				TextBox.Position = UDim2.new(0.0338721946, 0, 0.48888889, 0)
				TextBox.Size = UDim2.new(0, 267, 0, 16)
				TextBox.FontFace = Font.fromId(12187365977,Enum.FontWeight.Bold)
				TextBox.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
				TextBox.PlaceholderText = "Insert Job Id . . ."
				TextBox.Text = ""
				TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextBox.TextSize = 12.000
				TextBox.TextTransparency = 0.450
				TextBox.TextWrapped = true
				TextBox.TextXAlignment = Enum.TextXAlignment.Left
				
				TextBox.FocusLost:Connect(function()
					if #TextBox.Text > 0 then
						TextBox.Text = TextBox.Text
					end
				end)

				TextButton.MouseButton1Down:Connect(function()
					game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,TextBox.Text,game.Players.LocalPlayer)
				end)
			end
			joinid()
			
			local Framestatus = Instance.new("Frame")
			local UICornerFramestatus = Instance.new("UICorner")
			local TextLabelFramestatus = Instance.new("TextLabel")
			local TextLabelFramestatusImageLabel = Instance.new("ImageLabel")
			local FramestatusTextLabel_2 = Instance.new("TextLabel")

			Framestatus.Parent = luxuryimage
			Framestatus.Active = true
			Framestatus.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
			Framestatus.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Framestatus.BorderSizePixel = 0
			Framestatus.Position = UDim2.new(0.469000041, 0, 0.5, 0)
			Framestatus.Size = UDim2.new(0, 316, 0, 49)

			UICornerFramestatus.Parent = Framestatus

			TextLabelFramestatus.Parent = Framestatus
			TextLabelFramestatus.Active = true
			TextLabelFramestatus.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabelFramestatus.BackgroundTransparency = 1.000
			TextLabelFramestatus.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabelFramestatus.BorderSizePixel = 0
			TextLabelFramestatus.Position = UDim2.new(0.163619801, 0, 0.133333161, 0)
			TextLabelFramestatus.Size = UDim2.new(0, 253, 0, 16)
			TextLabelFramestatus.FontFace = Font.fromId(12187365977,Enum.FontWeight.Bold)
			TextLabelFramestatus.Text = "Status"
			TextLabelFramestatus.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabelFramestatus.TextSize = 14.000
			TextLabelFramestatus.TextWrapped = true
			TextLabelFramestatus.TextXAlignment = Enum.TextXAlignment.Left

			TextLabelFramestatusImageLabel.Parent = Framestatus
			TextLabelFramestatusImageLabel.Active = true
			TextLabelFramestatusImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
			TextLabelFramestatusImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabelFramestatusImageLabel.BackgroundTransparency = 1.000
			TextLabelFramestatusImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabelFramestatusImageLabel.BorderSizePixel = 0
			TextLabelFramestatusImageLabel.Position = UDim2.new(0.0886075944, 0, 0.5, 0)
			TextLabelFramestatusImageLabel.Size = UDim2.new(0, 35, 0, 35)
			TextLabelFramestatusImageLabel.Image = "http://www.roblox.com/asset/?id=12095230917"

			FramestatusTextLabel_2.Parent = Framestatus
			FramestatusTextLabel_2.Active = true
			FramestatusTextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			FramestatusTextLabel_2.BackgroundTransparency = 1.000
			FramestatusTextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			FramestatusTextLabel_2.BorderSizePixel = 0
			FramestatusTextLabel_2.Position = UDim2.new(0.163619801, 0, 0.521088243, 0)
			FramestatusTextLabel_2.Size = UDim2.new(0, 253, 0, 16)
			FramestatusTextLabel_2.FontFace = Font.fromId(12187365977)
			FramestatusTextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
			FramestatusTextLabel_2.TextSize = 14.000
			FramestatusTextLabel_2.TextTransparency = 0.450
			FramestatusTextLabel_2.TextWrapped = true
			FramestatusTextLabel_2.Text = ""
			FramestatusTextLabel_2.TextXAlignment = Enum.TextXAlignment.Left
			
			local serverhop = function()
				repeat task.wait()
					pcall(function()
						game:GetService("Players")["LocalPlayer"].PlayerGui.ServerBrowser.Enabled = true
						task.wait(0.5)
					end)
				until game:GetService("Players")["LocalPlayer"].PlayerGui.ServerBrowser.Frame.FakeScroll.Inside:FindFirstChild("Template")
				local ErrorFrame = 0
				repeat task.wait()
					local ScrFrane = game:GetService("Players")["LocalPlayer"].PlayerGui.ServerBrowser.Frame.ScrollingFrame
					ScrFrane.CanvasPosition = Vector2.new(0,300)
					ErrorFrame = ErrorFrame + 1
				until ScrFrane.CanvasPosition == Vector2.new(0,300) or ErrorFrame >= 6
				while task.wait(0.1) do
					pcall(function()
						local me = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
						me.CFrame = CFrame.new(me.Position.X,5000,me.Position.Z)
						for i,v in pairs(game:GetService("Players")["LocalPlayer"].PlayerGui.ServerBrowser.Frame.FakeScroll.Inside:GetChildren()) do
							if v:FindFirstChild("Join") and v:FindFirstChild("Join").Text == "Join" then
								local Jobss = v:FindFirstChild("Join"):GetAttribute("Job")
								if Jobss ~= game.JobId and Jobss ~= "1234567890123" then
									local args = {
										[1] = "teleport",
										[2] = Jobss
									}

									game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer(unpack(args))
									task.wait()
								end
							end
						end
						task.wait()
						local ScrFrane = game:GetService("Players")["LocalPlayer"].PlayerGui.ServerBrowser.Frame.ScrollingFrame
						ScrFrane.CanvasPosition = Vector2.new(0,ScrFrane.CanvasPosition.Y + 260)
					end)
				end
			end

			TextButton.MouseButton1Down:Connect(function()
				CircleAnim("Circle",TextButton,Color3.fromRGB(255,255,255),Color3.fromRGB(255,255,255))
				serverhop()
			end)

			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = TextButton

			TextButton_2.Parent = luxuryimage
			TextButton_2.BackgroundColor3 = Color3.fromRGB(255, 196, 57)
			TextButton_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextButton_2.BorderSizePixel = 0
			TextButton_2.Position = UDim2.new(0, 0, 0.695945919, 0)
			TextButton_2.Size = UDim2.new(0, 270, 0, 20)
			TextButton_2.FontFace = Font.fromId(12187365977,Enum.FontWeight.Bold)
			TextButton_2.Text = "Rejoin"
			TextButton_2.TextColor3 = Color3.fromRGB(0, 0, 0)
			TextButton_2.TextSize = 12.000
			TextButton_2.AutoButtonColor = false
			TextButton_2.ClipsDescendants = true

			TextButton_2.MouseButton1Down:Connect(function()
				CircleAnim("Circle",TextButton_2,Color3.fromRGB(255,255,255),Color3.fromRGB(255,255,255))
				local ts = game:GetService("TeleportService")
				local p = game:GetService("Players").LocalPlayer
				ts:TeleportToPlaceInstance(game.PlaceId,game.JobId, p)
			end)

			UICorner_2.CornerRadius = UDim.new(0, 4)
			UICorner_2.Parent = TextButton_2

			local ValidClasses = {
				["MeshPart"] = true; ["Part"] = true; ["Accoutrement"] = true;
				["Pants"] = true; ["Shirt"] = true;
				["Humanoid"] = true;
			}

			local RenderObjects = table.create(25)

			local function RemoveObject(Object)
				local Clone = RenderObjects[Object]
				if not Clone then return nil end

				RenderObjects[Object] = nil
				if Clone.Parent:IsA("Accoutrement") then
					Clone.Parent:Destroy()
				else
					Clone:Destroy()
				end
			end

			local function AddObject(Object)
				if not ValidClasses[Object.ClassName] then
					return nil
				end
				local a = Object.Archivable
				Object.Archivable = true
				local RenderClone = Object:Clone()
				Object.Archivable = a
				if Object.ClassName == "MeshPart" or Object.ClassName == "Part" then
					RenderObjects[Object] = RenderClone
				elseif Object:IsA("Accoutrement") then
					RenderObjects[Object.Handle] = RenderClone.Handle

				elseif Object.ClassName == "Humanoid" then
					RenderClone:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)
					RenderClone:SetStateEnabled(Enum.HumanoidStateType.Running,false)
					RenderClone:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,false)
					RenderClone:SetStateEnabled(Enum.HumanoidStateType.Climbing,false)
					RenderClone:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,false)
					RenderClone:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)
					RenderClone:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false)
					RenderClone:SetStateEnabled(Enum.HumanoidStateType.Jumping,false)
					RenderClone:SetStateEnabled(Enum.HumanoidStateType.Landed,false)
					RenderClone:SetStateEnabled(Enum.HumanoidStateType.Flying,false)
					RenderClone:SetStateEnabled(Enum.HumanoidStateType.Freefall,false)
					RenderClone:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
					RenderClone:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,false)
					RenderClone:SetStateEnabled(Enum.HumanoidStateType.Dead,false)
					RenderClone:SetStateEnabled(Enum.HumanoidStateType.Swimming,false)
					RenderClone:SetStateEnabled(Enum.HumanoidStateType.Physics,false)
					RenderClone.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
				end
				return RenderClone
			end

			local GetAwakened = function()
				local TableRe = {}
				if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AwakeningChanger","Check") == true then
					local AwakenedMoves = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getAwakenedAbilities")
					if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getAwakenedAbilities") and AwakenedMoves then
						if not AwakenedMoves["V"] then return true end 
						for i,v in pairs(AwakenedMoves) do 
							if v["Awakened"] == true then
								table.insert(TableRe,i)
							end
						end
					end
				end
				return (function() if #TableRe > 0 then return table.concat(TableRe," ,") else return "" end end)()
			end

			game:GetService("RunService").RenderStepped:Connect(function()
				if (not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")) or (not ViewportFrame.Visible) then
					return nil
				end

				camera.CFrame = CFrame.new(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame:ToWorldSpace(CFrame.new(0,2.5,-7)).Position, game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position)

				for Original, Clone in pairs(RenderObjects) do
					if Original and Original.Parent then
						Clone.CFrame = Original.CFrame
					else
						RemoveObject(Original)
					end
				end
				Frame_2sss.CanvasSize = UDim2.new(0, 0, 0,UIListLayoutsss.AbsoluteContentSize.Y + 10)
				Frame_3sss.CanvasSize = UDim2.new(0, 0, 0,UIListLayout3sss.AbsoluteContentSize.Y + 10)
			end)

			task.spawn(function()
				while task.wait() do
					pcall(function()
						ScrollingFrame.CanvasSize = UDim2.new(0,UIListLayout.AbsoluteContentSize.X + 10,0,0)
						beli.Text = 'Beli :  <font color="rgb(85, 255, 127)">'..formatCommas(game:GetService("Players").LocalPlayer.Data.Beli.Value).."</font>"
						fragment.Text = 'Fragment :  <font color="rgb(170, 85, 255)">'..formatCommas(game:GetService("Players").LocalPlayer.Data.Fragments.Value).."</font>"
						bounty.Text = 'Bounty :  <font color="rgb(255, 42, 35)">'..formatCommas(game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value).."</font>"
						race.Text = 'Race :  <font color="rgb(255, 196, 57)">'..game:GetService("Players").LocalPlayer.Data.Race.Value.."</font>"
						devilfruit.Text = 'Devil Fruit :  <font color="rgb(255, 196, 57)">'..game:GetService("Players").LocalPlayer.Data.DevilFruit.Value..'</font> <font color="rgb(255, 255, 255)"> ('..GetAwakened()..")</font>"
					end)
				end
			end)

			local function HandleChar()
				table.clear(RenderObjects)
				ViewportFrame:ClearAllChildren()

				local Viewmodel = Instance.new("Model")
				Viewmodel.Name = "PlayerViewmodel"
				Viewmodel.Parent = ViewportFrame

				local CharObjects = game:GetService("Players").LocalPlayer.Character:GetDescendants()
				for i, Object in pairs(CharObjects) do
					local RenderClone = AddObject(Object)
					if RenderClone then
						RenderClone.Parent = Viewmodel
					end
				end

				game:GetService("Players").LocalPlayer.Character.DescendantAdded:Connect(function(NewObject)
					local RenderClone = AddObject(NewObject)
					if RenderClone then
						RenderClone.Parent = Viewmodel
					end
				end)
				game:GetService("Players").LocalPlayer.Character.DescendantRemoving:Connect(function(OldObject)
					RemoveObject(OldObject)
				end)
			end

			game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(NewCharacter)
				wait(0.25)
				game:GetService("Players").LocalPlayer.Character = NewCharacter

				HandleChar()
			end)

			HandleChar()
			
			local statusdoing = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local statusdoingicon = Instance.new("ImageLabel")
			local statusdoingdoingtext = Instance.new("TextLabel")

			statusdoing.Name = "statusdoing"
			statusdoing.Parent = luxuryui
			statusdoing.Active = true
			statusdoing.AnchorPoint = Vector2.new(0.5, 0.5)
			statusdoing.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
			statusdoing.BorderColor3 = Color3.fromRGB(0, 0, 0)
			statusdoing.BorderSizePixel = 0
			statusdoing.ClipsDescendants = true
			statusdoing.Position = UDim2.new(0.5, 0, 0.0799999982, 0)
			statusdoing.Size = UDim2.new(0, 0, 0, 0)

			UICorner.Parent = statusdoing
			UICorner.CornerRadius = UDim.new(0, 300)

			statusdoingicon.Name = "statusdoingicon"
			statusdoingicon.Parent = statusdoing
			statusdoingicon.Active = true
			statusdoingicon.AnchorPoint = Vector2.new(0.5, 0.5)
			statusdoingicon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			statusdoingicon.BackgroundTransparency = 1.000
			statusdoingicon.BorderColor3 = Color3.fromRGB(0, 0, 0)
			statusdoingicon.BorderSizePixel = 0
			statusdoingicon.Position = UDim2.new(0.5, 0, 0.286666662, 0)
			statusdoingicon.Size = UDim2.new(0, 35, 0, 35)
			statusdoingicon.Image = "http://www.roblox.com/asset/?id=12095230917"

			statusdoingdoingtext.Name = "statusdoingdoingtext"
			statusdoingdoingtext.Parent = statusdoing
			statusdoingdoingtext.Active = true
			statusdoingdoingtext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			statusdoingdoingtext.BackgroundTransparency = 1.000
			statusdoingdoingtext.BorderColor3 = Color3.fromRGB(0, 0, 0)
			statusdoingdoingtext.BorderSizePixel = 0
			statusdoingdoingtext.Position = UDim2.new(0.0686830953, 0, 0.507754982, 0)
			statusdoingdoingtext.Size = UDim2.new(0, 272, 0, 26)
			statusdoingdoingtext.FontFace = Font.fromId(12187365977,Enum.FontWeight.Bold)
			statusdoingdoingtext.Text = ""
			statusdoingdoingtext.TextColor3 = Color3.fromRGB(255, 255, 255)
			statusdoingdoingtext.TextSize = 14.000
			statusdoingdoingtext.TextTransparency = 0.450
			statusdoingdoingtext.TextWrapped = true
			
			luxurylibrary.change = function(args)
				statusdoingdoingtext.Text = args
				FramestatusTextLabel_2.Text = args
			end
			
			local Icon = require(game:GetService("ReplicatedStorage").Icon)
			local Theme = require(game:GetService("ReplicatedStorage").Icon.Themes)
			local IconController = require(game:GetService("ReplicatedStorage").Icon.IconController)
			
			local topbarplus = function()
				
				for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.TopbarPlus.TopbarContainer:GetChildren()) do
					if v.Name == "luxury" then
						v:Destroy()
					end
				end
				
				Icon.new()
					:setName("luxury")
					:setImage(12095230917)
					:setLabel("Luxury Pita")
					:setTip("Open Ui Luxury Pita (Kaitun)")
					:bindToggleKey(Enum.KeyCode.Delete)
					:setProperty("deselectWhenOtherIconSelected", false)
					:set("iconFont", Enum.Font.GothamSemibold)
					:setRight()
					:bindEvent("selected", function(icon)
						mainframe.Visible = false
						tween(statusdoing,0.5,Enum.EasingStyle.Back,{Size = UDim2.new(0, 316, 0, 75)})
					end)
					:bindEvent("deselected", function(icon)
						mainframe.Visible = true
						tween(statusdoing,0.5,Enum.EasingStyle.Quart,{Size = UDim2.new(0, 0, 0, 0)})
					end)
			end
			topbarplus()
			return luxuryadded
		end
	else
		warn("")
	end
end

return luxurylibrary
