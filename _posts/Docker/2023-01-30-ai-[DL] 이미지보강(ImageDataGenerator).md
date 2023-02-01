---
layout: single
title: "[DL] 이미지보강(ImageDataGenerator)"
categories:
  - ai

toc: ture
toc_sticky: true
---

<!-- 위는 머릿말임 아래부터 포스트 본문 -->

### 1. ****ImageDataGenerator****

ImageDataGenerator는 실시간 데이터 증대에 사용되는 Keras 딥 러닝 라이브러리의 클래스입니다. 

### 2. 이미지보강을 해야하는 이유

1. 데이터 확대: ImageDataGenerator는 회전, 이동, 배율 조정, 뒤집기, 확대/축소와 같은 데이터 세트의 이미지에 무작위 변환을 적용하여 작은 데이터 세트의 크기를 인위적으로 늘리는 데 사용할 수 있습니다. 이는 모델이 훈련 중에 동일한 이미지의 다양한 변형을 볼 수 있으므로 과적합을 방지하는 데 도움이 되어 더욱 강력하고 일반화할 수 있습니다.
2. 메모리 관리: 큰 이미지 데이터 세트로 작업할 때 모든 이미지를 메모리에 맞추지 못할 수 있습니다. ImageDataGenerator를 사용하면 이미지 데이터 배치를 즉석에서 생성하여 메모리 공간을 줄이고 대규모 데이터 세트에서 딥 러닝 모델을 교육할 수 있습니다.
3. 실시간 데이터 전처리: ImageDataGenerator는 픽셀 값을 표준 범위로 재조정하고, 이미지를 RGB에서 그레이스케일로 변환하고, 데이터를 정규화하는 등 실시간으로 이미지를 전처리하는 데에도 사용할 수 있습니다. 이렇게 하면 전체 데이터 세트를 사전에 전처리하는 것과 비교하여 상당한 시간을 절약할 수 있습니다.

### 3. keras 에서의 ****ImageDataGenerator 사용방법****

```python
from keras.preprocessing.image import ImageDataGenerator

# Initialize the ImageDataGenerator with data augmentation parameters
data_gen = ImageDataGenerator(rescale=1./255,
                              rotation_range=45,
                              width_shift_range=0.2,
                              height_shift_range=0.2,
                              shear_range=0.2,
                              zoom_range=0.2,
                              horizontal_flip=True)
```

- **`rescale`**
    
    : 0과 1 사이에서 이미지의 픽셀 값을 스케일링하는 부동 소수점 값.
    
    위 예시에서는 (224,224)의 대상 크기로 조정
    
- **`rotation_range`**
    
    : 이미지를 임의로 회전하기 위한 도 단위의 정수 값(0-180).
    
- **`width_shift_range`**
- **`height_shift_range`**
    
    : 이미지를 임의로 이동하기 위해 전체 너비/높이의 일부로 float 을 사용합니다.
    
- **`shear_range`**
    
    : 무작위 기울기를 적용하기 위한 라디안 단위의 float.
    
- **`zoom_range`**
    
    : float 으로 이미지를 무작위로 확대/축소합니다.
    
- **`horizontal_flip`**
    
    : 이미지를 가로로 임의로 뒤집는 불 값입니다.
    
- **`vertical_flip`**
    
    : 이미지를 세로로 임의로 뒤집는 불 값입니다.
    
- **`fill_mode`**
    
    : 새로 생성된 픽셀을 채우는 데 사용되는 모드
    
     "constant", "nearest", "reflect","wrap" 가 인수값으로 사용됩니다.
    
    1. **`"constant"`**
        
        : 인수로 지정된 상수 값으로 채웁니다 .
        
         인수는 ex) cival = k  이런식으로 추가작성이 필요합니다.
        
    2. **`"nearest"`**
        
        : 원본 이미지에서 가장 가까운 픽셀 값으로 채웁니다.
        
    3. **`"reflect"`**
        
        : 이미지 가장자리의 값을 반영하여 채웁니다.
        
    4. **`"wrap"`**
        
        : 이미지의 반대쪽 가장자리부터 값을 래핑하여 채웁니다.