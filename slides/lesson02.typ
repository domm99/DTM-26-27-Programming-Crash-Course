#import "@preview/touying:0.6.1": *
#import themes.metropolis: *
#import "@preview/fontawesome:0.5.0": *
#import "@preview/ctheorems:1.1.3": *
#import "@preview/numbly:0.1.0": numbly
#import "utils.typ": *
#import "@preview/tiaoma:0.3.0"

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
)

#set text(font: "Fira Sans", weight: 350, size: 20pt)
#show math.equation: set text(font: "Fira Math")
#set strong(delta: 200)
#set par(justify: true)

#set quote(block: true)
#show quote: set align(left)
#show quote: set pad(x: 2em, y: -0.8em)

#set raw(tab-size: 4)
#show raw.where(block: true): block.with(
  fill: luma(240),
  inset: 1em,
  radius: 0.7em,
  width: 100%,
)

#show bibliography: set text(size: 0.8em)
#show footnote.entry: it => {
  block(inset: (x: 2em, y: 0.1em))[#text(size: 0.75em)[#it.note.body]]
}

#let fcite(clabel) = {
  footnote(cite(form: "full", label(clabel)))
}

#let author = block(inset: 0.1em)[
  #table(inset: 0.5em, stroke: none, columns: (auto, 4fr),  align: (left, left),
    [#alert[*Davide Domini*]], [`davide.domini@unibo.it`],
  )
  #place(right, dy:-1.5em)[
    #figure(image("images/disi.svg", width:40%))
  ]
]

#let arrow = box[ 
  #figure(image("images/arrow.svg", width: 2%))
]

#title-slide(
  title: "Introduction to Programming Languages",
  subtitle: "Digital Transformation Management @ 2024",
  author: author,
  // date: datetime.today().display("[day] [month repr:long] [year]"),
)


#focus-slide[
  How to approach problems?
]

#slide(title: "Computational Thinking a.k.a Problem Solving")[

#align(center)[
  _#alert[Computational thinking] is a method of #alert[problem-solving] that involves breaking problems down, recognizing patterns, and developing step-by-step solutions, often in ways that a computer can execute._
]

#v(2em)

#arrow It's not just about coding, but about approaching problems #alert[methodically]

]

#slide(title: "Decomposition")[
  #align(center)[
    _#alert[Breaking] a problem into #alert[smaller], more #alert[manageable] sub-problems that are #alert[easier] to solve._
  ]

  #v(2em)

  #arrow *Example:* to build a website, we might break the project into components like front-end, back-end, and database.
]

#slide(title: "Algorithm")[

#align(center)[
  _It's the process of developing #alert[steps] and #alert[rules] that need to be followed in #alert[order] to achieve the desired outcome aka solve the problem. This ensures that other people can replicate the same solution should they ever encounter the same - or similar - problem._
]

]

#slide(title:"Abstraction")[
  #align(center)[
    _Abstraction, also known as #alert[pattern generalization], is the process of seeking out and identifying only the #alert[relevant] information crucial to solving the problem._
  ]

  #v(2em)

  #arrow *Example:* abstracting a car to its key functions (start, stop, steer) without worrying about the intricate mechanics of the engine or transmission.

]

#slide(title:"Pattern Recognition")[
  #align(center)[
    _Recognizing #alert[similarities] or #alert[patterns] in problems, which allows us to reuse existing solutions._

    #v(2em)

    #arrow *Example:* consider a situation where you are asked to develop different programs that work with sequences of numbers: 
      1) finding the maximum number in a list
      2) summing up all numbers in a list, and
      3) finding the average of the numbers in a list.
    Although these problems seem different, they share a common pattern:
    iterating through a list of numbers.
  ]
]

#slide(title: "Branching")[
  #align(center)[
    Branching is a #alert[decision-making] process in which you choose between different paths based on certain #alert[conditions].
  ]

  #v(2em)

  #arrow *Example:* consider how traffic lights control traffic flow. The light system "branches" between different colors (red, yellow, green) based on timing and traffic conditions.
]

#slide(title: "Looping")[
  #align(center)[
    Looping is the process of #alert[repeating] a set of instructions until a #alert[specific condition is met] or for a #alert[predefined number of times].

  ]

  #v(2em)

  #arrow *Example:* consider a washing machine, it repeats cycles (wash, rinse, spin) for a set number of times.
]



