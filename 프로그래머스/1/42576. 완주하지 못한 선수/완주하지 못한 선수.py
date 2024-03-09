# def solution(participant, completion):
#     tmp = participant
#     for i in tmp:
#         tmp.remove(i)
    
#     return tmp[0]

from collections import Counter
def solution(participant, completion):
    count_p = Counter(participant)
    count_c = Counter(completion)
    
    output = count_p - count_c
    return list(output.keys())[0]