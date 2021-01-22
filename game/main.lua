local sw,sh = love.graphics.getDimensions()

   -- Question | 1st Choice | 2nd Choice | 3rd Choice | 4th Choice | Correct
local questions = {
	Easy = {
		{"1 + 1 =", "1", "2", "3", "4", "2"},
		{"1 + 2 =", "1", "2", "3", "4", "3"},
		{"1 + 3 =", "1", "2", "3", "4", "4"},
	},
	Normal = {
		{"4 * 8 =", "20", "28", "32", "44", "32"},
		{"6 * 9 =", "50", "56", "38", "44", "56"},
		{"7 * 4 =", "21", "20", "13", "18", "21"},
	},
	Expert = {
		{"(24 * 4) / 3 =" , "20", "26", "18", "32", "32"},
		{"(55 * 6) / 5 =" , "60", "55", "66", "31", "66"},
		{"(150 / 30) / 5 =" , "5", "2", "6", "1", "1"}
	},
	Insane = {
		{"(((71 * 7) + (32 * 8)) - 3) / 150", "4", "5", "7", "3", "3"},
		{"(((66 * 6) - (12 * 8)) + 150) / 50", "5", "9", "11", "12", "9"},
		{"((22 * 55) + (89 * 32)) / 2", "2392", "4615", "2029", "7128", "2029"}
	}
}

local difficultyTypes = {"Easy","Normal","Expert","Insane"}

local mainDifficultyX = (sw / 2) - 200	-- the X offset for the main menu
local mainDifficultyY = {sh / 4 - 50, sh / 4 + 60, sh / 4 + 170, sh / 4 + 280}	-- the Y offset for the main menu
local questionX = {(sw / 2) - 400, (sw / 2) + 10, (sw / 2) - 400, (sw / 2) + 10}	-- the X offset for the question screen
local questionY = {(sh / 4) - 40 + 100, (sh / 4) - 40 + 100, (sh / 4) - 40 + 200, (sh / 4) - 40 + 200}	-- the X offset for the question screen


local chosenDifficulty = 0
local currentQuestion = false	-- this becomes a number to use as reference
local gameState = 0

local myFont = love.graphics.newFont(40)
local fontHeight = myFont:getHeight()

function love.mousepressed(x, y, b)
	if b == 1 then
		if gameState == 0 then
			for k,v in ipairs(mainDifficultyY) do
				if (x >= mainDifficultyX and x <= mainDifficultyX + 400) and (y >= mainDifficultyY[k] and y <= mainDifficultyY[k] + 100) then
					chosenDifficulty = difficultyTypes[k]
					gameState = 1
				end
			end
		end
	end
end

function love.draw()
    love.graphics.setBackgroundColor(1, 1, 1, 1)    --sets background white
    love.graphics.setFont(myFont)
	if gameState == 0 then
		mainGUI()
	elseif gameState == 1 then
		questionGUI()
	else
	
	end
end

function mainGUI()        --defines main GUI as a function that can be called on when there is a change in gamestate
	local x, y = love.mouse.getPosition()
	for k,v in ipairs(mainDifficultyY) do
		local hovered = false
		if (x >= mainDifficultyX and x <= mainDifficultyX + 400) and (y >= mainDifficultyY[k] and y <= mainDifficultyY[k] + 100) then hovered = true end
		
		love.graphics.setColor(0,0,0,1)
		love.graphics.rectangle("fill", mainDifficultyX - 5, mainDifficultyY[k], 410, 100)
		if not hovered then
			love.graphics.setColor(0.9, 1, 0.9, 1)
		else
			love.graphics.setColor(0.4, 0.4, 1, 1)
		end
		love.graphics.rectangle("fill", mainDifficultyX, mainDifficultyY[k] + 5, 400, 90)
		love.graphics.setColor(0, 0, 0, 1)
		love.graphics.printf(difficultyTypes[k], sw / 2 - 200, (sh / 4 - fontHeight / 2) + ((k - 1) * 110), 400, "center")
	end
end

function questionGUI()
	if not currentQuestion then currentQuestion = love.math.random(1, #questions[chosenDifficulty] - 1) end
	local question = questions[chosenDifficulty][currentQuestion]
	--Question Box
	love.graphics.setColor(0, 0, 0, 1)
	love.graphics.rectangle("fill", sw / 2 - 405, sh / 4 - 45, 810, 90)
	love.graphics.setColor(0.9, 1, 0.9, 1)
	love.graphics.rectangle("fill", sw / 2 - 400, sh / 4 - 40, 800, 80)
	love.graphics.setColor(0, 0, 0, 1)
	love.graphics.printf(question[1], sw / 2 - 375, sh / 4 - fontHeight / 2, 750, "center")
	
	local x, y = love.mouse.getPosition()
	for k = 2, #question-1, 1 do
		local hovered = false
		print(x >= questionX[k-1], x <= questionX[k-1] + 400,  y >= questionX[k-1], y <= questionX[k-1] + 100)
		if (x >= questionX[k-1] and x <= questionX[k-1] + 400) and (y >= questionX[k-1] and y <= questionX[k-1] + 100) then hovered = true end
		love.graphics.setColor(0,0,0,1)
		love.graphics.rectangle("fill", questionX[k-1], questionY[k-1], 400, 90)
		love.graphics.setColor(0.9, 1, 0.9, 1)
		love.graphics.rectangle("fill", questionX[k-1] + 5, questionY[k-1] + 5, 390, 80)
		love.graphics.setColor(0,0,0,1)
		love.graphics.printf(question[k], questionX[k-1], questionY[k-1] + (45 - fontHeight / 2), 400, "center")
	end
end
