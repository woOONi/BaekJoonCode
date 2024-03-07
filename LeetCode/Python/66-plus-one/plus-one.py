class Solution:
    def plusOne(self, digits: List[int]) -> List[int]:
        tmp = 0
        for i in range(len(digits)):
            tmp += int(digits[i]) * (10 ** (len(digits)-i-1))
        
        tmp += 1
        tmp = str(tmp)
        tmp_list = []
        for i in range(len(tmp)):
            tmp_list.append(int(tmp[i]))

        return tmp_list