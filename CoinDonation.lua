local l__TweenService__1 = game:GetService("TweenService")
local l__VFXObjects__1 = game.ReplicatedStorage.VFXObjects
local l__RunService__2 = game:GetService("RunService")
l__VFXObjects__1.CreateVfx.OnClientEvent:Connect(function(Directions, StartPosition, TargetCharacter, Robux)
	if (Directions == "GiveCurrency") then
		--if TargetCharacter ~= game.Players.LocalPlayer.Character then
		--return;
		--end;
		local v11 = 1
		local v4 = 1
		local v5 = 1
		if Directions == "GiveCurrency" then
			if Robux >= 10000000 then
				v4 = 600
				v5 = 0.05
			elseif Robux >= 100000 then
				v4 = 300
				v5 = 0.1
			elseif Robux >= 10000 then
				v4 = 75
				v5 = 0.15
			elseif Robux >= 1000 then
				v4 = 20
				v5 = 0.25
			elseif Robux >= 100 then
				v4 = 5
				v5 = 0.5
			else
				v4 = 1
				v5 = 1
			end
		end
		--if Directions == "GiftbuxCoin" then
		--	v4 = math.clamp(math.round(Robux / 10 + 0.5) + 1, 0, 50)
		--	v5 = (v4 / 10 + 0.25) / v4
		--end
		print((math.round(v4)))
		for v6 = 1, v4 + 1 do
			local v7 = Instance.new("Attachment");
			v7.Name = "CurrencyPositionGoal";
			local v8, v9 = pcall(function()
				v7.Parent = TargetCharacter.HumanoidRootPart;
			end);
			if v8 == false then
				warn("Unable to find Humanoid (" .. v9 .. ")");
			end;
			local v10
			if Directions == "GiveCurrency" then
				v10 = l__VFXObjects__1.CurrencyCoin:Clone()
				--elseif Directions == "GiftbuxCoin" then
				--v10 = l__VFXObjects__1.GiftbuxCoin:Clone()
			end
			v10.Position = StartPosition;
			v10.AlignPosition.Position = v10.Position + Vector3.new(math.random(-10, 10), math.random(10, 20), math.random(-10, 10));
			v10.Spin.AngularVelocity = Vector3.new(0, math.random(50, 100) / 10, 0);
			v10.Parent = workspace;
			l__TweenService__1:Create(v10, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0), {
				Size = v10.Size
			}):Play();
			l__TweenService__1:Create(v10.Center.Glow, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0), {
				Brightness = 0.5
			}):Play();
			local u3 = false
			local u5 = nil
			local function u6()
				if u3 == false then
					u3 = true
					if not v7:IsDescendantOf(game) then
						v10.Trail.Enabled = false
						v10.AlignPosition.MaxVelocity = 0
						v10.AlignPosition.Responsiveness = 200
						v10.AlignPosition.Mode = Enum.PositionAlignmentMode.OneAttachment
						v10.AlignPosition.Attachment0 = v10.Center
						v10.AlignPosition.Position = v10.Position
						l__TweenService__1:Create(v10.Center.Glow, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0), {
							Brightness = 0, 
							Range = 5
						}):Play()
						l__TweenService__1:Create(v10, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0), {
							Size = Vector3.new(0, 0, 0)
						}):Play()
						wait(0.5)
						v10:Destroy()
						v7:Destroy()
						return
					end
				else
					return
				end
				v10.Position = v7.WorldPosition + Vector3.new(math.random(-2, 2), math.random(-2, 2), math.random(-2, 2))
				v10.Transparency = 1
				v10.Size = Vector3.new(0, 0, 0)
				for v11, v12 in pairs(v10:GetChildren()) do
					if v12:IsA("SurfaceGui") then
						v12.Enabled = false
					end
				end
				v10.Anchored = true
				v10.Center.Glow.Brightness = 1
				v10.Center.Glow.Range = 7.5
				l__TweenService__1:Create(v10.Center.Glow, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0), {
					Brightness = 0, 
					Range = 5
				}):Play()
				v10.Center.Ring:Emit(1)
				v10.Center.Sparkles:Emit(5)
				v10.Collect:Play()
				--if v10.Collect.PlaybackSpeed >= MaxSpeed then
				v10.Collect.PlaybackSpeed = 2
				--else
				--	v10.Collect.PlaybackSpeed = v11
				--end
				if v11 < 2 and v4 == 600 then
					v11 += 0.01
				elseif v11 > 2 and v4 == 600 then
					v11 = 2
				end

				if v11 < 1.5 and v4 == 300 then
					v11 += 0.01
				elseif v11 > 1.5 and v4 == 300 then
					v11 = 1.5
				end

				if v11 < 1.5 and v4 < 300 then
					v11 += 0.01
				elseif v11 > 1.5 and v4 < 300 then
					v11 = 1.5
				end
				wait(3)
				v10:Destroy()
				v7:Destroy()
			end
			local function u7(p2)
				if v7:IsDescendantOf(game) == false then
					u5:Disconnect()
					u6()
					return
				end
				if (v10.Center.WorldPosition - v7.WorldPosition).Magnitude < 2.5 then
					u5:Disconnect()
					u6()
				end
				v10.AlignPosition.Position = v10.AlignPosition.Position:Lerp(v7.WorldPosition, 0.5)
			end
			spawn(function()
				wait(1)
				u5 = l__RunService__2.Heartbeat:Connect(u7)
				v10.Trail.Enabled = true
				wait(10)
				if u3 == false then
					v7:Destroy()
				end
			end)
			wait(v5)
		end
	end
end)
