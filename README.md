# 리버스 프록시 nginx 템플릿

## 구성되어있는 설정
* jenkins (호스트 젠킨스 기준 설정, 없을 경우 restart.sh에서 관련 볼륨 마운트 해제 필요, 포트 8081기준)

## 스크립트

### 스크립트 실행 권한 추가
* `chmod +x *.sh`

### nginx 컨테이너 시작 or 재시작 (삭제후 시작)
* `./restart.sh`

### nginx 설정 리로드
* `./reload.sh`

### nginx 설정 검사
* `./check.sh`