#focus-slide[
  What do we need in a programming language?
]

#slide(title: "Variables")[

  - Containers for #alert[storing] data values
  - No need to declare types, Python infers the type
```Python
x = 10
name = "Alice"
is_active = True

```
  - Common #underline[Primitive] Data Types:
    - int: Integer (e.g., ```python x = 10```)
    - float: Floating-point number (e.g., ```python pi = 3.14```)
    - str: String (e.g., ```python name = "Alice"```)
    - bool: Boolean (e.g., ```python is_active = True```)

]

#slide(title: "Are strings primitive data types?")[
  - No, a string is a #alert[sequence of characters] enclosed within single (') or double (") quotes
  - Strings in Python are immutable, meaning once created, they cannot be changed
  - Different ways to declare strings:
    - Single-quoted strings
    - Double-quoted strings
    - Multi-line strings (using triple quotes)
```Python
name = 'Alice'
greeting = "Hello, World!"
message = """This is a
multi-line string."""

```
]

#slide(title: "String Indexing and Slicing")[
  - Strings are indexed starting from 0
```Python
text = "Python"
print(text[0])  # 'P'
print(text[-1])  # 'n' (negative indexing)
```
- Extract a #alert[substring] by specifying a start and end index
```Python
text = "Python"
print(text[0:3])  # 'Pyt'
print(text[1:])   # 'ython'
print(text[:4])   # 'Pyth'
```
]

#slide(title:"Common String Operations")[
  - Joining two or more strings using the + operator.
```python
first_name = "John"
last_name = "Doe"
full_name = first_name + " " + last_name
print(full_name) #John Doe
```

  - Repeat a string using the ```python *``` operator.

```python
word = "Hi! "
print(word * 3)  #'Hi! Hi! Hi!'
```

  - Check if a substring exists within a string using the ```python in``` keyword

```python
message = "Welcome to Python"
print("Python" in message)  #True
```
]

#slide(title:"Methods on Strings")[
```Python
text = "I love Java"
new_text = text.replace("Java", "Python")
print(new_text)  # 'I love Python'

text = "apple,banana,cherry"
fruits = text.split(",")
print(fruits)  # ['apple', 'banana', 'cherry']

words = ["Hello", "world"]
sentence = " ".join(words)
print(sentence)  # 'Hello world'
```
#text(size: 0.85em)[
#arrow And many more! Check out the documentation #link("https://python-reference.readthedocs.io/en/latest/docs/str/")
]

]

#slide(title: "Arithmetic Operators")[

  #components.side-by-side(columns: (1fr, 1fr), gutter: 0em)[
  - ```python + ```: Addition
  - ```python - ```: Subtraction
  - ```python * ```: Multiplication
  - ```python / ```: Division
  - ```python // ```: Floor Division
  - ```python % ```: Modulus (remainder)
  ][
```Python
a = 10 + 5  # 15
c = 7 / 2   #3.5
d = 7 // 2  #3
b = 7 % 2   # 1
```
]

]

#slide(title: "Comparison Operators")[

  #components.side-by-side(columns: (1fr, 1fr), gutter: 0em)[
  - ```python == ```: Equals
  - ```python != ```: Not Equals
  - ```python > ```: Greater Than
  - ```python < ```: Less Than
  - ```python >= ```: Greater or Equals Than
  - ```python <= ```: Less or Equals Than
  ][
```Python
10 == 'Alice'  # False
10 != 'Alice'  # True
7 > 2          # True
```
]

]

#slide(title: "Branching")[
  - Use conditional statements to execute code based on #alert[conditions]

#components.side-by-side(columns: (1fr, 1fr), gutter: 0em)[
```Python
x = 10
if x > 5:
    print("x is greater than 5")
else:
    print("x is less than 5")



```
][
```Python
x = 10
if x > 5:
    print("x is greater than 5")
elif x == 5:
    print("x is equal to 5")
else:
    print("x is less than 5")

```
]

]

