# def solution(phone_book):
#     answer = True
#     hash_map = {}
#     for p in phone_book:
#         hash_map[p] = 1
#     for phone_number in phone_book:
#         temp = ""
#         for number in phone_number:
#             temp += number
#             if temp in hash_map and temp != phone_number:
#                 answer = False
#     return answer





def solution(phone_book):
    dic = {}
    for phone_number in phone_book:
        dic[phone_number] = 1
    for phone_number in phone_book:
        tmp = ""
        for number in phone_number:
            tmp += number
            if tmp in dic and tmp != phone_number:
                return False
    return True