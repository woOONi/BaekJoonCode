class Solution:
    def getCommon(self, nums1: List[int], nums2: List[int]) -> int:
        tmp = set(nums1).intersection(set(nums2))
        return min(tmp) if len(tmp)>0 else -1