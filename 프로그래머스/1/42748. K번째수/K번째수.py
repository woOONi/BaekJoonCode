def solution(array, commands):
    answer = []
    tmplist = []
    for x, y, i in commands:
        tmp = array[x-1:y]
        tmp.sort()
        answer.append(tmp[i-1])
    return answer