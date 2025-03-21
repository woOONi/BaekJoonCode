import heapq

def solution(scoville, K):
    cnt = 0
    heapq.heapify(scoville)
    while len(scoville) > 1:
        tmp1 = heapq.heappop(scoville)
        tmp2 = heapq.heappop(scoville)
        if tmp1 >= K : 
            return cnt
        
        new = tmp1 + tmp2 * 2
        heapq.heappush(scoville, new)
        cnt += 1
        
    print(scoville)
    if scoville[0] < K : 
        return -1
    else :
        return cnt