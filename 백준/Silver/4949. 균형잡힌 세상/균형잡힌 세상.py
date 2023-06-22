while True:
    string = input().rstrip()
    if string == '.':
        break
    
    stack = []
    balanced = True

    for char in string:
        if char == '(' or char == '[':
            stack.append(char)
        elif char == ')':
            if not stack or stack[-1] != '(':
                balanced = False
                break
            stack.pop()
        elif char == ']':
            if not stack or stack[-1] != '[':
                balanced = False
                break
            stack.pop()

    if balanced and not stack:
        print('yes')
    else:
        print('no')
