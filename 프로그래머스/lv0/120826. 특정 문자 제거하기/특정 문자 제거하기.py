import re
def solution(my_string, letter):
    return re.sub(letter, '',my_string)