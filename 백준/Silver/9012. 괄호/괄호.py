import sys

n = int(sys.stdin.readline())

while n > 0 :
    sum = 0
    n -= 1
    input = sys.stdin.readline()

    for i in input:
        if i == '(':
            sum += 1
        elif i == ')':
            if sum == 0:
                sum += 1
                break
            else :
                sum -= 1
    
    if sum == 0:
        print('YES')
    else :
        print('NO')