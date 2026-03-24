# VM Flag 찾기

## 사용 도구
- Claude Cowork (AI 도구), Opus 4.6 모델

## 분석 방법

각 VM의 `.vmdk` 파일(가상 디스크 이미지)을 Claude Cowork에 넣고, 디스크 내부 데이터를 추출한 뒤 `FLAG{` 패턴을 검색하여 플래그를 찾았다.

VM에 직접 로그인하지 않고 디스크 이미지를 직접 분석하는 포렌식 방식을 사용했다.

### 과정
1. `.vmdk` 파일을 Claude Cowork에 전달
2. VMDK 내부의 압축된 데이터를 해제하여 raw 디스크 이미지로 변환
3. `strings` 명령어로 디스크 이미지에서 문자열 추출
4. `grep "FLAG{"` 으로 플래그 검색

### 사용한 프롬프트
```
.vmdk 파일들을 분석해서 플래그를 찾아
```

## 결과

| VM | 플래그 |
|---|---|
| VM1 | `FLAG{U_01_ROOT_SSH}` |
| VM2 | `FLAG{U_16_PASSWD}` |
| VM3 (proxynova's computer) | `FLAG{U_18_WITH_CS}` |
