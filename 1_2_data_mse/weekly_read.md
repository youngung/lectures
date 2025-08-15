**데이터 재료과학**

국립창원대학교 재료금속공학과 [정영웅](mailto:yjeong@changwon.ac.kr)

# 수업 목표
 - 최신 데이터 기반의 재료공학 이해를 위한 기초 Python & JuPyter 활용 능력 기초
 - 기초 Python 이해를 바탕으로, 재료공학적 문제 해결에 응용
# 주차별 내용

# Week1 (개요, 설치, 변수 및 연산자)
## 수업 01-1
 - 목표
   + 수업 개요 및 진행, 규칙 설명
 - Orientation
   + 수업 개론
   + 수업 내용 소개
   + 수업 진행 방식
 - 개념 설명
 - 실습
   + 반드시 스스로 실습하기 원칙
   + 물에 몸을 담그지 않고 수영을 배울 수 없다.
   + 스스로 실습하지 않고서는 배울 수 없음.
     * 반드시 개인용 컴퓨터 필요 - 실습
     * 없다면 학교에서 대여
   + 친구/가족에게 빌리거나, 구매 필요함.
   + 그외 기타 사정으로 수업을 듣고 싶으나 노트북 준비가 어렵다면
          교수에게 상담 요청하시오.
 - 평가 방법
   + 출석과 결석
   + 중간/기말 평가
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
   * 세륨의 평균 원자량 계산 (Fundamentals of Materials Science and Engineering, Calister 예제 2.1)
     ```python
     #세륨의 동위원소는 4가지 존재한다:
     # 각 동위원소의 분율은 아래와 같다.
     Ce136_f =  0.185  #[%]
     Ce138_f =  0.251  #[%]
     Ce140_f = 88.450  #[%]
     Ce142_f = 11.114  #[%]
     # 각 동위원소의 원자량은 아래와 같다.
     Ce136_w = 135.907 #[amu.]
     Ce138_w = 137.906 #[amu.]
     Ce140_w = 139.905 #[amu.]
     Ce142_w = 141.909 #[amu.]

     # 세륨의 평균 원자량은 얼마인가?
     ```
     가상의 원소 M의 평균 원자량 구하는 방법
     $$
     \bar{A}_M=\sum_if_{i_M}A_{i_M}
     $$

     단순 평균이라면...
     $$\frac{w^{^{136}Ce}+w^{^{138}Ce}+w^{^{140}Ce}+w^{^{142}Ce}}{4}$$
     로 구했겠지만, 서로 다른량이 존재하므로 주어진 분율을 활용해야겠다. 즉
     $$\frac{w^{^{136}Ce}f^{^{136}Ce}+w^{^{138}Ce}f^{^{138}Ce}+w^{^{140}Ce}f^{^{140}Ce}+w^{^{142}Ce}f^{^{142}Ce}}{f^{^{136}Ce}+f^{^{138}Ce}+f^{^{140}Ce}+f^{^{142}Ce}}$$


# Week2 (자료구조, 제어, 반복)
 - 목표
  + List, Tuple, Dictionary, set
  + 조건문과 (conditions), 반복문 (loop) 이해
