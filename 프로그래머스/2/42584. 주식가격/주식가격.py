# from collections import deque
# def solution(prices):
#     answer = []
#     for i in range(len(prices)):
#         dq = deque(prices[i:])
#         cnt = 0
#         now = dq.popleft()
#         while dq:
#             if len(dq) == 0:
#                 break
#             elif dq and now > dq.popleft():
#                 cnt += 1
#                 break
#             else :
#                 cnt += 1
#         answer.append(cnt)
#     return answer

# from collections import deque
# def solution(prices):
#     min_prices = [min(prices[i:]) for i in range(len(prices))] # 애초에 이게 효율성이 떨어짐
    
    
#     # length = len(prices)
#     # answer = []
#     # for i in range(length):
#     #     x = prices[i]
#     #     y = min_prices[i]
#     #     if x > y :
#     #         idx = prices[2:].index(2)+i
#     #         answer.append(idx-i)
#     #     elif x == y:
#     #         answer.append(length-i-1)

#     return min_prices


def solution(prices):
    answer = []
    length = len(prices)
    for i in range(length):
        cnt = 0
        for x in range(i+1, length):
            if prices[i] > prices[x]:
                cnt += 1
                break
            else:
                cnt+=1
        answer.append(cnt)

    return answer