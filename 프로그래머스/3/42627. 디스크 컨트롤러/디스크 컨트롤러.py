import heapq

def solution(jobs):
    # 작업 번호 추가: [(요청시각, 소요시간, 작업번호)]
    jobs = sorted([(s, l, i) for i, (s, l) in enumerate(jobs)])
    
    n = len(jobs)
    i = 0             # jobs 인덱스
    now = 0           # 현재 시간
    heap = []
    total_turnaround = 0

    while i < n or heap:
        # 현재 시점까지 들어온 작업들을 힙에 넣기
        while i < n and jobs[i][0] <= now:
            s, l, idx = jobs[i]
            heapq.heappush(heap, (l, s, idx))  # 우선순위: 소요시간 > 요청시각 > 작업번호
            i += 1

        if heap:
            l, s, idx = heapq.heappop(heap)
            now += l  # 작업 수행
            total_turnaround += now - s  # 종료시각 - 요청시각
        else:
            # 실행 가능한 작업이 없으면, 다음 작업 시간으로 점프
            now = jobs[i][0]

    return total_turnaround // n  # 평균 반환 시간 (정수 부분만)