from collections import Counter
def solution(clothes):
    tmplist = [i[1] for i in clothes]
    cnt = Counter(tmplist)
    com = 1
    for i in list(cnt.values()):
        com *= (i+1)
    
    return com-1