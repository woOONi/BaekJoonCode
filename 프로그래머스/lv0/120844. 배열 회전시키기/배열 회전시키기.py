def solution(numbers, direction):
    tmp = []
    if direction == 'right':
        tmp.append(numbers[-1])
        tmp += numbers[:-1]
    else:
        tmp = numbers[1:]
        tmp.append(numbers[0])
    return tmp