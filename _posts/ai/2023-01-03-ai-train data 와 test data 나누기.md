---
layout: single
title: "[DL] train data 와 test data 나누기"
categories:
  - ai

toc: ture
toc_sticky: true
---

<!-- 위는 머릿말임 아래부터 포스트 본문 -->


### 1. train data 와 test 데이터를 나눠야 하는 이유

sklearn에서 훈련 데이터와 테스트 데이터를 나누는 이유는 기계 학습 알고리즘의 성능을 정확하게 측정하기 위함입니다. 기계 학습 알고리즘은 주어진 훈련 데이터를 이용해 학습을 진행한 후, 새로운 입력에 대해 정확한 출력을 예측할 수 있게 됩니다. 그러나 이 기계 학습 알고리즘이 실제로 얼마나 정확한지는 알기 어렵습니다. 이러한 이유로 기계 학습 알고리즘의 성능을 측정할 때는 일반적으로 훈련 데이터와 테스트 데이터를 나누어 사용합니다. 훈련 데이터는 알고리즘을 학습시키기 위해 사용하고, 테스트 데이터는 알고리즘의 성능을 측정하기 위해 사용합니다. 이렇게 하면 알고리즘이 새로운 입력에 대해 정확한 예측을 할 수 있는지 알 수 있습니다.

라고 chatGPT 님이 말씀하시네요…결론은 

“**새로운 입력에 대해 정확한 예측을 하기 위함입니다.**

### 2. train_test_split

skleran 의 train_test_split 함수는 쉽게 test 와 train 데이터를 분리 해 줍니다.

**`train_test_splitsklearn.model_selection`**입력 데이터 세트를 학습 세트와 테스트 세트로 분할하는 모듈 의 함수입니다 . 일반적으로 기계 학습 워크플로에서 보이지 않는 데이터에 대한 모델의 성능을 평가하는 데 사용됩니다. 사용 방법은 다음과 같습니다.

```python
from sklearn.model_selection import train_test_split
# X is your input dataset, y is the target variable
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
```

인수의 의미는 다음과 같습니다.

- **`X`**
    
    : 이것은 numpy 배열 또는 Pandas 데이터 프레임일 수 있는 입력 데이터 세트입니다.
    
- **`y`**
    
    : 이것은 numpy 배열 또는 Pandas 시리즈가 될 수 있는 대상 변수입니다.
    
- **`test_sizetest_size=0.2`**
    
    : 테스트 세트의 크기를 지정합니다. 예를 들어 를 설정
    
    하면 함수는 테스트 세트용으로 데이터의 20%를 따로 설정하고 나머지 80%를 학습 세트용으로 사용합니다.
    
- **`random_state`**
    
    : 난수 생성기의 시드를 설정하는 선택적 인수입니다. 학습/테스트 분할을 재현할 수 있는지 확인하려는 경우에 유용합니다.
    

이 코드를 실행한 후 **`X_train`**및 **`y_train`**변수에는 훈련 세트가 포함되고 **`X_test`**및 **`y_test`**변수에는 테스트 세트가 포함됩니다. 그런 다음 이 세트를 사용하여 모델을 훈련하고 평가할 수 있습니다.

### 3. 실제로 적용해보기

```python
# 2.데이터 정의
x = np.array([1,2,3,4,5,6,7,8,9,10]) 
y= np.array(range(10))

x_train, x_test, y_train, y_test = train_test_split(x, 
                                                    y, 
                                                    test_size = 0.3, 
                                                    shuffle = True, 
                                                    random_state = 21)

print(x_train)
print(y_train)

print(x_test)
print(y_test)
```

```python
[ 4  6  7  1  5  9 10]
[3 5 6 0 4 8 9]
[2 3 8]
[1 2 7]
```

랜덤 으로 x_train 과 x_test 를 7: 3 (test_size = 3) 비율로 분할 한 모습입니다. 

깔끔하게 7:3 랜덤 숫자로 분할 된 모습을 보니까 마음이 편안해집니다…
