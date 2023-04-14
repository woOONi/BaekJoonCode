# def solution(order):
#     answer = str(order).count('3')
#     answer += str(order).count('6')
#     answer += str(order).count('9')
#     return answer

# def solution(order):
#     return sum(map(lambda x : str(order).count(x), '369'))

import re
def solution(order):
    return len(re.sub('[^369]','',str(order)))