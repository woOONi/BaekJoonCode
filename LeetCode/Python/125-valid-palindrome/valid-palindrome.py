import re
class Solution:
    def isPalindrome(self, s: str) -> bool:
        # 슬라이싱
        s = s.lower()
        s = re.sub('[^a-z0-9]', '',s)

        return s==s[::-1] # 슬라이싱