## 수업 02-1
 - list, tuple, dictionary 생성/수정/조회
  + List
     * 특징:
       + 수정 가능(mutable): 추가, 삭제, 변경 가능
       + 중복 허용
       + 순서 있음 (ordered)
       + 여러 자료형 혼합해서 저장 가능
     * 리스트 생성 - 대괄호 사용 ```[]```
       ```python
       elements = ["H", "He", "Li", "Be"]
       ```
     * 요소 접근 (인덱싱; indexing); 0에서 부터 시작
       ```python
       print(elements[0])   # H
       ```
     * 요소 변경
       ```python
       elements[1] = "Helium"
       print(elements)     #elements = ["H", "Helium", "Li", "Be"]
       ```
     * 요소 추가 / 삭제
       ```python
       elements.append("B")   #elements = ["H", "Helium", "Li", "Be", "B"]
       elements.remove("Li")  #elements = ["H", "Helium", "Be", "B"]
       ```
     * 중복 허용
       ```python
       elements = ['H','He','H']
       print(elements)
       ```
     * 여러 자료형 혼합
       ```python
       myList=['H',203,2.3,['H','He']]
       myMatrix=[[1,2,3],[4,5,6],[7,8,9]] ##중첩된 리스트
       ```
     * 언패킹 (unpacking)
       ```python
       a,b,c,d=[1,3,4,5]
       ```

  + tuple
     * 특징
       + 수정 불가능 (immutable); 한번 만들어지면 이후 변경 불가능
       + 중복 허용
       + 순서 있음
       + 여러 자료형 혼합해서 저장 가능
     * 튜플 생성 - 소괄호 ```()``` 사용
       ```python
       colors = ("red", "green", "blue")
       # 요소 접근
       print(colors[1])   # green

       # 변경 불가 → 아래 코드는 오류 발생
       # colors[1] = "yellow"

       # 튜플 언패킹
       r, g, b = colors
       print(r, g, b)     # red green blue
       ```
  + set
    * 특징
      + 중복제거: 같은 값이 입력되어도 하나만 남게 됨
      + 순서없음
      + 인덱싱 불가: list나 tuple과 다름
      + 수정 가능 (mutable)
      + 원소의 타입에 제한 **있음**:
      + 실습1: 생성
        ```python
        # 중괄호 {} 사용
        s1 = {1, 2, 3}
        print(s1)  # {1, 2, 3}

        # set() 함수 사용
        s2 = set([1, 2, 2, 3])
        print(s2)  # {1, 2, 3} (중복 제거)

        # 빈 set 생성 시는 set()만 가능
        empty_set = set()
        print(empty_set)  # set()
        ```
      + 실습2: 변경
        ```python
        s = {1, 2, 3}

        # 추가
        s.add(4)           # {1, 2, 3, 4}
        s.update([5, 6])   # {1, 2, 3, 4, 5, 6} (여러 개 추가)

        # 삭제
        s.remove(3)        # {1, 2, 4, 5, 6} (없는 값 제거 시 오류 발생)
        s.discard(10)      # 없는 값 제거해도 오류 없음
        s.pop()            # 임의의 값 제거 후 반환 (순서 없으니 랜덤)
        ```

  + ```len``` built-in function중 하나
    ```python
    a=[3,4,5,'a','b']
    len(a) # 정수 5
    ```
  - List slicing
  - 1족 원소 기호를 순서대로 포함한 리스트 만들기 (수소, 리튬, 나트륨, 칼륨, 루비듐, 세슘, 프랑슘)
  - 실습 예시
    * Calister 예제 2.1)
        ```python
        #세륨의 동위원소는 4가지 존재한다:
        # 각 동위원소의 분율은 아래와 같다.
        Ce_f= [0.185, 0.251, 88.450, 11.114]  #[%]
        # 각 동위원소의 원자량은 아래와 같다.
        Ce_w = [135.907, 137.906, 139.905, 141.909]
        # 세륨의 평균 원자량은 얼마인가?
        avg=(Ce_f[0]*Ce_w[0]+ Ce_f[1]*Ce_w+[1]+ Ce_f[2]*Ce_w+[2]+ Ce_f[3]*Ce_w+[3])/(Ce_f[0]+Ce_f[1]+Ce_f[2]+Ce_f[3])
        ## average
        print(avg)
        ```


