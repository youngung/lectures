**데이터 재료과학**

국립창원대학교 재료금속공학과 [정영웅](mailto:yjeong@changwon.ac.kr)

# 수업 목표

# 주차별 내용

# 1주 (개요, 설치, 변수 및 연산자)
## 수업 01-1
 - 목표
   * 수업 개요 및 진행, 규칙 설명
 - Orientation
   * 수업 개론
   * 수업 내용 소개
   * 수업 진행 방식
       - 개념 설명
       - 실습
         + 반드시 스스로 실습하기 원칙
         + 물에 몸을 담그지 않고 수영을 배울 수 없다.
         + 스스로 실습하지 않고서는 배울 수 없음.
       - 반드시 개인용 컴퓨터 필요 - 실습
         + 없다면 학교에서 대여
         + 친구/가족에게 빌리거나, 구매 필요함.
         + 그외 기타 사정으로 수업을 듣고 싶으나 노트북 준비가 어렵다면
           교수에게 상담 요청하시오.
 - 평가 방법
   * 출석과 결석
   * 중간/기말 평가
 - 과제
   * 파이썬 설치 및 환경 설정 완성 (Python 3.12, JuPyter, VS code, pip)
## 수업 01-2
 - 오늘 목표
   * 파이썬 설치 및 환경 설정 완성 (Python 3.12, JuPyter, VS code, pip)
   * VS code에서 JuPyter 셋업 & 구동할 수 있다.
   * Hello, world
   * 실습 예시를 모두 이해하고 풀 수 있다.
   * 'Traceback'이해하고 대처할 수 있다.
 - 수업 내용
   * Jupyter notebook 간단한 키조작 가능
   * 셀(cell) 만들기, 지우기, 입력, 이동(navigation)
      + 코드 셀
      + Markdown 셀
   * 주석(comment)과 명령문(statement) 구분하기
   * 변수 선언과 자료형 (```int```, ```float```, ```str```, ```bool```) 이해하기
   * 연산자 이해하기
      + 산술 연산자 (더하기, 빼기, 곱하기, 나누기, 지수, 나머지, 몫 ... )
      + 비교 연산자 (==, !=, <, >, >=, <=, is, is not, in, not in)
      + 논리 연산자 (and or)
```python
# 1. 값 비교
print(5 == 5)       # True (값이 같음)
print(5 != 3)       # True (값이 다름)
print(7 > 2)        # True (7이 2보다 큼)
print(3 < 7)        # True (3이 7보다 작음)
print(5 >= 5)       # True (5가 5보다 크거나 같음)
print(4 <= 6)       # True (4가 6보다 작거나 같음)

# 2. 객체 동일성 비교
a = [1, 2, 3]
b = [1, 2, 3]
c = a

print(a == b)       # True  (값이 같음)
print(a is b)       # False (메모리 주소 다름)
print(a is c)       # True  (같은 객체)
print(a is not b)   # True  (다른 객체)

# 3. 포함 여부
text = "Fe2O3"
print("F" in text)      # True  ('a'가 문자열에 포함됨)
print("O" not in text)  # True  ('z'가 문자열에 없음)

numbers = [1, 2, 3]
print(2 in numbers)     # True  (리스트에 2가 포함됨)
print(5 not in numbers) # True  (리스트에 5가 없음)
```
 - 실습 예시
   * Hello, world 출력하기
   * pip 활용하여 NumPy 설치하고, package directory 찾기.
   * 인치(inch_leng) 길이를 센치미터(cmeter_leng)로 바꿔서 계산. 센치 미터를 인치로
     계산해보기.
     + 25 cm는 몇 inch인가?
     + 170 cm는 몇 inch인가?
     + 15 inch에다가 50 cm를 더하면 총 길이가 얼마인가?
   * 섭씨(cent_deg)를 화씨(fahr_deg)로, 그리고 화씨(fahr_deg)를 섭씨(cent_deg)로 계산해보기.
```python
## 예시
c = float(input("섭씨 온도: "))
f = c * 9/5 + 32
print(f"{c:.2f}C= {f:.2f}F")
```
     + 섭씨 25도는 화씨로 몇도인가?
     + 화씨 35도는 섭씨 몇도인가?
     + 화씨 20도에 섭씨 -5도를 더하면 화씨와 섭씨로 각각 몇도인가?
   * 한쪽이 30 cm 다른 한변이 40 inch라면 총 면적은 어떻게 되나?
