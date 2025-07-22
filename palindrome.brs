rem Given a string s, determine if it is a palindrome.

' A palindrome reads the same forward and backward.

' Consider only alphanumeric characters (letters and digits).

' Ignore cases (treat uppercase and lowercase letters as the same).

' Ignore all non-alphanumeric characters.

' Return true if the cleaned string is a palindrome, and false otherwise.

function main()
	
	answer1 = pal("be ar")
	?answer1
	
	answer4 = pal("bear")
	?answer4
	
	answer2 = pal("civic")
	?answer2
	
	answer3 = pal("radar")
	?answer3

	wrong = pal(1)
	?wrong
	
end function

function pal(string)
	
if type(string) = "String" then
	arr = string.split("")
	newString = ""
	
	for i = arr.count() - 1 to 0 step -1
		newString += arr[i]
	end for
	
	if string = newString
		return true
	else return false
	end if 

else if (type(string) <> "string") or (string.contains(" "))  then
		?"Please Enter a word" 
		return false
end if
end function 