## 수업 02-2
 - ```if```, ```elif```, ```else``` 조건문 이해
    * 기본 구조
    ```python
    if 조건식:
        실행할 명령문1
        실행할 명령문2
        ...
    elif 다른조건식:
        실행할 명령문1
        실행할 명령문2
        ...
    else:
        실행할 명령문1
        실행할 명령문2
        ...
    ```
    * 주의
      + indent, dedent 에 주의!!
      + 콜론 기호 ':' 빼먹지 말 것!
    * 예시
      + 예1
        ```python
        # 예: 순수 알루미늄의 녹는점
        melting_point = 660  #Celcius degree
        temperature = 700    #Celcius degree

        if temperature < melting_point:
            print("Solid state")
        elif temperature == melting_point:
            print("Solid and liquid co-exist")
        else:
            print("Liquid state")
        ```

 - ```for``` 반복문
    * 기초 설명
      파이썬의 for 반복문은 **순서가 있는 데이터(시퀀스)**나 **반복 가능한 객체(iterable)**를 순차적으로 꺼내면서 코드를 실행하는 구문.
    * 기본 구조
       ```python
       for 변수 in 반복가능객체:
            실행할 명령문1
            실행할 명령문2
            ...
       ```
    * 대표적으로 **순서가 있는 데이터 시쿼스**로는 List, Tuple, Dictionary 타입의 변수가 있다.
      + 예1
       ```python
       a=[3,4,5] #list type
       for e in a:
           print(e)
       ```
      + 예2
       ```python
       a=('3',[34343],5) # tuple type
       for e in a:
           print(e)
       ```
      + 예3
       ```python
       a=dict(a='b',b='1',d=3,z=[]) # dictionary (Python 3.7>)
       for e in a:
           print(e)
       ```
    * 주의
      + indent, dedent 에 주의!!
      + 콜론 기호 ':' 빼먹지 말 것!

 - Built-in function인 ```range```, ```len```를 ```for```와 함께 조합!
    * 개념
      + ```len()``` -> 시퀀스 (List, 문자열, 튜플 등)의 **길이(요소 개수)**를 반환
      + ```range()``` → 지정한 범위의 숫자 시퀀스를 생성 (반복문에서 자주 사용)
      + 둘을 함께 쓰면 인덱스 기반 반복이 가능
      + 예시
         - 예시1
            ```python
            fruits = ["apple", "banana", "cherry"]

            for i in range(len(fruits)):  # 0 ~ len(fruits)-1
                print(f"Index {i}: {fruits[i]}")
            ```
         - 예시 2
            ```python
            specimen_lengths = [10.0, 12.3, 9.8, 11.5]  # cm

            for i in range(len(specimen_lengths)):
                length = specimen_lengths[i]
                print(f"Specimen {i+1}: {length} cm")
            ```
         - 예시 3
            ```python
            word = "steel"

            for i in range(len(word)):
                print(f"Index {i} → {word[i]}")
            ```

 - 실습 예시
      * 구구단 출력하기 (x단 입력하면 ... )
      * 학생 점수 데이터에서, 산술 평균, 최고점과 최저점 학생 이름 찾기 (조건문과 loop 활용)
      * 1부터 100사이의 정수합 구하기 (loop)
      * 주어진 List에서 최대값과 최소값 찾기 (조건문과 loop 활용)
      * 주양자수 $n$에 의해 결정되는 부 양자수 $l,m_l$ 출력하기.
        ```python
        # Calister 책의 표 2.1
        n=3 ## 주양자수,
        print('n:',n)
        no_electrons=0
        for l_value in range(0, n): # 0, 1, .., (n-1) 까지
            print('\tl:',l_value) #주의 '\t' string은 키보드의 탭기호를 뜻한다.
            low=-l_value
            up=+l_value
            print('\t\tml:',)
            for i in range(low,up+1): # -l, -l+1, ... 1, 0, 1, ... l-1, l
                print('\t\t\t',i)
                no_electrons=no_electrons+2 # 각 state마다 up/down spin 전자, 따라서 2개씩.
        print('total number of electrons:',no_electrons)
        ```
# Week3 (함수, class, module; **import** )
 - 목표
  + 함수와 클래스, 그리고 모듈의 이해
  + 함수를 만들어, 모듈화 시키고 CLI에서 실행할 수 있다.
 ## 수업 03-1
 - 함수란, 특정한 작업(task)를 수행하는 묶음.
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

 - class 란
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

 - 여러 함수 만들어 보기
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
## 수업 03-2
 - CLI (command-line interface)
 - 모듈화 (modularization)
   + 프로그램을 기능별로 나뉘어 파일(모듈)로 분리
   + 코드 재사용성(reuseability) 향상, 유지보수 용이, 협업시 효율성 증가
   + 모듈(module)은 ```.py``` 파일을 가르킨다.
   + 패키지는 여러 모듈의 모임이다.
   + 라이브러리(library)는 모듈과 패키지의 모임.
 - 예시/실습
   + ex 01: 가장 간단한 모듈화
    ```python
    # 아래 모듈을 작성 후 mymodule.py로 저장하자.
    def add(a, b):
        return a + b

    def multiply(a, b):
        return a * b
    ```
    그 다음 아래를 활용해 mymodule을 불러와 보자.
    ```python
    import mymodel
    mymodule.add(3,4)
    mymodule.multiply(3,4)
    ```

   + ex 02: CLI에서 arguments 받기
    ```python
    # file: ex02.py
    import sys

    if __name__ == "__main__":
        print("Arguments:", sys.argv)
    ```
    Arguments의 역할을 이해하기 위해서 아래 실행

     - (Windows 환경 예시)
     ```sh
     c:\users\user\repo\mse> python ex02.py a b c 1 2 3
     ```
     - (MacOS/Linux 환경 예시)
     ```sh
     ~/repo/mse $ python ex02.py a b c 1 2 3
     ```

    실행 후 출력 결과 살펴보기



# Week4 (file IO / NumPy 01 - 기초 배열(array) 이해)
# Week5 (NumPy 02 - 배열 연산(산술, 내적, 외적), 브로드캐스팅, 그외 기타 함수)
# Week6 (NumPy 03 - Matrix, Determination, Eigen value)
# Week7 (중간고사)
# Week8 (Matplotlib 01)
# Week9 (Matplotlib 02)
# Week10 (Matplotlib + NumPy 01 + Slicing)
# Week11 (Matplotlib + NumPy 02 + FILE I/O)
# Week12 (Matplotlib + NumPy 03 + File I/O)
# Week13 (내삽과 외삽, 선형회귀)
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
# Week14
# Week15 (기말고사)
s