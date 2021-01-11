WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

function love.load()
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
    })

    myFont = love.graphics.newFont(40)
    fontHeight = myFont:getHeight()
    difficulty_string = {"Easy", "Normal", "Hard", "Insane"}

end



function love.update(dt)

end

local gameState = 0        --determines what gui is displayed 

function love.draw()

    local menu = {}
    menu.main = {}      --difficulty selection screen
    menu.question = {}      --question screen
    menu.result = {}       --result screen

    questions = {{}, {}, {}, {}, {}, {}, {}, {}, {}, {}}
    -- {question, answer A, answer B, answer C, answer D, Correct answer }
    questionPool = {
    Easy = {
    {"What  7 + 3 =", "fourteen", "eleven", "ten", "twelve", 4}, {"How many sides does a trapezium have?", "three", "four", "five", "six", 3}, {"The sun is a what?", "star", "planet", "moon", "black hole", 2}, {"Which of the following is not an animal?", "tiger", "seagull", "antelope", "banana", 5}, {}, {}, {}, {}, {}, {},
    {}, {}, {}, {}, {}, {}, {}, {}, {}, {},
    {}, {}, {}, {}, {}, {}, {}, {}, {}, {}},
    Normal = {
    {}, {}, {}, {}, {}, {}, {}, {}, {}, {},
    {}, {}, {}, {}, {}, {}, {}, {}, {}, {},
    {}, {}, {}, {}, {}, {}, {}, {}, {}, {}},
    Hard = {
    {}, {}, {}, {}, {}, {}, {}, {}, {}, {},
    {}, {}, {}, {}, {}, {}, {}, {}, {}, {},
    {}, {}, {}, {}, {}, {}, {}, {}, {}, {}}, 
    Insane = {
    {}, {}, {}, {}, {}, {}, {}, {}, {}, {},
    {}, {}, {}, {}, {}, {}, {}, {}, {}, {},
    {}, {}, {}, {}, {}, {}, {}, {}, {}, {}}}


    function check(n, k)
        for i=1, 100 do
            for j=1, n-1 do
                if sequence[n] == sequence[j] then 
                    sequence[n] = math.random(k)
                end
            end
        end
    end
    
    function gen(small, big)
        sequence[1] = math.random(big)
        for t=2, small do
        sequence[t] = math.random(big)
        check(t, big)
        end
    end

    function question_fill()
        sequence = {}
        gen(3, 4)

        if menu.main.buttons.b1.isPressed then 
            difficulty = questionPool.Easy
        elseif menu.main.buttons.b2.isPressed then
            difficulty = questionPool.Normal
        elseif menu.main.buttons.b3.isPressed then
            difficulty = questionPool.Hard
        elseif menu.main.buttons.b4.isPressed then
            difficulty = questionPool.Insane
        end
        
        for t=1, 3 do
            for j=1, 6 do
                table.insert(questions[t], t, difficulty[sequence[t]][j]) --there's a fucky-wucky here
            end
        end
    end

    --there will be a function that switches screen depending on the gamestate

    love.graphics.setBackgroundColor(1, 1, 1, 1)    --sets background white
    love.graphics.setFont(myFont)

    menu.main.buttons = {}
    menu.main.buttons.b1 = {x = WINDOW_WIDTH / 2 - 205, y = WINDOW_HEIGHT / 4 - 50, buttonWidth=410, buttonHeight=100, isPressed=false}
    menu.main.buttons.b2 = {x = WINDOW_WIDTH / 2 - 205, y = WINDOW_HEIGHT / 4 + 60, buttonWidth=410, buttonHeight=100, isPressed=false}
    menu.main.buttons.b3 = {x = WINDOW_WIDTH / 2 - 205, y = WINDOW_HEIGHT / 4 + 170, buttonWidth=410, buttonHeight=100, isPressed=false}
    menu.main.buttons.b4 = {x = WINDOW_WIDTH / 2 - 205, y = WINDOW_HEIGHT / 4 + 280, buttonWidth=410, buttonHeight=100, isPressed=false}


    menu.question.buttons = {}
    menu.question.question = {x = WINDOW_WIDTH / 2 - 405, y = WINDOW_HEIGHT / 4 - 45, buttonWidth=810, buttonHeight=90}
    menu.question.buttons.bA = {x = WINDOW_WIDTH / 2 - 405, y = WINDOW_HEIGHT / 4 - 45 + 100, buttonWidth=810, buttonHeight=90, isPressed=false}
    menu.question.buttons.bB = {x = WINDOW_WIDTH / 2 + 5, y = WINDOW_HEIGHT / 4 - 45 + 100, buttonWidth=810, buttonHeight=90, isPressed=false}
    menu.question.buttons.bC = {x = WINDOW_WIDTH / 2 - 405, y = WINDOW_HEIGHT / 4 - 45 + 200, buttonWidth=810, buttonHeight=90, isPressed=false}
    menu.question.buttons.bD = {x = WINDOW_WIDTH / 2 + 5, y = WINDOW_HEIGHT / 4 - 45 + 200, buttonWidth=810, buttonHeight=90, isPressed=false}

    local function mainGUI()        --defines main GUI as a function that can be called on when there is a change in gamestate
        if gameState == 0 then

            --Easy difficulty button 
            love.graphics.setColor(0, 0, 0, 1)
            love.graphics.rectangle("fill", WINDOW_WIDTH / 2 - 205, WINDOW_HEIGHT / 4 - 50, 410, 100)
            love.graphics.setColor(0.9, 1, 0.9, 1)
            love.graphics.rectangle("fill", WINDOW_WIDTH / 2 - 200, WINDOW_HEIGHT / 4 - 45, 400, 90)
            love.graphics.setColor(0, 0, 0, 1)
            love.graphics.printf(difficulty_string[1], WINDOW_WIDTH / 2 - 200, WINDOW_HEIGHT / 4 - fontHeight / 2, 400, "center")

            --Normal difficulty button
            love.graphics.setColor(0, 0, 0, 1)
            love.graphics.rectangle("fill", WINDOW_WIDTH / 2 - 205, WINDOW_HEIGHT / 4 + 60, 410, 100)
            love.graphics.setColor(0.9, 1, 0.9, 1)
            love.graphics.rectangle("fill", WINDOW_WIDTH / 2 - 200, WINDOW_HEIGHT / 4 + 65, 400, 90)
            love.graphics.setColor(0, 0, 0, 1)
            love.graphics.printf(difficulty_string[2], WINDOW_WIDTH / 2 - 200, WINDOW_HEIGHT / 4 + 110 - fontHeight / 2, 400, "center")

            --Hard difficulty button
            love.graphics.setColor(0, 0, 0, 1)
            love.graphics.rectangle("fill", WINDOW_WIDTH / 2 - 205, WINDOW_HEIGHT / 4 + 170, 410, 100)
            love.graphics.setColor(0.9, 1, 0.9, 1)
            love.graphics.rectangle("fill", WINDOW_WIDTH / 2 - 200, WINDOW_HEIGHT / 4 + 175, 400, 90)
            love.graphics.setColor(0, 0, 0, 1)
            love.graphics.printf(difficulty_string[3], WINDOW_WIDTH / 2 - 200, WINDOW_HEIGHT / 4 + 220 - fontHeight / 2, 400, "center")

            --Insane difficulty button
            love.graphics.setColor(0, 0, 0, 1)
            love.graphics.rectangle("fill", WINDOW_WIDTH / 2 - 205, WINDOW_HEIGHT / 4 + 280, 410, 100)
            love.graphics.setColor(0.9, 1, 0.9, 1)
            love.graphics.rectangle("fill", WINDOW_WIDTH / 2 - 200, WINDOW_HEIGHT / 4 + 285, 400, 90)
            love.graphics.setColor(0, 0, 0, 1)
            love.graphics.printf(difficulty_string[4], WINDOW_WIDTH / 2 - 200, WINDOW_HEIGHT / 4 + 330 - fontHeight / 2, 400, "center")
        end
    end

    local function questionGUI()
        if gameState == 1 then

            local displayed_question = 1

            question_fill()
            --Question Box
            love.graphics.setColor(0, 0, 0, 1)
            love.graphics.rectangle("fill", WINDOW_WIDTH / 2 - 405, WINDOW_HEIGHT / 4 - 45, 810, 90)
            love.graphics.setColor(0.9, 1, 0.9, 1)
            love.graphics.rectangle("fill", WINDOW_WIDTH / 2 - 400, WINDOW_HEIGHT / 4 - 40, 800, 80)
            love.graphics.setColor(0, 0, 0, 1)
    --        love.graphics.printf(questions.Easy[1][1], WINDOW_WIDTH / 2 - 200, WINDOW_HEIGHT / 4 - fontHeight / 2, 400, "center")

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
    --questionGUI()

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
                    questionGUI()
                    menu.main.buttons.b1.isPressed = true

                elseif math.abs(menu.main.buttons.b2.x + menu.main.buttons.b2.buttonWidth / 2 - love.mouse.getX()) < menu.main.buttons.b2.buttonWidth / 2 and
                math.abs(menu.main.buttons.b2.y + menu.main.buttons.b2.buttonHeight / 2 - love.mouse.getY()) < menu.main.buttons.b2.buttonHeight / 2  then 
                    gameState = gameState + 1 
                    love.graphics.clear()
                    questionGUI()
                    menu.main.buttons.b2.isPressed = true

                elseif math.abs(menu.main.buttons.b3.x + menu.main.buttons.b3.buttonWidth / 2 - love.mouse.getX()) < menu.main.buttons.b3.buttonWidth / 2 and
                math.abs(menu.main.buttons.b3.y + menu.main.buttons.b3.buttonHeight / 2 - love.mouse.getY()) < menu.main.buttons.b3.buttonHeight / 2  then 
                    gameState = gameState + 1 
                    love.graphics.clear()
                    questionGUI()
                    menu.main.buttons.b3.isPressed = true

                elseif math.abs(menu.main.buttons.b4.x + menu.main.buttons.b4.buttonWidth / 2 - love.mouse.getX()) < menu.main.buttons.b4.buttonWidth / 2 and
                math.abs(menu.main.buttons.b4.y + menu.main.buttons.b4.buttonHeight / 2 - love.mouse.getY()) < menu.main.buttons.b4.buttonHeight / 2  then 
                    gameState = gameState + 1 
                    love.graphics.clear()
                    questionGUI()
                    menu.main.buttons.b4.isPressed = true
                end
            end 
        end

        if gameState == 1 then
            if b == 1 then
                if math.abs(menu.question.buttons.bA.x + menu.question.buttons.bA.buttonWidth / 2 - love.mouse.getX()) < menu.question.buttons.bA.buttonWidth / 2 and
                math.abs(menu.question.buttons.bA.y + menu.question.buttons.bA.buttonHeight / 2 - love.mouse.getY()) < menu.question.buttons.bA.buttonHeight / 2  then
                    love.graphics.clear()  
                end
            end
        end
    end

end