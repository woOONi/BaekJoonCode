class Solution:
    def reverse(self, x: int) -> int:
        min_integer = 2**31*-1
        max_integer = 2**31-1
        y = str(x)
        if x >= 0:
            y = int(y[::-1])
            if y>max_integer or y<min_integer:
                return 0
            return y
        else :
            y = int(y[-1:0:-1]) *-1
            if y>max_integer or y<min_integer:
                return 0
            return y