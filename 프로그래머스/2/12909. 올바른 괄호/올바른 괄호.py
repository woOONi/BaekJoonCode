# from collections import deque
# def solution(s):
#     dq = deque(s)
#     tmp = [dq.pop()]
#     while len(dq)>1:
#         tmp.append(dq.pop())
#         if tmp[-1] == '(' and tmp[-2] == ')':
#             tmp.pop()
#             tmp.pop()
#             dq.pop()
#     if len(tmp) == 0 :
#         return True
#     else : return False


def solution(s):
    stack = [s[0]]

    if stack[0] == ')':
        return False

    for i in s[1:]:
        if stack and stack[-1] == '(' and i == ')':
            stack.pop()
        else : 
            stack.append(i)
    
    if stack :
        return False
    else :
        return True