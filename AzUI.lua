AzUI = {}

local function AzUI_OnMouseWheel(self, delta)
    if delta > 0 then
        if MinimapZoomIn:IsEnabled() then
            Minimap_ZoomInClick()
        end
    elseif delta < 0 then
        if MinimapZoomOut:IsEnabled() then
            Minimap_ZoomOutClick()
        end
    end
end

local function AzUI_EventHandler(self, event, arg, ...)

	if event == 'PLAYER_LOGIN' then
		-- Power bar

		PlayerPowerBarAlt:SetMovable(true)
		PlayerPowerBarAlt:SetUserPlaced(true)
		PlayerPowerBarAlt:SetDontSavePosition(true)
		PlayerPowerBarAlt:ClearAllPoints()
		PlayerPowerBarAlt:SetPoint('BOTTOM', UIParent, 'BOTTOM', 250, 130)
		PlayerPowerBarAlt:Show()

		-- Extra action button

		ExtraActionBarFrame:SetMovable(true)
		ExtraActionBarFrame:SetUserPlaced(true)
		ExtraActionBarFrame:SetDontSavePosition(true)
		ExtraActionBarFrame:ClearAllPoints()
		ExtraActionBarFrame:SetPoint('BOTTOM', UIParent, 'BOTTOM', 250, 195)

		-- Zone action button

		ZoneAbilityFrame:SetMovable(true)
		ZoneAbilityFrame:SetUserPlaced(true)
		ZoneAbilityFrame:SetDontSavePosition(true)
		ZoneAbilityFrame:ClearAllPoints()
		ZoneAbilityFrame:SetPoint('BOTTOM', UIParent, 'BOTTOM', 250, 255)

		-- Vehicle leave button

		hooksecurefunc('MainMenuBarVehicleLeaveButton_Update', function()
			MainMenuBarVehicleLeaveButton:ClearAllPoints()
			MainMenuBarVehicleLeaveButton:SetPoint('LEFT', ActionButton6, 'RIGHT', 28, 0)
		end)

		-- Increase max camera zoom

		SetCVar("cameraDistanceMaxZoomFactor", 2.6)
	end

	if event == 'ADDON_LOADED' and arg == 'AzUI' then
		-- Minimap

		MinimapZoomIn:Hide()
	    MinimapZoomOut:Hide()

	    Minimap:EnableMouseWheel(true)
		Minimap:SetScript('OnMouseWheel', AzUI_OnMouseWheel)

		MinimapCluster:SetScale(1.15)

		-- Stance bar

		local hiddenFrame = CreateFrame('Frame')
		hiddenFrame:Hide()
		UIPARENT_MANAGED_FRAME_POSITIONS['StanceBarFrame'] = nil
		StanceBarFrame:SetParent(hiddenFrame)

	    -- Main action bar

		MainMenuBar:SetFrameStrata('BACKGROUND')
		MainMenuBarArtFrameBackground:Hide()
	    MainMenuBarArtFrame.LeftEndCap:Hide()
	    MainMenuBarArtFrame.RightEndCap:Hide()
	    MainMenuBarArtFrame.PageNumber:Hide()
		MainMenuBarArtFrame:SetFrameStrata('BACKGROUND')
	    ActionBarUpButton:Hide()
	    ActionBarDownButton:Hide()

	    ActionButton1:ClearAllPoints()
	    ActionButton1:SetPoint('BOTTOMLEFT', UIParent, 'BOTTOM', -(3 * (36 + 6)) + 4.5, (3 * (36 + 6)) + 1)

	    ActionButton7:ClearAllPoints()
	    ActionButton7:SetPoint('BOTTOMLEFT', UIParent, 'BOTTOM', -(3 * (36 + 6)) + 4.5, (2 * (36 + 6)) + 1)

	    ActionButton7:ClearAllPoints()
	    ActionButton7:SetPoint('BOTTOMLEFT', UIParent, 'BOTTOM', -(3 * (36 + 6)) + 4.5, (2 * (36 + 6)) + 1)

		UIPARENT_MANAGED_FRAME_POSITIONS['MainMenuBar'] = nil
		
		-- Bottom left action bar

		MultiBarBottomLeftButton1:ClearAllPoints()
	    MultiBarBottomLeftButton1:SetPoint('BOTTOMLEFT', UIParent, 'BOTTOM', -(3 * (36 + 6)) + 4.5, (1 * (36 + 6)) + 1)

	    MultiBarBottomLeftButton7:ClearAllPoints()
	    MultiBarBottomLeftButton7:SetPoint('BOTTOMLEFT', UIParent, 'BOTTOM', -(3 * (36 + 6)) + 4.5, (0 * (36 + 6)) + 1)

		UIPARENT_MANAGED_FRAME_POSITIONS['MultiBarBottomLeft'] = nil

	    -- Bottom right action bar

		for i = 2, 12 do
			_G['MultiBarBottomRightButton' .. i]:ClearAllPoints()
			_G['MultiBarBottomRightButton' .. i]:SetPoint('LEFT', _G['MultiBarBottomRightButton' .. (i - 1)], 'RIGHT', 6, 0)
		end

		MultiBarBottomRightButton1:ClearAllPoints()
	    MultiBarBottomRightButton1:SetPoint('BOTTOMLEFT', UIParent, 'BOTTOM', -(7.5 * (36 + 6)) + 4.5, (2 * (36 + 6)) + 1)

	    MultiBarBottomRightButton5:ClearAllPoints()
	    MultiBarBottomRightButton5:SetPoint('BOTTOMLEFT', UIParent, 'BOTTOM', -(7.5 * (36 + 6)) + 4.5, (1 * (36 + 6)) + 1)

	    MultiBarBottomRightButton9:ClearAllPoints()
	    MultiBarBottomRightButton9:SetPoint('BOTTOMLEFT', UIParent, 'BOTTOM', -(7.5 * (36 + 6)) + 4.5, (0 * (36 + 6)) + 1)

		UIPARENT_MANAGED_FRAME_POSITIONS['MultiBarBottomRight'] = nil

	    -- Right 2 action bar

	    local newBar = CreateFrame('Frame', 'AzUI_ActionBar', UIParent, 'VerticalMultiBar4')

	    newBar:Show()

		for i = 2, 12 do
			_G['AzUI_ActionBarButton' .. i]:ClearAllPoints()
			_G['AzUI_ActionBarButton' .. i]:SetPoint('LEFT', _G['AzUI_ActionBarButton' .. (i - 1)], 'RIGHT', 6, 0)
		end

		AzUI_ActionBarButton1:ClearAllPoints()
		AzUI_ActionBarButton1:SetPoint('BOTTOMLEFT', UIParent, 'BOTTOM', (3.5 * (36 + 6)) + 4.5, (2 * (36 + 6)) + 1)

		AzUI_ActionBarButton5:ClearAllPoints()
		AzUI_ActionBarButton5:SetPoint('BOTTOMLEFT', UIParent, 'BOTTOM', (3.5 * (36 + 6)) + 4.5, (1 * (36 + 6)) + 1)

		AzUI_ActionBarButton9:ClearAllPoints()
		AzUI_ActionBarButton9:SetPoint('BOTTOMLEFT', UIParent, 'BOTTOM', (3.5 * (36 + 6)) + 4.5, (0 * (36 + 6)) + 1)

		--VIEWABLE_ACTION_BAR_PAGES[LEFT_ACTIONBAR_PAGE] = nil
	    --hooksecurefunc('MultiActionBar_Update', function() MultiBarLeft:Show() end)

		-- Pet bar

		--PetActionBarFrame:Hide()
		--PetActionBarFrame:SetParent(hiddenFrame)
		SlidingActionBarTexture0:SetTexture(nil)
		SlidingActionBarTexture1:SetTexture(nil)

		UIPARENT_MANAGED_FRAME_POSITIONS['PETACTIONBAR_YPOS'] = nil

		for i = 2, 10 do
			_G['PetActionButton' .. i]:ClearAllPoints()
			_G['PetActionButton' .. i]:SetPoint('LEFT', _G['PetActionButton' .. (i - 1)], 'RIGHT', 6, 0)
		end

		PetActionButton6:ClearAllPoints()
		PetActionButton6:SetPoint('BOTTOMLEFT', AzUI_ActionBarButton12, 'BOTTOMRIGHT', 28, 0)

		PetActionButton1:ClearAllPoints()
		PetActionButton1:SetPoint('BOTTOMLEFT', PetActionButton6, 'TOPLEFT', 0, 10)

	    -- Status tracking bar

	    StatusTrackingBarManager:Hide()

		local statusParent = CreateFrame('Frame', nil, UIParent)
		statusParent:SetSize(600, 14)
		statusParent:SetPoint('BOTTOMLEFT', UIParent, 'BOTTOMLEFT', 0, 14)

		statusParent.OnStatusBarsUpdated = function() end

		CreateFrame('FRAME', 'AzUI_StatusTrackingBarManager', statusParent, 'StatusTrackingBarManagerTemplate')

		AzUI_StatusTrackingBarManager:AddBarFromTemplate('FRAME', 'ReputationStatusBarTemplate')
		AzUI_StatusTrackingBarManager:AddBarFromTemplate('FRAME', 'HonorStatusBarTemplate')
		AzUI_StatusTrackingBarManager:AddBarFromTemplate('FRAME', 'ArtifactStatusBarTemplate')
		AzUI_StatusTrackingBarManager:AddBarFromTemplate('FRAME', 'ExpStatusBarTemplate')
		AzUI_StatusTrackingBarManager:AddBarFromTemplate('FRAME', 'AzeriteBarTemplate')

	end

end

local AzUI_EventFrame = CreateFrame('Frame')

AzUI_EventFrame:RegisterEvent('ADDON_LOADED')
AzUI_EventFrame:RegisterEvent('PLAYER_LOGIN')
AzUI_EventFrame:SetScript('OnEvent', AzUI_EventHandler)
