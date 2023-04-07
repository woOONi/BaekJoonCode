import math
def solution(n):
    i=1
    while i<=11:
        if n < math.factorial(i):
            i -= 1
            break
        else:
            i += 1
            continue
    return i