def solution(dot):
    tmp = dot[0] * dot[1]
    if tmp > 0 :
        if dot[1] > 0:
            return 1
        else :
            return 3
    else:
        if dot[1] > 0:
            return 2
        else :
            return 4