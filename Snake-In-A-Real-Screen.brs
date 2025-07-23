Library "v30/bslCore.brs"

sub main()
    screen = CreateObject("roScreen", true, 640, 480)
    screen.SetAlphaEnable(true)
    screen.Clear(&h000000FF)

    w = 32  ' cells horizontally
    h = 24  ' cells vertically
    cellSize = 20

    ' Snake data
    snake = [ { x: int(w/2), y: int(h/2) } ]
    dir = "right"

    ' Food
'     food = randomFood(w, h, snake)
	food = { x: int(w / 2), y: int(h / 2) }

    score = 0
    gameover = false

    while not gameover
        sleep(100) ' simulate frame rate

        ' Move snake
        head = snake[0]
        newHead = { x: head.x, y: head.y }
        if dir = "right" then newHead.x = newHead.x + 1

        ' Wrap around edges
        if newHead.x < 0 then newHead.x = w - 1
        if newHead.x >= w then newHead.x = 0
        if newHead.y < 0 then newHead.y = h - 1
        if newHead.y >= h then newHead.y = 0

        ' Check collision with self
        for each segment in snake
            if segment.x = newHead.x and segment.y = newHead.y then
                gameover = true
            end if
        end for

        if gameover then exit while

        ' Add new head
        snake.unshift(newHead)

        ' Check for food
        if newHead.x = food.x and newHead.y = food.y then
            score = score + 1
'             food = randomFood(w, h, snake)
				food = { x: int(w / 2), y: int(h / 2) }

		else
            snake.pop() ' remove tail
        end if

        ' Draw
        screen.Clear(&h000000FF)

        ' Draw snake
        for each segment in snake
            screen.DrawRect(segment.x * cellSize, segment.y * cellSize, cellSize-2, cellSize-2, &h00FF00FF)
        end for

        ' Draw food
screen.DrawRect(food.x * cellSize, food.y * cellSize, cellSize - 2, cellSize - 2, &hFF0000FF)


        ' Draw score
' screen.DrawText("Score: " + str(score), 10, 10, &hFFFFFFFF, invalid)


        screen.SwapBuffers()
    end while

    ' Game over screen
    screen.Clear(&h000000FF)
    screen.DrawText("Game Over! Score: " + str(score), 100, 200, &hFFFFFFFF, "Large")
    screen.SwapBuffers()
    sleep(3000)
end sub

function randomFood(w, h, snake) as Object
    while true
        x = rnd(w) mod w
        y = rnd(h) mod h
        overlap = false
        for each segment in snake
            if segment.x = x and segment.y = y then
                overlap = true
                exit for
            end if
        end for
        if not overlap then
            return { x: int(w / 2), y: int(h / 2) }
        end if
    end while
end function