#slide(title: "Non-Primitive Data Types")[

  - #alert[Non-Primitive Data Types] are more complex data structures that can store multiple values or more complex forms of data
  - Unlike primitive types (like int, float, bool, str), non-primitive types can hold collections of data and have built-in methods for data manipulation
  - Common #underline[Non-Primitive] Data Types in Python:
    - List
    - Tuple
    - Set
    - Dictionary
  - #alert[Mutable or Immutable:] Some types can be changed after creation (like lists), while others cannot (like tuples)
]

#slide(title: "List")[
  - #alert[Ordered], #alert[mutable] collection of elements
  - Can store elements of #alert[different] data types
  - Elements can be #alert[repeated]
```Python
fruits = ["apple", "banana", "cherry"] #All the elemets have the same type
l = [10, 14, 10, "car", True]          #But this is also ok
print(fruits[0])                       #apple
```
  - We have #alert[methods] to modify lists
```Python
fruits.append("mango")  # ["apple", "banana", "cherry", "mango"]
```
]

#slide(title: "Tuple")[
  - #alert[Ordered], #alert[immutable] collection of elements
  - Used when you want to store data that should not change
  - Can store elements of #alert[different] data types
  - Elements can be #alert[repeated]
```Python
coordinates = (10.5, 20.3)
t = (10, 'Hello', False)
```
]

#slide(title: "Set")[
  - #alert[Unordered] collection of #alert[unique] elements
  - Used to store #alert[non-duplicate] data
```python
unique_numbers = {1, 2, 3, 4}
unique_numbers.add(4)
print(unique_numbers) # {1, 2, 3, 4}
unique_numbers.add(5)
print(unique_numbers) # {1, 2, 3, 4, 5}
```

]

#slide(title: "Dictionary")[
  - Collection of #alert[key-valu]e pairs
  - Keys are #alert[unique], and values can be of any type
```python
person = {"name": "Alice", "age": 25}
print(person["name"]) #Alice
print(person["age"])  #25
person["age"] = 28
print(person["age"])  #28
```
]

#slide(title: "Looping")[
  - #alert[For Loop:] used to iterate over a sequence (list, string, range, etc.)
```python
numbers = range(5) #[0,1,2,3,4]
for i in numbers:
    print(i)  
```
  - #alert[While Loop:] continues until the condition becomes False
```python
count = 0
while count < 5:
    print(count)
    count += 1
```
]

#slide(title: "Functions")[
  - A function is a #alert[block of reusable code] that performs a specific task
```python
def greet(name):
    return f"Hello, {name}!"
```
  - How do we call a function?
```Python
greet("Alice")
```
]

#slide(title: "Built-in functions")[
    - There are a lot of #alert[built-in] utility functions
```Python
print("Hello DTM!")   #Hello DTM!
len("Hello DTM!")     #10
type("Hello DTM!")    #String
range(5)              #[0,1,2,3,4]
```
]

#slide(title: "Input and Output")[
  - Use the input() function to get user input

```python
name = input("Enter your name: ")
```
  - Use the print() function to display output.
```python
x = 10
print(f"The value of x is {x}") The value of x is 10
```
]

#slide(title:"List Comprehension")[
  - List Comprehension is a concise way to create lists based on existing lists or other iterable objects
#components.side-by-side(columns: (1fr, 1fr), gutter: 0em)[
```python
squares = []
for x in range(10):
    squares.append(x ** 2)
```
][
```python
squares = [x ** 2 for x in range(10)]



```
]

  - Add an if condition to include elements that satisfy the condition

```python
evens = [x for x in range(10) if x % 2 == 0] #[0, 2, 4, 6, 8]
```
]

#focus-slide[
  History of Programming Paradigms
]

#slide(title: "Programming Paradigms")[
  - What is a #alert[paradigm]?
    - A paradigm (in programming) refers to a #underline[style or way of thinking about and structuring code to solve problems]
    - #underline[Different paradigms approach problems from different angles], using distinct techniques and strategies

  - #alert[Evolution] of programming paradigms:
    - As computing hardware advanced, so did the complexity of software
    - Different paradigms emerged to solve new problems, manage complexity, and improve productivity

]

#slide(title: "Imperative Programming")[
  #align(center)[
    _#alert[Imperative programming] is a paradigm that focuses on describing #alert[how] a program operates through #alert[explicit step-by-step instructions], detailing how the #alert[state] of the program #alert[changes over time]_
  ]
]

