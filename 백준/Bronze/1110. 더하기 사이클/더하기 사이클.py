num = int(input())
n = num
cnt = 0

while 1:
    a = num // 10 # 2 # 6 # 8
    b = num % 10 # 6 # 8 # 4
    c = a + b # 8 # 14 # 12
    num = b * 10 + (c % 10) # 68 # 84

    cnt += 1
    if num == n: 
        print(cnt)
        break