# 2주 (쟈료구조, 제어, 반복)
 - 목표
  * List, Tuple, Dictionary, ~~set~~
  * 조건문과 (conditions), 반복문 (loop) 이해
 ## 수업 02-1
  - list, tuple, dictionary 생성/수정/조회
    + List
       - 리스트 생성
         ```python
         elements = ["H", "He", "Li", "Be"]
         ```

       - 요소 접근 (인덱싱)
         ```python
         print(elements[0])   # H
         ```

    + 요소 변경
       - elements[1] = "Helium"
        ```python
        print(elements)     #elements = ["H", "Helium", "Li", "Be"]
        ```

    + 요소 추가 / 삭제
       ```python
       elements.append("B")   #elements = ["H", "Helium", "Li", "Be", "B"]
       elements.remove("Li")  #elements = ["H", "Helium", "Be", "B"]
       ```

  - ```len```
 ## 수업 02-2
  * ```if```, ```elif```, ```else``` 조건문 이해
  * ```for``` 반복문
  * ```range```, ```range(len([0,1,2,3]))```, ```for i, item in enumerate([3,4,5,6])```
 - 실습 예시
      * 구구단 출력하기 (x단 입력하면 )
      * 주어진 List에서 최대값과 최소값 찾기 (조건문과 loop 활용)
      * 학생 점수 데이터에서, 산술 평균, 최고점과 최저점 학생 이름 찾기 (조건문과 loop 활용)
      * 1부터 100사이의 정수합 구하기 (loop)
# 3주 (함수, class, module; **import** )
 ## 수업 03-1
 * 함수란, 특정한 작업(task)를 수행하는 묶음.
    + basics
     ```def```로 정의하며, 재사용 가능하고(reuseable),
    입력(arguments), 출력(return)값을 가질 수 있습니다.
    입력과 출력이 없는 함수도 있어요.

    ```python
    def add(a, b):
        return a + b
    ```

    ```python
    def sayhi():
        print('Hi')
    ```
    + built-in functions
     A full list of built-in functions: [here](https://docs.python.org/3/library/functions.html)

 * class 란
    ```python
    class Atom:
        def __init__(self,name):
            self.name = name
        def add_density(self,density):
            self.density=density
        def add_structure(self,structure):
            self.structure=structure

    ## usage example
    myFe=Atom()
    myFe.add_density(7.87) #7.87g/cm^3
    myFe.add_structure('BCC')

    myAl=Atom()
    myAl.add_density(2.70)
    myAl.add_structure('FCC')
    ```

 * 여러 함수 만들어 보기
   + 위치 인자 (*args); tuple
   + 키워드 인자 (keyword arguments; **kwargs); dictionary 활용
```python

def get_sum(*args):
    sum=0.
    for arg in args:
        sum=sum+arg
    return sum

get_sum(1,2,3,4,5,6,7) #? what's going to be the correct answer?

def introduce(**kwargs):
    for key, value in kwargs.items():
        print(f"{key}: {value}")

introduce(name="Alice", age=25, country="Korea")
```

# 4주 (file IO / NumPy 01 - 기초 배열(array) 이해)
# 5주 (NumPy 02 - 배열 연산(산술, 내적, 외적), 브로드캐스팅, 그외 기타 함수)
# 6주 (NumPy 03 - Matrix, Determination, Eigen value)
# 7주 (중간고사)
# 8주 (Matplotlib 01)
# 9주 (Matplotlib 02)
# 10주 (Matplotlib + NumPy 01)
# 11주 (Matplotlib + NumPy 02)
# 12주 (Matplotlib + NumPy 03 + File I/O)
# 13주 (내삽과 외삽, 선형회귀)
 - 실습 예시
    * 금속 합금 조성 (Cu %) vs 전기 전도도
```python
import numpy as np
import matplotlib.pyplot as plt

# 예제: 금속 합금 조성(Cu %) vs 전기 전도도
x = np.array([0, 5, 10, 15, 20])
y = np.array([58, 55, 50, 45, 42])  # 전도도 W/mK

plt.scatter(x, y, color='b', label='Data')
plt.xlabel("Cu content [%]")
plt.ylabel("Electrical Conductivity [W/mK]")
plt.title("Conductivity vs Cu content")
plt.grid(True)
plt.legend()
plt.show()
```
# 14주
# 15주
