rem Given an array of integers, return indices of two numbers such that they add up to a specific target


function main()

answer = twonums(rndArr(100), 15)
?answer
end function 


function twonums(arr, target) 
	for i = 0 to (arr.Count() -1)
		for j = i + 1 to (arr.Count() -1)
			if ((arr[i] + arr[j] = target) and (i <> j)) 
				num1 = i
				num2 = j
				?"Index 1: " + Str(num1)
				?"Index 2: " +  Str(num2)
				return [i, j]
			 end if
		end for
	end for
?"No numbers add to the target in the array"
end function

function rndArr(n)
	arr = []
for i = 1 to n
	arr.push(rnd(100))
end for
return arr
	
	end function
