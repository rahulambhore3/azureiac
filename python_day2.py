
#Task1
'''
def day2(total, *args, **kargs):
    for i in range(0, len(args)):
        total = total + args[i]
    print(total)
total = 0
number = input("enter number with space ")
number = number.split()
for i in range(len(number)):
    number[i] = int(number[i])
day2(total, *number)
'''

#Task2