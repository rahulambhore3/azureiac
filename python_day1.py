#Task1
test = 'this is test'
print(len(test))  #printing lenth of test variable
print(test.upper()) #converting test variable to upper case
print(type(test)) # checking type of test variable
number = 25
print(number)
print(type(number)) # printing type of number

test = [1,2,3,4]
print(test)
test.append(5)
print(test)
print(type(test))

#Task2:

test = [1,2,3,4,5] # we need to provide value to test and it will print accoundigly
for i in test:
    print(i)

i = 0
for i in range(11): # this way we can just range it and no need to give long value
    print(i)

table = int(input('please enter the table you want to print? ')) # you can take any user input to print any table
for i in range(1,11):
    print(table, 'x', i, '=', table*i)
    #print(table*i) # this will also do 
    
#Task3
number = [2,3,5,8,9]
for i in number:
    if i%2 ==0:
        print('printing even number')
        print(i)
    if i%2 !=0:
        print('printing odd number')
        print(i)