#slide(title: "Imperative Programming")[

  === Sum of the first 10 numbers in C

  ```c
int main() {
  int sum = 0;
  for (int i = 1; i <= 10; i++) {
      sum += i;
  }
  printf("Sum of first 10 numbers is %d\n", sum);
  return 0;
}
  ```
]

#slide(title: "Imperative Programming")[

  === History
  - #alert[1950s - 1960s]: origin of imperative Programming
  - Languages like #alert[Fortran] (1957) and #alert[Algol] (1958) were among the first to implement imperative concepts
  - #alert[C] (1972) became #alert[one of the most popular imperative languages] and laid the foundation for many modern languages like Java and C++
  - These languages were designed to take advantage of the #alert[Von Neumann architecture] of computers, which operates with a sequence of instructions acting on memory
]

#slide(title: "Imperative Programming")[

  === Key Characteristics
  - #alert[Sequential execution:] code is executed one instruction at a time, in a predefined order
  - #alert[State and mutation:] the program's state is stored in variables, which can change (mutate) over time
  - #alert[Control flow]: programmers have explicit control over the flow of execution using constructs like:
    - Loops (for, while)
    - Conditional statements (if, else, switch)
    - Function calls
  - #alert[Memory management:] in earlier imperative languages like C, developers had to manually manage memory allocation and deallocation
]

#slide(title: "Imperative Programming")[
  === Advantages 
    - #alert[Straightforward control:] offers explicit control over how a program runs and how its state evolves, making it easy to write simple scripts or perform low-level tasks
    - #alert[Close to machine language:] especially in languages like C, imperative programming provides direct manipulation of memory and system resources, making it suitable for performance-critical applications like operating systems and device drivers
    - #alert[Wide applicability:] suitable for a broad range of applications, from system programming to general-purpose programming
]

#slide(title: "Imperative Programming")[
  === Disadvantages 
  - #alert[Complexity in large systems:] as the complexity of the program grows, managing state and flow control manually becomes cumbersome and error-prone
  - #alert[Hard to reason about:] programs with many mutable variables and complex flow (e.g., nested loops and conditionals) can become difficult to debug, maintain, and understand
  - #alert[Less modularity and reusability:] code often lacks the modularity and reuse seen in object-oriented programming due to its reliance on global state and tight coupling between operations
]

#slide(title: "Object-Oriented Programming (OOP)")[

  #align(center)[
    _#alert[Object-oriented programming] (OOP) is a paradigm that organizes code by bundling related #alert[data] and #alert[methods] into #alert[objects], which represent entities or concepts from the #alert[real world] or problem domain_
  ]

  #v(2em)

  #arrow The central concept of OOP is that objects #alert[interact] with one another to #alert[perform tasks], and programs are constructed as #alert[networks of these interacting objects]
]

#slide(title: "Object-Oriented Programming")[
  #figure(image("images/oop.jpg"))
]

#slide(title: "Object-Oriented Programming")[

  === History
  - #alert[1960s - 1980s:] OOP concepts first appeared in Simula (1960s), a simulation language designed for modeling real-world processes
  - #alert[1970s:] Smalltalk fully implemented OOP principles, pioneering the core concepts like classes, objects, inheritance, and message passing

  - #alert[1980s-1990s:] OOP became mainstream with the popularity of languages like C++ (1983) and Java (1995). These languages brought OOP into widespread use for everything from desktop applications to large-scale enterprise systems

  - #alert[Present]: Modern languages like Python, Kotlin, and Scala continue to embrace OOP, often combining it with other paradigms to maximize flexibility 
]

#slide(title: "Object-Oriented Programming")[
  === How to define a class and create an object
```python
class Student:
  def __init__(self, name, surname):
    self.name = name
    self.surname = surname

  def greet(self):
    print(f"Hello! My name is {name}")


davide = Student('Davide', 'Domini')
davide.greet()

```
]

#slide(title: "Object-Oriented Programming")[

  === Key Concepts of OOP: Encapsulation
  #align(center)[
    _Bundling #alert[data] (attributes) and #alert[methods] (functions) into a single unit called an #alert[object]. This #alert[hides the internal state of the object] and only #alert[exposes a public interface]._
  ]

