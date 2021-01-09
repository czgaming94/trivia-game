WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

function love.load()
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
    })

    myFont = love.graphics.newFont(40)
    fontHeight = myFont:getHeight()
    difficulty = {"Easy", "Normal", "Hard", "Insane"}

end

function love.update(dt)

end

local gameState = 0        --determines what gui is displayed 

function love.draw()

    local menu = {}
    menu.main = {}      --difficulty selection screen
    menu.question = {}      --question screen
    menu.result = {}       --result screen

    --there will be a function that switches screen depending on the gamestate

    love.graphics.setBackgroundColor(1, 1, 1, 1)    --sets background white
    love.graphics.setFont(myFont)

    menu.main.buttons = {}
    menu.main.buttons.b1 = {x = WINDOW_WIDTH / 2 - 205, y = WINDOW_HEIGHT / 4 - 50, buttonWidth=410, buttonHeight=100, isPressed=false}
    menu.main.buttons.b2 = {x = WINDOW_WIDTH / 2 - 205, y = WINDOW_HEIGHT / 4 + 60, buttonWidth=410, buttonHeight=100, isPressed=false}
    menu.main.buttons.b3 = {x = WINDOW_WIDTH / 2 - 205, y = WINDOW_HEIGHT / 4 + 170, buttonWidth=410, buttonHeight=100, isPressed=false}
    menu.main.buttons.b4 = {x = WINDOW_WIDTH / 2 - 205, y = WINDOW_HEIGHT / 4 + 280, buttonWidth=410, buttonHeight=100, isPressed=false}

    local function mainGUI()        --defines main GUI as a function that can be called on when there is a change in gamestate
        if gameState == 0 then

            --Easy difficulty button 
            love.graphics.setColor(0, 0, 0, 1)
            love.graphics.rectangle("fill", WINDOW_WIDTH / 2 - 205, WINDOW_HEIGHT / 4 - 50, 410, 100)
            love.graphics.setColor(0.9, 1, 0.9, 1)
            love.graphics.rectangle("fill", WINDOW_WIDTH / 2 - 200, WINDOW_HEIGHT / 4 - 45, 400, 90)
            love.graphics.setColor(0, 0, 0, 1)
            love.graphics.printf(difficulty[1], WINDOW_WIDTH / 2 - 200, WINDOW_HEIGHT / 4 - fontHeight / 2, 400, "center")

            --Normal difficulty button
            love.graphics.setColor(0, 0, 0, 1)
            love.graphics.rectangle("fill", WINDOW_WIDTH / 2 - 205, WINDOW_HEIGHT / 4 + 60, 410, 100)
            love.graphics.setColor(0.9, 1, 0.9, 1)
            love.graphics.rectangle("fill", WINDOW_WIDTH / 2 - 200, WINDOW_HEIGHT / 4 + 65, 400, 90)
            love.graphics.setColor(0, 0, 0, 1)
            love.graphics.printf(difficulty[2], WINDOW_WIDTH / 2 - 200, WINDOW_HEIGHT / 4 + 110 - fontHeight / 2, 400, "center")

            --Hard difficulty button
            love.graphics.setColor(0, 0, 0, 1)
            love.graphics.rectangle("fill", WINDOW_WIDTH / 2 - 205, WINDOW_HEIGHT / 4 + 170, 410, 100)
            love.graphics.setColor(0.9, 1, 0.9, 1)
            love.graphics.rectangle("fill", WINDOW_WIDTH / 2 - 200, WINDOW_HEIGHT / 4 + 175, 400, 90)
            love.graphics.setColor(0, 0, 0, 1)
            love.graphics.printf(difficulty[3], WINDOW_WIDTH / 2 - 200, WINDOW_HEIGHT / 4 + 220 - fontHeight / 2, 400, "center")

            --Insane difficulty button
            love.graphics.setColor(0, 0, 0, 1)
            love.graphics.rectangle("fill", WINDOW_WIDTH / 2 - 205, WINDOW_HEIGHT / 4 + 280, 410, 100)
            love.graphics.setColor(0.9, 1, 0.9, 1)
            love.graphics.rectangle("fill", WINDOW_WIDTH / 2 - 200, WINDOW_HEIGHT / 4 + 285, 400, 90)
            love.graphics.setColor(0, 0, 0, 1)
            love.graphics.printf(difficulty[4], WINDOW_WIDTH / 2 - 200, WINDOW_HEIGHT / 4 + 330 - fontHeight / 2, 400, "center")
        end
    end

    local function questionGUI()
        if gameState == 1 then
            --Question Box
            love.graphics.setColor(0, 0, 0, 1)
            love.graphics.rectangle("fill", WINDOW_WIDTH / 2 - 405, WINDOW_HEIGHT / 4 - 45, 810, 90)
            love.graphics.setColor(0.9, 1, 0.9, 1)
            love.graphics.rectangle("fill", WINDOW_WIDTH / 2 - 400, WINDOW_HEIGHT / 4 - 40, 800, 80)

            --Answer A button
            love.graphics.setColor(0, 0, 0, 1)
            love.graphics.rectangle("fill", WINDOW_WIDTH / 2 - 405, WINDOW_HEIGHT / 4 - 45 + 100, 400, 90)
            love.graphics.setColor(0.9, 1, 0.9, 1)
            love.graphics.rectangle("fill", WINDOW_WIDTH / 2 - 400, WINDOW_HEIGHT / 4 - 40 + 100, 390, 80)

            --Answer C button
            love.graphics.setColor(0, 0, 0, 1)
            love.graphics.rectangle("fill", WINDOW_WIDTH / 2 - 405, WINDOW_HEIGHT / 4 - 45 + 200, 400, 90)
            love.graphics.setColor(0.9, 1, 0.9, 1)
            love.graphics.rectangle("fill", WINDOW_WIDTH / 2 - 400, WINDOW_HEIGHT / 4 - 40 + 200, 390, 80)

            --Answer B button
            love.graphics.setColor(0, 0, 0, 1)
            love.graphics.rectangle("fill", WINDOW_WIDTH / 2 + 5, WINDOW_HEIGHT / 4 - 45 + 100, 400, 90)
            love.graphics.setColor(0.9, 1, 0.9, 1)
            love.graphics.rectangle("fill", WINDOW_WIDTH / 2 + 10, WINDOW_HEIGHT / 4 - 40 + 100, 390, 80)

            --Answer D button
            love.graphics.setColor(0, 0, 0, 1)
            love.graphics.rectangle("fill", WINDOW_WIDTH / 2 + 5, WINDOW_HEIGHT / 4 - 45 + 200, 400, 90)
            love.graphics.setColor(0.9, 1, 0.9, 1)
            love.graphics.rectangle("fill", WINDOW_WIDTH / 2 + 10, WINDOW_HEIGHT / 4 - 40 + 200, 390, 80)
        end
    end

    mainGUI()
    questionGUI()

--[[
    if menu.main.buttons.b1.isPressed then
        gameState = gameState + 1
    end

    if menu.main.buttons.b2.isPressed then
        gameState = gameState + 1
    end
    
    if menu.main.buttons.b3.isPressed  then
        gameState = gameState + 1
    end

    if menu.main.buttons.b4.isPressed then
        gameState = gameState + 1
    end
    Work in progress
    ]]
end