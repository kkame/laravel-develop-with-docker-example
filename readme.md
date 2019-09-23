## 도커로 개발환경 구축하기 - Laravel Example

이 레포지터리는 도커로 라라벨의 개발환경을 구성하면서 Traefik을 앞에 사용하여 호스트에 포트를 노출해야 하는 것을 최소화 하는 예제를 보여줍니다.

또 도커로 환경을 구성하면 Host머신에서는 존재하지 않는 사용자 계정으로 인해 또는 root로 생성되는 파일로 인해 호스트에서 발생하는 권한문제를 해결하는 예제를 포함합니다

### Installation

이 예제는 [traefik-develop-with-docker-example](https://github.com/kkame/traefik-develop-with-docker-example)을 이미 구축하였다고 가정하고 시작됩니다.

만약 도커에 Traefik이 설치되어 있지 않으신 분은 해당 레포지터리를 통해 Traefik을 먼저 설치하고 시작해주세요

(샘플을 다 작업해서 넣어두려다가 실제프로젝트를 직접 구성할 때 어떤일이 일어나는지 이해를 돕기 위해 직접 수정하도록 해뒀습니다)

#### 0. 환경설정 파일 생성

이 예제는 라라벨과 환경변수 설정을 어느정도 쉐어하도록 되어있습니다.

따라서 시작하기전에 환경설정 파일 샘플 파일인 .env.example 파일을 복사하여 .env로 생성하고 필요한 부분들은 수정해줘야 합니다.

```bash
cp .env.example .env
```

- mysql 수정사항
  - `DB_HOST`는 `127.0.0.1`에서 `mysql`로 수정
  - 사용할 환경에 맞게 `DB_DATABASE`, `DB_USERNAME`, `DB_PASSWORD` 값을 등록 또는 수정
- redis 수정사항
  - `REDIS_HOST`의 값을 `127.0.0.1`에서 `redis`로 수정


#### 1. docker-compose 파일 복사 및 수정

```bash
cp docker-compose.sample.yml docker-compose.yml
```
이 파일은 설명할 내용이 많아 해당 yml파일에 최대한 주석을 추가 하였습니다. 해당 파일을 직접 확인해주세요.


### Usage 

도커를 통해서 composer나 artisan을 실행하는 방법

#### 1. 호스트에서 터미널 접근없이 컨테이너로 명령어 전달
```bash
docker-compose exec php composer install
docker-compose exec php artisan ~~~~~
```

#### 2. 호스트에서 컨테이너로 직접 터미널 연결 후 명령어 실행
```bash
docker-compose exec php bash #이 명령어를 통해 도커 내부의 bash로 접근 가능
php artisan ~~~~~ 
exit # 종료시 사용가능합니다. 또는 컨트롤 D를 통해 종료가능
```

### TODO
- PHPUNIT 실행 예제

### License
MIT
