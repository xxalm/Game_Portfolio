w_screen = 320
y_screen = 480
max_airplanes_b = 12
airplane = {}
GAME_OVER = false
DESTROYED_JETS = 0
NUMBER_JETS_OBJECTIVE = 10

airplane = {
    src = "imagens/airplane.png",
    w = 55,
    h = 63,
    x = w_screen/2 - 64/2,
    y = y_screen - 64/2,
    shots = {}
}

airplanes_b = {}

function shot()
    gunshot:play()
    local newShot = {
        x = airplane.x + airplane.w/2,
        y = airplane.y,
        w = 8,
        h = 8
    }
    table.insert(airplane.shots, newShot)
end

function moveShots()
    for i = #airplane.shots, 1, -1 do
        if airplane.shots[i].y > 0 then
            airplane.shots[i].y = airplane.shots[i].y - 1
        else
            table.remove(airplane.shots, i)
        end
    end
end

function destroyAirplane()
    destroy:play()

    airplane.src = "imagens/explosion_ship.png"
    airplane.image = love.graphics.newImage(airplane.src)
    airplane.w = 66
    airplane.h = 50
end

function confirmCollision(X1, Y1, W1, H1, X2, Y2, W2, H2)
    return X2 < X1 + W1 and
            X1 < X2 + W2 and
            Y1 < Y2 + H2 and
            Y2 < Y1 + H1
end

function changeBackgroundMusic()
    background_sound:stop()
    end_game:play()
end

function checkCollisionWithAirplane()
    for k, airplane_b in pairs(airplanes_b) do
        local x1, y1, w1, h1 = airplane_b.x, airplane_b.y, airplane_b.width, airplane_b.height
        local x2, y2, w2, h2 = airplane.x, airplane.y, airplane.w, airplane.h

        if x1 and y1 and w1 and h1 and x2 and y2 and w2 and h2 then
            if confirmCollision(x1, y1, w1, h1, x2, y2, w2, h2) then
                changeBackgroundMusic()
                destroyAirplane()
                GAME_OVER = true
            end
        end
    end
end


function checkCollisionWithShots()
    for i = #airplane.shots, 1, -1 do
        for j  = #airplanes_b, 1, -1 do
            if confirmCollision(airplane.shots[i].x, airplane.shots[i].y, airplane.shots[i].w, airplane.shots[i].h,
                                airplanes_b[j].x, airplanes_b[j].y, airplanes_b[j].width, airplanes_b[j].height) then
                DESTROYED_JETS = DESTROYED_JETS + 1
                table.remove(airplane.shots, i)
                table.remove(airplanes_b, j)
                break
            end
        end
    end
end

function checkCollision()
    checkCollisionWithAirplane()
    checkCollisionWithShots()
end

function checkDoneObjective()
    if DESTROYED_JETS >= NUMBER_JETS_OBJECTIVE then
        background_sound:stop()
        WINNER = true
        winner_sound:play()
    end
end

airplanes_b = {}

function removeairplanes_b()
    for i = #airplanes_b, 1, -1 do
        if airplanes_b[i].y > y_screen then
            table.remove(airplanes_b, i)
        end
    end
end

function spawnEnemyairplane()
    local airplane_b = {
        x = math.random(w_screen),
        y = -50,
        width = 50,
        height = 44,
        weight = math.random(3),
        horizontal_displacement = math.random(-1, 1)
    }
    table.insert(airplanes_b, airplane_b)
end

function moveEnemyairplane()
    for _, airplane_b in pairs(airplanes_b) do
        airplane_b.y = airplane_b.y + airplane_b.weight
        airplane_b.x = airplane_b.x + airplane_b.horizontal_displacement
    end
end

function moveairplane()
    if love.keyboard.isDown('w') then
        airplane.y = airplane.y -1
    end
    if love.keyboard.isDown('s') then
        airplane.y = airplane.y +1
    end
    if love.keyboard.isDown('a') then
        airplane.x = airplane.x -1
    end
    if love.keyboard.isDown('d') then
        airplane.x = airplane.x +1
    end
end


function love.load()
    love.window.setMode(w_screen, y_screen, {resizable = false})
    love.window.setTitle("Space Defender")

    math.randomseed(os.time())

    background = love.graphics.newImage("imagens/background.jpg")
    gameover_img = love.graphics.newImage("imagens/gameover.png")
    winner_img = love.graphics.newImage("imagens/winner.png")

    airplane.image = love.graphics.newImage(airplane.src)
    airplane_b_img = love.graphics.newImage("imagens/airplane_b.png")
    shot_img = love.graphics.newImage("imagens/shot.png")

    background_sound = love.audio.newSource("audios/background.mp3", "static")
    background_sound: setLooping(true)
    background_sound:play()

    destroy = love.audio.newSource("audios/destroy.wav", "static")
    end_game = love.audio.newSource("audios/gameover.wav", "static")
    gunshot = love.audio.newSource("audios/gunshot.wav", "static")
    winner_sound = love.audio.newSource("audios/winner.mp3", "static")
end

function love.update(dt)
    if not GAME_OVER and not WINNER then
        if love.keyboard.isDown('w', 'a', 's', 'd') then
            moveairplane()
        end

        removeairplanes_b()
        if #airplanes_b < max_airplanes_b then
            spawnEnemyairplane()
        end
        moveEnemyairplane()
        moveShots()
        checkCollision()
        checkDoneObjective()
    end
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    elseif key == "space" then
        shot()
    end
end


function love.draw()
    love.graphics.draw(background, 0, 0)
    love.graphics.draw(airplane.image, airplane.x, airplane.y)

    love.graphics.print("Jets Left: " .. NUMBER_JETS_OBJECTIVE - DESTROYED_JETS, 0, 0)

    for _, airplane_b in pairs(airplanes_b) do
        love.graphics.draw(airplane_b_img, airplane_b.x, airplane_b.y)
        
    end

    for k, shot in pairs(airplane.shots) do
        love.graphics.draw(shot_img, shot.x, shot.y)
    end

    if GAME_OVER then
        love.graphics.draw(gameover_img, w_screen/2 - gameover_img:getWidth()/2, y_screen/2 - gameover_img:getHeight()/2)
    end
    if WINNER then
        love.graphics.draw(winner_img, w_screen/2 - winner_img:getWidth()/2, y_screen/2 - winner_img:getHeight()/2)
    end
end