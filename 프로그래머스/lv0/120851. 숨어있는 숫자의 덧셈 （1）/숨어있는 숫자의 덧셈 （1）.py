import re
def solution(my_string):
    return sum(map(int,list(re.sub('[a-zA-Z]','',my_string))))