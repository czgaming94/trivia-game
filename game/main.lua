WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

function love.load()
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
    })

    myFont = love.graphics.newFont(40)
    fontHeight = myFont:getHeight()
    difficulty = {}
    difficulty[1] = "Easy"
    difficulty[2] = "Normal"
    difficulty[3] = "Hard"
    difficulty[4] = "Insane"
end

function love.update(dt)

end

--[[
function love.draw()
    love.graphics.setBackgroundColor(1, 1, 1, 0.5)

    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.rectangle("fill", WINDOW_WIDTH / 2 - 405, WINDOW_HEIGHT / 4 - 45, 810, 90)
    love.graphics.setColor(0.9, 1, 0.9, 1)
    love.graphics.rectangle("fill", WINDOW_WIDTH / 2 - 400, WINDOW_HEIGHT / 4 - 40, 800, 80)

    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.rectangle("fill", WINDOW_WIDTH / 2 - 405, WINDOW_HEIGHT / 4 - 45 + 100, 400, 90)
    love.graphics.setColor(0.9, 1, 0.9, 1)
    love.graphics.rectangle("fill", WINDOW_WIDTH / 2 - 400, WINDOW_HEIGHT / 4 - 40 + 100, 390, 80)

    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.rectangle("fill", WINDOW_WIDTH / 2 - 405, WINDOW_HEIGHT / 4 - 45 + 200, 400, 90)
    love.graphics.setColor(0.9, 1, 0.9, 1)
    love.graphics.rectangle("fill", WINDOW_WIDTH / 2 - 400, WINDOW_HEIGHT / 4 - 40 + 200, 390, 80)

    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.rectangle("fill", WINDOW_WIDTH / 2 + 5, WINDOW_HEIGHT / 4 - 45 + 100, 400, 90)
    love.graphics.setColor(0.9, 1, 0.9, 1)
    love.graphics.rectangle("fill", WINDOW_WIDTH / 2 + 10, WINDOW_HEIGHT / 4 - 40 + 100, 390, 80)

    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.rectangle("fill", WINDOW_WIDTH / 2 + 5, WINDOW_HEIGHT / 4 - 45 + 200, 400, 90)
    love.graphics.setColor(0.9, 1, 0.9, 1)
    love.graphics.rectangle("fill", WINDOW_WIDTH / 2 + 10, WINDOW_HEIGHT / 4 - 40 + 200, 390, 80)
end
]]

local gameState = 0

function love.draw()

    local menu = {}
    menu.main = {}
    menu.question = {}
    menu.result = {}

    local main.buttons = {}
    local main.buttons.b1 = {x, y, buttonHeight, buttonWidth, isPressed}
    local main.buttons.b1.isPressed = false

    local main.buttons.b2 = {x, y, buttonHeight, buttonWidth, isPressed}
    local main.buttons.b1.isPressed = false

    local main.buttons.b3 = {x, y, buttonHeight, buttonWidth, isPressed}
    local main.buttons.b3.isPressed = false

    local main.buttons.b4 = {x, y, buttonHeight, buttonWidth, isPressed}
    local main.buttons.b4.isPressed = false


    love.graphics.setBackgroundColor(1, 1, 1, 1)
    love.graphics.setFont(myFont)

    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.rectangle("fill", WINDOW_WIDTH / 2 - 205, WINDOW_HEIGHT / 4 - 50, 410, 100)
    love.graphics.setColor(0.9, 1, 0.9, 1)
    love.graphics.rectangle("fill", WINDOW_WIDTH / 2 - 200, WINDOW_HEIGHT / 4 - 45, 400, 90)
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.printf(difficulty[1], WINDOW_WIDTH / 2 - 200, WINDOW_HEIGHT / 4 - fontHeight / 2, 400, "center")

    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.rectangle("fill", WINDOW_WIDTH / 2 - 205, WINDOW_HEIGHT / 4 + 60, 410, 100)
    love.graphics.setColor(0.9, 1, 0.9, 1)
    love.graphics.rectangle("fill", WINDOW_WIDTH / 2 - 200, WINDOW_HEIGHT / 4 + 65, 400, 90)
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.printf(difficulty[2], WINDOW_WIDTH / 2 - 200, WINDOW_HEIGHT / 4 + 110 - fontHeight / 2, 400, "center")

    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.rectangle("fill", WINDOW_WIDTH / 2 - 205, WINDOW_HEIGHT / 4 + 170, 410, 100)
    love.graphics.setColor(0.9, 1, 0.9, 1)
    love.graphics.rectangle("fill", WINDOW_WIDTH / 2 - 200, WINDOW_HEIGHT / 4 + 175, 400, 90)
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.printf(difficulty[3], WINDOW_WIDTH / 2 - 200, WINDOW_HEIGHT / 4 + 220 - fontHeight / 2, 400, "center")

    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.rectangle("fill", WINDOW_WIDTH / 2 - 205, WINDOW_HEIGHT / 4 + 280, 410, 100)
    love.graphics.setColor(0.9, 1, 0.9, 1)
    love.graphics.rectangle("fill", WINDOW_WIDTH / 2 - 200, WINDOW_HEIGHT / 4 + 285, 400, 90)
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.printf(difficulty[4], WINDOW_WIDTH / 2 - 200, WINDOW_HEIGHT / 4 + 330 - fontHeight / 2, 400, "center")

end