class Solution:
    def reorderLogFiles(self, logs: List[str]) -> List[str]:
        # 숫자로그와 문자로그를 구분하자
        letters, digits = [], []
        for log in logs:
            if log.split()[1].isdigit():
                digits.append(log)
            else:
                letters.append(log)
        
        # 2키를 람다 표현식으로 정렬하기
        # 문자로그는 사전식으로 글자 순서대로 정렬
        letters.sort(key = lambda x : (x.split()[1:], x.split()[0]))
        # x.split()[1:] : 식별자를 제외한 문자열 비교 sort
        # 만약 동일한 경우 후순위로 x.split()[0]식별자를 지정하여 정렬
        return letters + digits