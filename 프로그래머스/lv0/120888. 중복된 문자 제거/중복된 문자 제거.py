def solution(my_string):
    result = ''
    for s in my_string:
        if s not in result:
            result += s
    return result