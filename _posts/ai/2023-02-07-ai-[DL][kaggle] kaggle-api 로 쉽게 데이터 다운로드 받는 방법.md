---
layout: single
title: "[DL] 이미지보강(ImageDataGenerator)"
categories:
  - ai

toc: ture
toc_sticky: true
---

<!-- 위는 머릿말임 아래부터 포스트 본문 -->

# [DL][kaggle] kaggle-api 로 쉽게 데이터 다운로드 받는 방법

## 1️⃣ Kaggle -api

kaggle competition 하면 데이터를 필수적으로 다운로드 해야한다.

이때 일일히 다운로드 하여 파일 옮기는 과정이 너무 귀찮은 와중 아래 커맨드 가 눈에 들어왔다.

![Untitled](%5BDL%5D%5Bkaggle%5D%20kaggle-api%20%E1%84%85%E1%85%A9%20%E1%84%89%E1%85%B1%E1%86%B8%E1%84%80%E1%85%A6%20%E1%84%83%E1%85%A6%E1%84%8B%E1%85%B5%E1%84%90%E1%85%A5%20%E1%84%83%E1%85%A1%E1%84%8B%E1%85%AE%E1%86%AB%E1%84%85%E1%85%A9%E1%84%83%E1%85%B3%20%20f2339a3542b246d48b1f2428951b0ec9/Untitled.png)

조금 찾아보니 이것은 kaggle-api 를 이용한 명령어로

단순히 명령어만 치면 손쉽게 케글 데이터를 다운로드 해주기 때문에 매우매우 편하다고한다.

따라서 kaggle-api 를 한번 사용해보도록 하자!

## 2️⃣ 다운로드 방법

[https://github.com/Kaggle/kaggle-api](https://github.com/Kaggle/kaggle-api)

케글 공식 깃허브 레퍼지토리에 잘 설명이 되어있다. 아래의 명령어로 작동한다.

1. 케글 다운로드

```bash
pip install kaggle
```

## 3️⃣ 에러

 

다운로드 후 케글 api 를 사용 하려고 해도 아래의 오류가 발생할 것이다.

```bash
Make sure it's located in /root/.kaggle. Or use the environment method.
```

## 4️⃣ 해결방법

이는 /root/.kaggle 경로에 kaggle.json 파일을 위치 시키면 해결된다.

kaggle.json 파일을 다운로드 받는 방법은 아래 링크를 참조한다.

[kaggle API로 데이터 받는 법, OSError: Could not find kaggle.json. 해결](https://freshrimpsushi.github.io/posts/how-to-fix-oserror-could-not-find-kaggle.json/)