import heapq
def solution(operations):
    
    heap = []
    heapq.heapify(heap)
    i = 0
    while i < len(operations):

        fn, num = operations[i].split(' ')
        num = int(num)
        
        if fn == 'I' :
            heapq.heappush(heap, num)
        else:
            if len(heap) > 0 :
                if num < 1:
                    heapq.heappop(heap)
                else:
                    heap = heapq.nsmallest(len(heap), heap)
                    heap.pop()
        # print(i,heap)
        i+= 1
    
    if len(heap) == 0:
        heap = [0]
    return [max(heap), min(heap)]