function main()
	screen = CreateObject("roScreen", true, 400, 400)
	port = CreateObject("roMessagePort")
	screen.SetPort(port)
	deviceInfo = CreateObject("roDeviceInfo")
    displaySize = deviceInfo.GetDisplaySize()
    
	screen.Clear(&h000000FF)

	?"I will draw you a tree!"
	
	shrink = 0.67
	a = 3.14 * 0.5
	da = 3.14 / 6
	l = 200
	level = 0
	maxlev = 10
	x = 200
	y = 400
	dim xs[maxlev]
	dim ys[maxlev]
	
	result = drawBranch(screen,x,y,l,a,da,shrink,level,maxlev)
	screen.SwapBuffers()

end function

function drawBranch(screen,x,y,l,a,da,shrink,level,maxlev) as boolean
	if level >= maxlev then return false
		
	dx = l * cos(a)
	dy = l * sin(a)
	nx = x + dx
	ny = y - dy
		
	screen.DrawLine(x, y, nx, ny, &h00FF00FF)
		
	x = nx
	y = ny
	level = level + 1
	l = l * shrink
			
	drawBranch(screen,nx,ny,l * shrink,a + da,da,shrink,level,maxlev)
	drawBranch(screen,nx,ny,l * shrink,a - da,da,shrink,level,maxlev)
	return true
end function
