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

    questionSet = {
    Easy = {
    {"question 1", "answer1", "answer2", "answer3", "answer1"}
    }, 
    Normal = {

    }, 
    Hard = {

    }, 
    Insane = {

    }}


    question = {Easy = {}, Normal = {}, Hard = {}, Insane = {}}

    function questionInsert(n, d, q, aA, aB, aC, aD)
        questions.d.n = {}
        table.insert(questions.d.n, 1, q)
        table.insert(questions.d.n, 2, aA)
        table.insert(questions.d.n, 3, aB)
        table.insert(questions.d.n, 4, aC)
        table.insert(questions.d.n, 5, aD)
    end

questionInsert(1, Easy, questionSet.Easy[1][1], questionSet.Easy[1][2], questionSet.Easy[1][3], questionSet.Easy[1][4], questionSet.Easy[1][5] )

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
            love.graphics.setColor(0, 0, 0, 1)
            love.graphics.printf(questions.Easy[1][1], WINDOW_WIDTH / 2 - 200, WINDOW_HEIGHT / 4 - fontHeight / 2, 400, "center")

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

   --[[ local function main_buttonPress(mainButton)
        function love.mousepressed(x, y, b, istouched)
            if gameState == 0 then
                if b == 1 then 
                    if math.abs(mainButton.x + mainButton.buttonWidth / 2 - love.mouse.getX()) < mainButton.buttonWidth / 2 and
                    math.abs(mainButton.y + mainButton.buttonHeight / 2 - love.mouse.getY()) < mainButton.buttonHeight / 2  then 
                    gameState = gameState + 1 
                    love.graphics.clear()
                    Main_button.isPressed = true
                    questionGUI()
                    end
                end 
            end
        end
    end

    main_buttonPress(menu.main.buttons.b1)

    This shit doesn't work
    ]]

    function love.mousepressed(x, y, b, istouch)
        if gameState == 0 then
            if b == 1 then 
                if math.abs(menu.main.buttons.b1.x + menu.main.buttons.b1.buttonWidth / 2 - love.mouse.getX()) < menu.main.buttons.b1.buttonWidth / 2 and
                math.abs(menu.main.buttons.b1.y + menu.main.buttons.b1.buttonHeight / 2 - love.mouse.getY()) < menu.main.buttons.b1.buttonHeight / 2  then 
                gameState = gameState + 1 
                love.graphics.clear()
                menu.main.buttons.b1.isPressed = true
                questionGUI()

                elseif math.abs(menu.main.buttons.b2.x + menu.main.buttons.b2.buttonWidth / 2 - love.mouse.getX()) < menu.main.buttons.b2.buttonWidth / 2 and
                math.abs(menu.main.buttons.b2.y + menu.main.buttons.b2.buttonHeight / 2 - love.mouse.getY()) < menu.main.buttons.b2.buttonHeight / 2  then 
                gameState = gameState + 1 
                love.graphics.clear()
                menu.main.buttons.b2.isPressed = true
                questionGUI()

                elseif math.abs(menu.main.buttons.b3.x + menu.main.buttons.b3.buttonWidth / 2 - love.mouse.getX()) < menu.main.buttons.b3.buttonWidth / 2 and
                math.abs(menu.main.buttons.b3.y + menu.main.buttons.b3.buttonHeight / 2 - love.mouse.getY()) < menu.main.buttons.b3.buttonHeight / 2  then 
                gameState = gameState + 1 
                love.graphics.clear()
                menu.main.buttons.b3.isPressed = true
                questionGUI()

                elseif math.abs(menu.main.buttons.b4.x + menu.main.buttons.b4.buttonWidth / 2 - love.mouse.getX()) < menu.main.buttons.b4.buttonWidth / 2 and
                math.abs(menu.main.buttons.b4.y + menu.main.buttons.b4.buttonHeight / 2 - love.mouse.getY()) < menu.main.buttons.b4.buttonHeight / 2  then 
                gameState = gameState + 1 
                love.graphics.clear()
                menu.main.buttons.b4.isPressed = true
                questionGUI()
                end
            end 
        end
    end

end