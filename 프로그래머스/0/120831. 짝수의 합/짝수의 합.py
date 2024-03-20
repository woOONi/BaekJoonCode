def solution(n):
    result = 0
    for i in range(n//2+1):
        result += i
    
    return result*2