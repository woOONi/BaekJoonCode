from collections import Counter

def solution(nums):
    tmp = Counter(nums)
    keys = list(tmp.keys())
    if len(nums)/2 >= len(keys):
        return len(keys)
    else :
        return len(nums)/2