```python
class Car:
  def __init__(self, model, color):
    self.model = model
    self.color = color
    
  def start_engine(self):
    print("Engine started")
```
]

#slide(title: "Object-Oriented Programming")[
  === Key Concepts of OOP: Inheritance
  #align(center)[
    _#alert[Creating new classes based on existing ones], allowing for #alert[reuse] of common behavior and properties. This models an "is-a" relationship._
  ]
```python
class ElectricCar(Car):
  def start_engine(self):
    print("Electric motor started")
```
]

#slide(title: "Object-Oriented Programming")[
  === Key Concepts of OOP: Abstraction
  
  #align(center)[
    _#alert[Simplifying] complex systems by providing a #alert[clear interface] and #alert[hiding the inner workings]. Abstraction allows programmers to focus on #alert[what] an object does, rather than #alert[how] it does it._
  ]
```python
class Animal:
    def __init__(self, name):
        self.name = name

    def speak(self):
        raise NotImplementedError("Subclass must implement this method")

class Dog(Animal):
    def speak(self):
        return f"{self.name} says Woof!"

class Cat(Animal):
    def speak(self):
        return f"{self.name} says Meow!"

dog = Dog("Buddy")
cat = Cat("Whiskers")
print(dog.speak())  # Buddy says Woof!
print(cat.speak())  # Whiskers says Meow!

```
]

#slide(title: "Object-Oriented Programming")[

  === Advantages

  - #alert[Modularity:] classes and objects allow for clear modular design. Each object handles its own state and behavior, reducing dependencies and coupling between components
  - #alert[Code reuse:] through inheritance and polymorphism, common behavior can be abstracted and reused across different parts of a program
  - #alert[Scalability:] large systems can be broken down into smaller objects and components, making them easier to manage, extend, and maintain
  - #alert[Maintainability:] with encapsulation, changes to the internal workings of an object don't affect other parts of the codebase as long as the public interface remains the same

]

#slide(title: "Object-Oriented Programming")[

  === Disadvantages
  - #alert[Complexity:] OOP can introduce unnecessary layers of abstraction, making simple problems overly complex. For small programs, the overhead of defining classes and objects can be excessive
  - #alert[Performance overhead:] in some languages, OOP can lead to performance issues due to the abstraction layers, particularly when creating and managing many small objects.
  - #alert[Learning curve:] understanding concepts like inheritance, polymorphism, and design patterns can be challenging for beginners

]

#slide(title: "Imperative Programming vs OOP")[

#set table(
  fill: (x, y) =>
    if x == 0 or y == 0 {
      gray.lighten(40%)
    },
  align: right,
)
#align(center)[
  #table(
    columns: 3,
    align: center,
    table.header(
      [#v(10pt) *Aspect* #v(10pt)], [*Imperative Programming*], [*Object-Oriented Programming*]
    ),
    [ #v(10pt) Control Flow #v(10pt)], [Explicit (sequential, loops)],[Distributed across objects], 
    [#v(10pt) State management #v(10pt)], [Managed through variables], [Encapsulated within objects], 
    [#v(10pt) Modularity #v(10pt)], [Function-based], [Object-based], 
    [#v(10pt) Code reuse #v(10pt)], [Functions and libraries], [Inheritance, polymorphism], 
    [#v(10pt) Example #v(10pt)], [C, Python (procedural style)], [Python, Java, Kotlin], 
  )
]

]



#slide(title: "Why New Paradigms were Needed")[
  - #alert[Complexity and Scalability:] as software grew, managing complex systems with just imperative techniques became difficult
  - #alert[Changing hardware architectures:] the rise of multi-core processors and distributed systems required new paradigms to handle concurrency and parallelism efficiently
  - #alert[Shift in software focus:] software has evolved to handle more complex tasks like UI design, web development, and artificial intelligence, which demand higher abstraction and modularity (OOP, functional programming)

]

#focus-slide[
  Let's try some coding in Python!
]

#slide(title:"Lab 1")[
  #components.side-by-side(columns: (1fr, 1fr), gutter: 0em)[
    #link("https://tinyurl.com/DTM-Lab01")
  ][
    #figure(image("images/DTM-Lab01.svg", width:50%))
  ]
 
]
