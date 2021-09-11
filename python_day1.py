def myfirstfun(normal, *args, **kwargs):
    print(normal)
    for i in args:
        print(i)
    for key, value in kwargs.items():
        print(f"{key} is a {value}")
normal = 'this is so good'
har = ['test', 'waste', 'toot']
tar = {"Rahul": "Eng", "Pankaj":"IO"}
myfirstfun(normal, *har, **tar)

#Task1
def day2(normal, *args, **kwargs):
    print(normal)
    for i in args:
        print(i + i)

normal = "this is anoher test"
number = int[input("add user input")]
day2(normal, *number)

