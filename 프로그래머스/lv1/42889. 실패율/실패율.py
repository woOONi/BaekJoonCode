from collections import Counter

def solution(N, stages):
    전체인원 = len(stages)
    스테이지_머물고_있는_사람 = Counter(stages)
    실패율 = {}
    for i in range(1, N+1):
        if 전체인원 == 0:
            실패율[i] = 0
        else:
            실패율[i] = 스테이지_머물고_있는_사람[i]/전체인원
            전체인원 -= 스테이지_머물고_있는_사람[i]
    return list(dict(sorted(실패율.items(), key = lambda item: item[1], reverse = True)).keys())