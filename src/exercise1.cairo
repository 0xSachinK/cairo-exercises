# Exercise 1: https://starknet.io/docs/hello_cairo/intro.html#exercise
# Write a function that computes the product of all the even entries of
# an array ([arr] * [arr + 2] * ...). You may assume that the length is even.

# For example,
# if size is 2 and array is [1, 2], result should be 1
# if size is 4 and array is [1, 2, 3, 4], result should be 1 * 3 = 3

%builtins output

from starkware.cairo.common.alloc import alloc
from starkware.cairo.common.serialize import serialize_word


func array_prod_even(arr: felt*, size) -> (prod: felt):
	if size == 0:
		return (prod=1)
	end

	# size is not zero
	let (prod_of_rest) = array_prod_even(arr=arr + 2, size=size - 2)
	return (prod=[arr] * prod_of_rest)
end


func main{output_ptr: felt*}():

	# ----- Uncomment this to test the edge case ----- #

	# # Define size
	# const A1_SIZE = 2

	# # Allocate an array
	# let (ptr) = alloc()

	# # Populate required values in the array
	# assert [ptr] = 1
	# assert [ptr + 1] = 2

	# # Call array_prod_even to calculate the product of the even elements
	# let (prod1) = array_prod_even(arr=ptr, size=A1_SIZE)

	# # Write the prod to the program output
	# serialize_word(prod1)

	# ----- Normal case ----- #

	# Define size
	const A2_SIZE = 4

	# Allocate an array
	let (ptr2) = alloc()

	# Populate required values in the array
	assert [ptr2] = 1
	assert [ptr2 + 1] = 2
	assert [ptr2 + 2] = 3
	assert [ptr2 + 3] = 4

	let (prod2) = array_prod_even(arr=ptr2, size=A2_SIZE)

	# Write the prod to the program output
	serialize_word(prod2)

	return ()
end
