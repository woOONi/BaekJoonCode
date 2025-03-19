import math
def solution(progresses, speeds):
    time = []
    for p, s in zip(progresses, speeds):
        time.append(math.ceil((100 - p) / s))
    answer = []
    maxtime = time[0]
    cnt = 0
    for i, x in enumerate(time):
        if maxtime >= x:
            cnt += 1
            print(maxtime,cnt)
        else :
            answer.append(cnt)
            maxtime = x
            cnt = 1
            print(maxtime,cnt)
        if i == len(time)-1 : answer.append(cnt)
    return answer 