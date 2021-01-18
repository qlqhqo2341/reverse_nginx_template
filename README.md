# 리버스 프록시 nginx 템플릿

## 구성되어있는 설정
* 8080 샘플
* 8081 jenkins (호스트 젠킨스 기준 설정, 없을 경우 restart.sh에서 관련 볼륨 마운트 해제 필요)
* 8082 nextcloud (by docker)
* 8083 webdav 서버 (by docker)
* 8084 transmission 서버 (by docker)
* 8085 code-server 연결
* 게이트웨이(ip지정) 공유기 관리자 페이지 연결


## 스크립트

### 스크립트 실행 권한 추가
* `chmod +x *.sh`

### nginx 컨테이너 시작 or 재시작 (삭제후 시작)
* `./restart.sh`

### nginx 설정 리로드
* `./reload.sh`

### nginx 설정 검사
* `./check.sh`

