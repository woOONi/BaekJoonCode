from collections import deque
def solution(priorities, location):
    l = len(priorities)
    queue = deque([(i,p) for i,p in enumerate(priorities)])
    
    max_value = max(priorities)
    while queue:
        idx, p = queue.popleft()
        if p == max_value and idx == location: break
        elif p == max_value: priorities.remove(p); max_value = max(priorities)
        else : queue.append((idx,p))
        
    return l - len(queue)