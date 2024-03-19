from collections import deque
class Solution:
    def isPalindrome(self, s: str) -> bool:
        # deque
        # 자료형 deque로 선언
        strs : Deque = deque()

        for char in s:
            if char.isalnum():
                strs.append(char.lower())

        while len(strs)>1:
            if strs.popleft()!= strs.pop():
                return False
        return True