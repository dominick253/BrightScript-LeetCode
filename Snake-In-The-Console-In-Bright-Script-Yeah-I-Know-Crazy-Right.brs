function main()
	board()
end function

function board()
	w = 20
	h = 10
	snakes = ["s"]
	snakeX = 5
	snakeY = 5
	foodx = 1
	foody = 5
	score = 0

	while true
		?"Score :" + str(score)
    	sleep(500)

	for y = 0 to h 
       line = ""
    	for x = 0 to w 
               
			if x = snakeX and y = snakey
					
				for each snake in snakes
                   	line = line + snake
				end for
				else 
                	line = line + "."
            end if
            
			if x = foodx and y = foody 
                line = line + "f"
               end if
				        
		end for
	
		if snakex >= w
        	snakex = 0
    	end if
	
        if len(line) > w
				line = left(line, w)
		end if
			
        ?line
    
    end for
		
if snakex = foodx and snakey = foody
	snakes.push("s")
	score = score + 1
end if
    	
snakeX = snakeX + 1

end while
	
end function 

