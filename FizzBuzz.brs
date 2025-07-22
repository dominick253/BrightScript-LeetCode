function main()
	
FizBuzz(15)

end function
	
Function FizBuzz(n)
	arr = []
	
	For i = 1 TO n  
	
	if i MOD 3 = 0 AND i MOD 5 = 0
			arr.Push("FizBuzz")
	ElseIF i MOD 3 = 0
			arr.Push("Fizz")
	ElseIf i MOD 5 = 0 
			arr.Push("Buzz")
	Else arr.Push("" + i)
	end if
		end for
	print arr
	return arr
	
end function
