# import numpy as np
# def solution(n):
#     if n == 1:
#         return 1
#     result = 0
#     for i in range(1,n//2):
#         if (n//2) % i == 0 :
#             result += 1
    
#     result *= 2
#     if int(np.sqrt(n))**2 == n:
#         result -= 1
#     return result

def solution(n):
    return len([number for number in range(1, n+1) if n%number == 0])
