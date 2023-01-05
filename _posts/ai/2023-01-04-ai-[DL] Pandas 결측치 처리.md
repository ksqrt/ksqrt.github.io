---
layout: single
title: "[DL] Pandas 결측치 처리"
categories:
  - ai

toc: ture
toc_sticky: true
---

<!-- 위는 머릿말임 아래부터 포스트 본문 -->

### 1. 결측치란 ?

결측치란, 자료가 없거나 잘못 기입되어 수치가 없거나 없을 수 있는 값을 의미합니다.

결측치가 있는 자료는 일반적으로 수학적 계산이나 통계적 분석을 적용할 수 없습니다. 이는 결측치가 있는 자료로부터 유의미한 결과를 얻기 어려울 수 있기 때문입니다. 예를 들어, 일부 관측치가 없는 자료로부터 평균값을 구할 경우, 관측치가 없는 값을 제외한 값들의 평균값을 얻게 될 것입니다. 이는 실제 관측된 값들의 평균값과 차이가 있을 수 있습니다. 이러한 이유로 결측치를 처리해야 합니다.

결측치를 처리하는 것은 자료의 질을 향상시키고, 자료로부터 추출할 수 있는 정보를 늘리기 위한 작업입니다. 결측치가 있는 자료로부터 추출할 수 있는 정보는 결측치가 없는 자료로부터 추출할 수 있는 정보보다 적게 추출될 수 있습니다.

### 2. Pandas 로 결측치 처리하는방법

pandas에서는 결측치를 처리하기 위한 여러 기능을 제공합니다.

1. **`.isnull()`**

   : 누락된 값을 나타내는 불린 마스크를 반환합니다.

   결측치 있을시 True 없으면 false

2. **`.notnull()`**

   :**`.isnull()`** 의 반대를 반환합니다.

3. **`.dropna()`**

   : 누락된 값이 제거된 새 DataFrame을 반환합니다.

4. **`.fillna()`**

   : 누락된 값이 채워지거나 대치된 새 DataFrame을 반환합니다.

다음은 이러한 기능을 사용하는 방법에 대한 몇 가지 예입니다.

```python
import pandas as pd

# Create a sample dataframe with missing values
df = pd.DataFrame({'A': [1, 2, 3, 4],
									 'B': [5, 6, None, 8],
									 'C': [9, None, None, 12]})

# Display the dataframe
df
   A     B     C
0  1   5.0   9.0
1  2   6.0   NaN
2  3   NaN   NaN
3  4   8.0  12.0

# Check which values are missing
df.isnull()
       A      B      C
0  False  False  False
1  False  False   True
2  False   True   True
3  False  False  False

# Drop rows with any missing values
df.dropna()
   A     B     C
0  1   5.0   9.0
3  4   8.0  12.0

# Fill missing values with a scalar value
df.fillna(0)
   A     B     C
0  1   5.0   9.0
1  2   6.0   0.0
2  3   0.0   0.0
3  4   8.0  12.0

# Use a different fill value for each column
df.fillna({'A': 0, 'B': 100, 'C': 200})
   A      B      C
0  1    5.0    9.0
1  2    6.0  200.0
2  3  100.0  200.0
3  4    8.0   12.0
```
