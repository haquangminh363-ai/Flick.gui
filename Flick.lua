local Power = 120
local Delay = 0.001
local On = false

local gui = Instance.new("ScreenGui", game.CoreGui)
local btn = Instance.new("TextButton", gui)

btn.Size = UDim2.new(0,120,0,50)
btn.Position = UDim2.new(0.8,0,0.1,0)
btn.Text = "OFF"
btn.BackgroundColor3 = Color3.fromRGB(255,0,0)
btn.Active = true
btn.Draggable = true

btn.MouseButton1Click:Connect(function()
    On = not On
    btn.Text = On and "ON" or "OFF"
    btn.BackgroundColor3 = On and Color3.fromRGB(0,255,0) or Color3.fromRGB(255,0,0)
end)

task.spawn(function()
    local cam = workspace.CurrentCamera
    while true do
        if On then
            cam.CFrame = cam.CFrame * CFrame.Angles(0, math.rad(Power), 0)
            task.wait(Delay)
            cam.CFrame = cam.CFrame * CFrame.Angles(0, math.rad(-Power), 0)
        end
        task.wait(Delay)
    end
end)
