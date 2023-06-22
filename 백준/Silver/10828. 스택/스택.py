import sys

n = int(sys.stdin.readline())

stack = []
while n > 0:
    input = sys.stdin.readline().split()
    
    n -= 1
    # print(n)

    if input[0] == 'push':
        stack.append(input[1])
    elif input[0] == 'top':
        print(stack[len(stack)-1]) if len(stack) > 0 else print(-1)
    elif input[0] == 'size':
        print(len(stack))
    elif input[0] == 'empty':
        print(1) if len(stack) == 0 else print(0)
    elif input[0] == 'pop':
        print(stack.pop()) if len(stack) > 0 else print(-1)