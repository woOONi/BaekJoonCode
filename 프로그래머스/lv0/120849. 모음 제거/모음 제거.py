import re
def solution(my_string):
    return re.sub(r'[aeiou]','',my_string)

# sub: 제거하거나 교체할때 사용