from collections import deque
def solution(priorities, location):
    prior = [[i, x] for i, x in enumerate(priorities)]
    cnt = 0
    q = deque(prior)
    while q:
        now = q.popleft()
        if any(now[1] < queue[1] for queue in q):
            q.append(now)
        else:
            if now[0] == location:
                return cnt+1
            cnt += 1