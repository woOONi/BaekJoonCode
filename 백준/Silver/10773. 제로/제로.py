import sys

n = int(sys.stdin.readline())

stack = []

while n>0:
    input = int(sys.stdin.readline())

    if input == 0 :
        stack.pop()
    else :
        stack.append(input)
    n -= 1

print(sum(stack))