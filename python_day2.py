
#Task1
print("Task 1 started")
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

print("Task 2 started")
#Task2
def task2(normal, *args, **kargs):
     print(normal)
     for key, value in kargs.items():
         print(f'{key} {value}')
normal = "This is for next task"
mark = {"raul": "99", "avg_marks":"55", "failing_user": ['Hidan','Goku', 'Timon']}

task2(normal, **mark)
#***************************************
print(f"Task 3 started")
#task3

a_dict = [
    {
        "name": "gara",
        "power": "some sand related jutsu",
        "powerlevel": 199,
        "frieds": [
            {
                "name": "Naruto",
                "friend_points": 28,
                "enemies": ["Saitama"] 
            },
            {
                "name": "Boruto",
                "friend_points": 18,
                "enemies": ["Saitama"]
            }
        ]
    },
    {
        "name": "Alex",
        "power": "some titans powers",
        "powerlevel": 1199,
        "frieds": [
            {
            "name": "Soniya",
            "friend_points": 128,
            "enemies": ["Saitama"] 
            }
        ]
    },
    {
        "name": "King",
        "power": "some titans powers",
        "powerlevel": 1199,
        "frieds": [
            {
            "name": "Saitama",
            "friend_points": 128,
            "enemies": ["Naruto", "gara", "boruto"] 
            }
        ]
    }
    
]

for i in a_dict:
    print(i['name'], i['power'], i['powerlevel'], i['frieds'][0]['name'], i['frieds'][0]['friend_points'],i['frieds'][0]['enemies'][0], i['frieds'][0]['name'] )
