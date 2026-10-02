#import "@preview/touying:0.6.1": *
#import themes.metropolis: *

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
)

#set text(font: "Fira Sans", weight: 350, size: 20pt)
#show math.equation: set text(font: "Fira Math")
#set strong(delta: 200)
#set par(justify: true)

#set raw(tab-size: 4)
#show raw.where(block: true): block.with(
  fill: luma(242),
  inset: 0.85em,
  radius: 0.5em,
  width: 100%,
)

// Self-contained deck apart from Touying.
// Image placeholders describe the intended asset and composition.

#let author = block(inset: 0.1em)[
  #table(
    inset: 0.45em,
    stroke: none,
    columns: (auto, 1fr),
    align: (left, left),
    [#alert[*Davide Domini*]], [`davide.domini@unibo.it`],
  )
]

#let two-col(left, right, ratio: (1fr, 1fr), gutter: 1.2em) = grid(
  columns: ratio,
  gutter: gutter,
  left,
  right,
)

#let placeholder(desc, height: 7.5em) = block(
  width: 100%,
  height: height,
  fill: luma(239),
  stroke: luma(180),
  radius: 0.5em,
  inset: 0.8em,
)[
  #align(center + horizon)[
    #text(fill: luma(112), size: 0.76em, style: "italic")[IMAGE PLACEHOLDER\
    #desc]
  ]
]

#let callout(body) = block(
  width: 100%,
  fill: rgb("#eef4f7"),
  stroke: (left: 4pt + rgb("#00838f")),
  inset: (x: 0.8em, y: 0.55em),
  radius: 0.35em,
)[#body]

#let activity(minutes, body) = block(
  width: 100%,
  fill: rgb("#fff7df"),
  stroke: rgb("#e2b94f"),
  inset: 0.8em,
  radius: 0.45em,
)[
  #text(weight: 600)[Exercise (#minutes)]\
  #body
]

#let solution(body) = block(
  width: 100%,
  fill: rgb("#eef7ee"),
  stroke: (left: 4pt + rgb("#4f8a52")),
  inset: (x: 0.8em, y: 0.55em),
  radius: 0.35em,
)[
  #text(weight: 600)[Solution]\
  #body
]

#let source-note(body) = align(right)[
  #text(size: 0.55em, fill: luma(100))[#body]
]

#let simple-table(columns, cells) = table(
  columns: columns,
  inset: (x: 0.62em, y: 0.4em),
  stroke: none,
  fill: (x, y) => if y == 0 { rgb("#dfecef") } else if calc.odd(y) { luma(247) } else { white },
  ..cells,
)

// =============================================================================
// RUN OF SHOW
// CLASSROOM: 3 hours, including a 10-minute break
// 00:00-00:25  Why computers and programming matter
// 00:25-01:35  Hardware and information representation
// 01:35-01:45  Break
// 01:45-02:20  Operating systems
// 02:20-02:55  Algorithms, languages, and translation
// 02:55-03:00  Bridge to the lab
//
// LAB: 3 hours, including a 10-minute break
// 00:00-00:20  Ways to run Python and first program
// 00:20-00:55  Values, variables, types, operators, strings
// 00:55-01:25  Execution flow and conditions
// 01:25-01:35  Break
// 01:35-02:05  Loops
// 02:05-02:30  Collections
// 02:30-02:40  Functions
// 02:40-02:58  Final cumulative exercise
// 02:58-03:00  Recap
// =============================================================================

#title-slide(
  title: "From bits to Python",
  subtitle: "Crash Course on Programming @ Digital Transformation Management 2026-27",
  author: author,
)

#focus-slide[Introduction to Computers]

// ----------------------------------------------------------------------------
// PART 1: INTRODUCTION
// ----------------------------------------------------------------------------

#focus-slide[Part 1\
Why Computers and Programming?]

#slide(title: "Why We Use Computers")[
      Computers are useful when a task requires:
      - many *repeated* operations
      - *large amounts* of information
      - *consistent* application of rules
      - *simulation* of alternatives

      They trade human effort for a precise procedure that can run at scale.

      Example: Analyzing a huge amount of data 
]

#slide(title: "A Wartime Turning Point: The Bombe")[

  During *World War II*, decrypting German messages encoded with
  the *Enigma* machine became a huge computational problem.

  #v(1.5em)
    #two-col(
  [
    #figure(image("/assets/image.png", width: 100%))
  ],[
    #figure(image("/assets/image-1.png", width: 100%))
  ])
  #v(3.5em)

  - Enigma had an enormous number of possible settings.
  - Testing them manually would have taken too long.
  - In 1940, *Alan Turing* and *Gordon Welchman* developed the
    *Bombe* at Bletchley Park.
  - The machine repeatedly tested possibilities and eliminated
    settings that could not be correct.

  #v(0.5em)

  #block(
    fill: rgb("#f3f3f3"),
    stroke: 1pt + rgb("#ed7d1a"),
    inset: 0.8em,
  )[
    The Bombe was *not a general-purpose computer*: it was built
    for one specific task.

    But it demonstrated a central idea of modern computing:

    #align(center)[
      *turn a problem into precise rules and let a machine execute
      them quickly and repeatedly.*
    ]
  ]
  
  #figure(image("images/Bletchley_Park_Bombe4.jpg", width: 75%))
  #figure(image("images/Wartime_photo_of_Colossus_10.png", width: 75%))  
]

#slide(title: "Hardware and Software")[
  #two-col(
    [
      *Hardware*

      Physical components that store, process, display, or transmit information.

      Examples: processor, memory, storage device, screen, network interface.
    ],
    [
      *Software*

      Instructions and data that determine what the hardware does.

      Examples: operating system, browser, spreadsheet, mobile app, Python script.
    ],
  )

  #v(0.6em)
  The same hardware can perform very different tasks when it runs different software.
]

#slide(title: "Programming")[
  Programming means describing a procedure precisely enough that a computer can carry it out.

  #v(0.6em)
  A program can:
  - transform input data into an output
  - automate a repeated workflow
  - make decisions from explicit rules
  - coordinate other programs and devices
  - simulate how a system might behave

  #callout[The computer provides speed and consistency. The programmer provides the model, rules, and meaning.]
]

#slide(title: "Computational Thinking")[
  Computational thinking helps us turn an informal goal into a procedure that someone else, or a computer, can follow.

  - *Decomposition:* divide the problem into manageable parts
  - *Pattern recognition:* identify repeated cases and shared structure
  - *Abstraction:* keep relevant details and hide the rest
  - *Algorithm design:* define ordered and unambiguous steps
  - *Evaluation:* test the result and revise incorrect assumptions
]

#slide(title: "A nice quote from: Robert C. Martin (a.k.a. Uncle Bob)")[
  #quote[
    #emph[
    At some point you touched a computer, 
    and the computer did what you wanted.
    You made it do what you wanted it to do and you realized that you were a god. 
    A small god in a very small world.
    But inside that world you were a god.
  ]]
]


#slide(title: "Waht does that quote imply?")[


  - As the god of this small world, you define its rules and are *responsible* for the behavior they produce
  - Writing useful rules requires *understanding how that world works* and which operations the computer can perform
  - The computer *follows your rules literally* and at scale, including your wrong assumptions and mistakes
  - *Testing* lets you compare the world you created with the world you intended to create
]
// ----------------------------------------------------------------------------
// PART 2: HARDWARE
// ----------------------------------------------------------------------------

#focus-slide[Part 2\
Hardware and Information]

#slide(title: "A Computer Seen From the Outside")[

  #figure(image("images/interaction.pdf", width: 75%))

  - *Input* brings information into the system
  - *Processing* transforms the information according to instructions
  - *Output* communicates the result
  - *Storage* preserves information for later use

  This simple model works for a laptop, a server, a smartphone, or an embedded controller.
]

#slide(title: "Layers of a Computer System")[
  #figure(image("images/stack-arc.svg", width: 35%))

  Each layer exposes a simpler interface and hides details below it. These abstractions let us build applications without controlling individual electrical signals.
]

#slide(title: "Information Needs a Representation")[
  A computer manipulates physical states. We assign those states a meaning through an #alert[encoding].

  The same bit pattern can represent:
  - an unsigned number
  - a character
  - part of a color
  - a machine instruction

  Meaning comes from the convention used to interpret the bits.
]

#slide(title: "Bits and Bytes")[
  #two-col(
    [
      A #alert[bit] is a logical value with two possible states: `0` or `1`.

      With $n$ bits, we can encode $2^n$ combinations.

      - 1 bit gives 2 combinations
      - 4 bits give 16 combinations
      - 8 bits give 256 combinations
    ],
    [
      Eight bits form one #alert[byte].

      ```text
      01000001
      ```

      File and memory sizes count bytes: `KB`, `MB`, `GB`, and `TB`.
    ],
  )
]


#slide(title: "Decimal to Binary")[
  Repeated division by 2 exposes the binary digits.

  #set text(size: 0.88em)
  #simple-table(
    (1fr, 1fr, 1fr),
    (
      [*Division*], [*Quotient*], [*Remainder*],
      [`13 ÷ 2`], [`6`], [`1`],
      [`6 ÷ 2`], [`3`], [`0`],
      [`3 ÷ 2`], [`1`], [`1`],
      [`1 ÷ 2`], [`0`], [`1`],
    ),
  )

  Read the remainders from bottom to top: `13₁₀ = 1101₂`.
]


#slide(title: "ASCII table")[
  #two-col(
    [

      The original ASCII standard assigns numbers from 0 to 127 to letters, digits, punctuation, and control characters.

      ```text
      A = 65 = 01000001
      a = 97 = 01100001
      ```
    ],
    [
      #figure(image("images/ascii.jpg", width: 100%))
    ],
  )
]

#slide(title: "Logical Bits and Electrical Signals")[
  
    A bit is an abstract logical state. Digital circuits often represent it with voltage ranges:

    - a low range means logical `0`
    - a high range means logical `1`

    Ranges provide tolerance against small amounts of electrical noise.
  
]

#slide(title: "Transistors and Logic")[
  #two-col(
    [
      A transistor can control whether current flows. Networks of transistors form logic gates.

      Gates implement operations such as `NOT`, `AND`, and `OR`. Larger circuits combine gates into adders, memory cells, and processors.

      Software eventually causes physical signals to move through these circuits.
    ],
    [
      #figure(image("images/trans.jpg", width: 100%))
    ],
  )
]


// Source: Nappa, Hobbs, and Lanzi, arXiv:2105.05103. Belgian 2003 expert report cited there.
#slide(title: "A Bit Flip With 4,096 Consequences")[
 
  During the 2003 Belgian election, an electronic vote-counting system in Schaerbeek gave one candidate 4,096 extra preference votes.

  The most likely explanation is that ionizing radiation, possibly from a cosmic ray, *flipped* a single bit in the computer's memory.

  `4,096 = 2¹²`, which matches *changing one binary position from 0 to 1*.
]


#slide(title: "Components Working Together")[
  #two-col(
    [
      - The *CPU* executes instructions
      - *RAM* holds active instructions and data
      - *Storage* keeps programs and files
      - The *GPU* performs many similar calculations in parallel
      - Input, output, and network devices connect the machine to its environment
    ],
    [
    #figure(image("images/open-pc-computer-case.jpg", width: 95%))],
  )
]

#slide(title: "The Stored-Program Abstraction")[
  John von Neumann's stored-program model gives us a useful simplified view:

  - memory holds both instructions and data
  - the processor reads instructions from memory
  - input and output connect computation to the outside world

  #v(0.5em)
  #callout[The model hides many details of modern hardware, but it explains the path from a program file to executed instructions.]
]

#slide(title: "A Simplified Computer Architecture")[
  #figure(image("images/Von_Neumann_Architecture.svg", width: 45%))

  The diagram is an abstraction, not a literal map of a modern chip. Its value comes from showing the roles and communication among components.
]


#slide(title: "The Motherboard")[
  #two-col(
    [
      The motherboard provides the physical and electrical connections among components.

      It contains sockets, memory slots, data links, controllers, and connectors. It also distributes power and carries timing and control signals.

     *The motherboard coordinates communication. It does not perform all computation itself.*
    ],
    [
      #figure(image("images/motherboard.jpg", width: 100%))
    ],
  )
]


#slide(title: "The CPU")[
  #two-col(
    [
      - The *control unit* coordinates instruction execution
      - The *arithmetic logic unit* performs arithmetic and logical operations
      - *Registers* hold values needed immediately
      - *Cache* keeps recently used instructions and data close to the cores

      A modern CPU may contain several cores.
    ],
    [#figure(image("images/cpus.png", width: 95%))],
  )
]

#slide(title: "Fetch, Decode, Execute")[

  The CPU repeatedly:
  + fetches an instruction from memory
  + decodes what the instruction requests
  + executes the operation
  + stores the result and selects the next instruction

  #figure(image("images/cpu-cycle.png", width: 95%))

]

#slide(title: "RAM, Storage, and Firmware")[
  #set text(size: 0.88em)
  #simple-table(
    (1fr, 1.45fr, 1.7fr),
    (
      [*Component*], [*Main purpose*], [*What happens without power?*],
      [RAM], [Active programs and data], [Contents disappear],
      [SSD or hard disk], [Programs and user files], [Contents remain],
      [Firmware storage], [Startup and device-control code], [Contents remain],
    ),
  )

  #v(0.5em)
  Modern firmware commonly lives in rewritable flash memory. “ROM” remains a useful historical label, but the storage may not be literally read-only.
]

#slide(title: "Memories")[
  #figure(image("images/memory.png", width: 45%))
]

#slide(title: "The GPU")[
  #two-col(
    [
      A GPU contains many processing units designed to perform similar operations on many data elements.

      Graphics naturally requires this form of parallel work. The same capability also supports scientific computing and machine learning.

      A CPU remains better suited to many irregular, sequential, or control-heavy tasks.
    ],
    [#figure(image("images/gpu.jpeg", width: 95%))],
  )
]

#focus-slide[Part 3\
Operating Systems]

#slide(title: "The Problem an Operating System Solves")[

    A computer contains different processors, memories, devices, and communication links.

    Without a *common manager*, every application would need to control each device directly and negotiate resource use with every other application.
]

#slide(title: "A Layer of Abstraction")[
  The operating system presents stable concepts such as:

  - a *process* instead of raw CPU scheduling
  - an address space instead of physical memory chips
  - a *file* instead of storage sectors
  - a network connection instead of signals on a network interface

  Applications use these abstractions rather than controlling hardware directly.
]

#slide(title: "Operating System Responsibilities")[
  #set text(size: 0.88em)
  #simple-table(
    (1.15fr, 2.7fr),
    (
      [*Area*], [*What the operating system does*],
      [Processing], [Starts processes and schedules their execution],
      [Memory], [Assigns memory and isolates processes],
      [Files], [Organizes persistent data and controls access],
      [Devices], [Provides standard interfaces through drivers],
      [Networking], [Sends and receives data through protocol stacks],
      [Security], [Identifies users and enforces permissions],
    ),
  )
]

#slide(title: "Operating System Families")[
  #two-col(
    [
      On personal computers:
      - Microsoft Windows
      - macOS
      - Linux distributions

      On mobile devices:
      - Android
      - iOS
    ],
    [
      Servers, cloud machines, network equipment, vehicles, and embedded devices also run operating systems.

      Interfaces differ, but the same core responsibilities remain.
    ],
  )
]

#slide(title: "Program and Process")[
  #simple-table(
    (1fr, 1.3fr, 2fr),
    (
      [*Concept*], [*Analogy*], [*Meaning*],
      [Program], [A recipe], [Instructions and related files stored on disk],
      [Process], [Someone cooking], [A running instance with memory, state, and operating-system resources],
    ),
  )

  #v(0.6em)
  Running the same program twice usually creates two processes with separate state.
]

#slide(title: "Graphical and Command-Line Interfaces")[
  #two-col(
    [
      *Graphical user interface*

      Early interactive systems relied heavily on text commands. Graphical interfaces later made actions visible through windows, icons, menus, and a pointer. Direct manipulation lowered the barrier to interactive computing.
    ],
    [
      *Command-line interface*

      Text commands are compact, composable, and easy to automate. They remain central in development, servers, and data workflows.
    ],
  )

  Both interfaces request services from the same operating system.
]

#slide(title: "Terminal, Shell, and Command")[
  #set text(size: 0.9em)
  #simple-table(
    (1fr, 2.6fr),
    (
      [*Term*], [*Meaning*],
      [Terminal], [The application or window that displays a text session],
      [Shell], [The program that reads commands and launches other programs],
      [Command], [The instruction entered by the user, often the name of another program],
    ),
  )

  ```bash
  pwd
  ls
  cd project
  python report.py
  ```
]

#slide(title: "The File System")[
  #two-col(
    [
      The file system gives stored bytes a logical structure:
      - files have *names* and *metadata*
      - directories *group* files and other directories
      - paths *identify* locations
      - permissions *restrict* access

      The file system is an operating-system abstraction over storage devices.
    ],
    [#figure(image("images/file-system.jpg", width: 95%))],
  )
] 

#slide(title: "Absolute and Relative Paths")[
  #two-col(
    [
      *Absolute path*

      Starts from a filesystem root.
      ```text
      /home/alice/project/data/orders.csv
      C:\Users\Alice\project\data\orders.csv
      ```
    ],
    [
      *Relative path*

      Starts from the current working directory.
      ```text
      ./data/orders.csv
      ../shared/config.json
      ```

      `.` means current directory. `..` means parent directory.
    ],
  )
]

// ----------------------------------------------------------------------------
// PART 4: PROGRAMMING CONCEPTS
// ----------------------------------------------------------------------------

#focus-slide[Part 4\
Algorithms and Programming Languages]

#slide(title: "Algorithms")[
  An algorithm is a *finite* and *unambiguous* procedure that transforms valid input into a result or observable effect.

  A useful algorithm states:
  - what input it expects
  - which steps run and in what order
  - how it handles relevant cases
  - when it stops

  We also evaluate correctness, execution time, and memory use.
]

#slide(title: "Natural Language Can Be Ambiguous")[
  Consider this rule for an online store:

  #align(center)[
    _“Give free shipping to premium customers or students who spend more than €50.”_
  ]

  This sentence has at least two possible interpretations:

  - *Interpretation A:* premium customers always receive free shipping; students receive it only when they spend more than €50.
  - *Interpretation B:* both premium customers and students must spend more than €50.

  Consider a *premium customer* who spends *€20*:

  - Interpretation A says: *free shipping*
  - Interpretation B says: *no free shipping*

  The same sentence produces two different decisions.
]

#slide(title: "A More Precise Procedure")[
  Suppose we choose the first interpretation:

  ```text
  input: customer type and order total

  if customer is premium:
      give free shipping
  otherwise, if customer is a student
                and order total > €50:
      give free shipping
  otherwise:
      charge for shipping
   ```
]

#slide(title: "Pseudocode and Source Code")[
  #two-col(
    [
      *Pseudocode*

      Expresses an algorithm with structured but informal notation. It supports reasoning without committing to a language.

      ```text
      for each order:
          add its amount to total
      ```
    ],
    [
      *Python source code*

      Uses the exact syntax and semantics of Python. A Python implementation can execute it.

      ```python
      for order in orders:
          total = total + order
      ```
    ],
  )
]

#slide(title: "Programming Languages")[
  A programming language is a formal system for expressing computations.

  - *Syntax* defines which forms are valid
  - *Semantics* defines what valid forms mean
  - *Abstractions* let one expression represent many lower-level operations
  - *Libraries* provide reusable solutions to common tasks

  Formal rules allow tools to translate and execute programs consistently.
]

#slide(title: "One Algorithm, Different Languages")[
  The same idea can be expressed using different abstractions and syntax:

  #align(center)[
    ```text
    for each order:
        add its amount to total
    ```
  ]

  #v(0.4em)

  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 0.8em,

    [
      #align(center)[
        #text(fill: rgb("#ed7d1a"), weight: "bold")[Python]
      ]

      ```python
      total = 0

      for order in orders:
          total += order
      ```
    ],

    [
      #align(center)[
        #text(fill: rgb("#ed7d1a"), weight: "bold")[Kotlin]
      ]

      ```kotlin
      var total = 0

      for (order in orders) {
          total += order
      }
      ```
    ],

    [
      #align(center)[
        #text(fill: rgb("#ed7d1a"), weight: "bold")[C]
      ]

      ```c
      int total = 0;

      for (int i = 0; i < n; i++) {
          total += orders[i];
      }
      ```
    ],
  )

]

#slide(title: "Why Many Languages Exist")[
  #set text(size: 0.88em)
  #simple-table(
    (1.2fr, 1.8fr, 1.25fr),
    (
      [*Priority*], [*Typical emphasis*], [*Examples*],
      [Hardware control], [Predictable performance and memory access], [C, Rust],
      [Large applications], [Structure, tooling, and maintainability], [Java, `C#`],
      [Web pages], [Interaction inside the browser], [JavaScript],
      [Data and automation], [Readable code and broad libraries], [Python],
      [Database queries], [Describe the desired data], [SQL],
    ),
  )

  Existing systems, communities, and trade-offs all influence language choice.
]

#slide(title: "Levels of Abstraction")[

  #figure(image("/assets/image-2.png", width: 55%))

  Higher-level languages hide more machine detail and offer concepts closer to the problem. Lower-level languages expose more control over hardware and memory.
]

#slide(title: "One Intention at Four Levels")[
  #set text(size: 0.84em)
  #simple-table(
    (1fr, 2.9fr),
    (
      [*Level*], [*Illustrative form*],
      [Human intention], [Add tax to the price],
      [Python], [`total = price + tax`],
      [Assembly-like], [`LOAD R1, price` then `ADD R1, tax` then `STORE total, R1`],
      [Machine code], [`00101100 00010001 ...`],
    ),
  )

  One high-level statement may expand into many instructions. The precise expansion depends on the implementation and processor.
]

#slide(title: "An Example of Machine Code")[
  #figure(image("images/machinelanguage.png", width: 80%))
]

#slide(title: "One Step of Abstraction")[
  #figure(image("images/assembly.png", width: 85%))

  This may seem outdated, but many embedded and IoT systems (such as heat-pump controllers) still require programmers to know how hardware registers work and exactly where each piece of information must be stored.

]

#slide(title: "The Translation Chain")[
  The programmer writes source code. Translators and runtimes convert that code into operations supported by the execution environment. The CPU ultimately executes machine instructions.
]

#slide(title: "Two Steps of Abstraction")[
  #figure(image("/assets/image-3.png", width: 90%))
]


#slide(title: "Compiler")[
  #two-col(
    [
      A compiler *analyzes* source code and produces another representation *before* the program runs.

      The output may be native machine code or an intermediate form such as bytecode.

      Translation happens *once per build*, while the result may run many times.
    ],
    [#image("/assets/image-5.png")],
  )
]

#slide(title: "Interpreter")[
  #two-col(
    [
      An interpreter *executes* a program representation while the program runs.

      This supports *interactive* experimentation and allows the runtime to inspect the current execution state.

      The interpreter must be available on the machine that runs the program.
    ],
    [#image("/assets/image-6.png")],
  )
]

#slide(title: "Typical Trade-offs")[
  #set text(size: 0.88em)
  #simple-table(
    (1.15fr, 1.65fr, 1.65fr),
    (
      [*Question*], [*Ahead-of-time compilation often helps*], [*Interpretation often helps*],
      [Feedback], [Errors may appear during a build], [Interactive experiments give immediate results],
      [Execution], [Native code can reduce runtime overhead], [The runtime can inspect and adapt execution],
      [Distribution], [A built executable may be self-contained], [Source or bytecode can stay portable with a runtime],
    ),
  )

  These are tendencies, not universal rules.
]

#slide(title: "Program Building Blocks")[
  #set text(size: 0.88em)
  #simple-table(
    (1.15fr, 1.6fr, 1.75fr),
    (
      [*Block*], [*Question*], [*Example*],
      [Sequence], [What happens first and next?], [Read, validate, calculate, report],
      [State], [What must the program remember?], [Current total and error count],
      [Selection], [Which branch should run?], [Flag an order when its value is high],
      [Iteration], [Which operation repeats?], [Process every order],
      [Function], [Which procedure deserves a name?], [`summarize_orders(...)`],
    ),
  )
]

#slide(title: "Control Flow Diagrams")[
  #two-col(
    [ 
      A flowchart makes execution order visible. Each decision needs a condition with a true or false result. Each loop needs a path that eventually stops.
    ],[
      #image("/assets/image-4.png")
    ])
]

// =============================================================================
// LAB BLOCK
// =============================================================================

#focus-slide[Python Fundamentals]

#slide(title: "Why Python")[

      Python offers:
      - *readable* syntax
      - *immediate* interactive feedback
      - *libraries* for data, automation, science, web systems, and machine learning
      - the *same language* for small scripts and large projects

]

#slide(title: "Three Ways to Run Python")[
  #set text(size: 0.88em)
  #simple-table(
    (1fr, 1.65fr, 1.65fr),
    (
      [*Mode*], [*Best for*], [*Important detail*],
      [REPL], [Trying one expression at a time], [State lasts until the session ends],
      [Script `.py`], [Repeatable programs and projects], [The file runs from top to bottom],
      [Notebook], [Explanation, experiments, and data analysis], [Cells share state and may run out of order],
    ),
  )

]

#slide(title: "The Python REPL")[
  The Read-Evaluate-Print Loop reads an expression, evaluates it, prints the result, and waits for the next input.

  ```python
  >>> 2 + 3 * 4
  14
  >>> course = "DTM"
  >>> print(f"Hello, {course}!")
  Hello, DTM!
  ```

  The REPL is useful for exploration. A sequence worth keeping belongs in a script or notebook.
]

#slide(title: "A Python Script")[
  File: `hello.py`

  ```python
  course = "DTM"
  students = 35

  print(f"{course} has {students} students")
  ```

  Run it from a shell:

  ```bash
  python hello.py
  ```

  Some systems use `python3` or the Windows launcher `py`.
]

// Source: https://github.com/phyelds/phyelds, accessed 2026-09-25.
#slide(title: "A Real Python Project")[

      A larger program is divided across files and directories:
      - source modules
      - tests
      - documentation
      - configuration and dependency metadata

  #source-note[#link("https://github.com/phyelds/phyelds")[github.com/phyelds/phyelds]]
]

#slide(title: "Jupyter and Colab Notebooks")[
  #two-col(
    [
      A notebook combines:
      - executable code cells
      - results directly below the code
      - formatted explanations

      Google Colab runs notebooks in a browser. Jupyter can run locally.
    ],
    [
      Cells share a Python session. Their execution order matters.

      If results become confusing:
      + restart the runtime
      + run all cells from the beginning

      A notebook should work in a clean session.
    ],
  )
]

#slide(title: "First Run")[
  Open a notebook or Python environment and run:

  ```python
  print("Hello, Python!")
  print(2 + 3)
  ```

  Then deliberately create an error:

  ```python
  print(unknown_name)
  ```

  Read the last line of the traceback first. It names the exception and usually contains the most useful message.
]

#slide(title: "Three Kinds of Problems")[
  #set text(size: 0.88em)
  #simple-table(
    (1.05fr, 1.55fr, 1.85fr),
    (
      [*Problem*], [*What happens*], [*Example*],
      [Syntax error], [Python cannot parse the program], [A missing parenthesis],
      [Runtime exception], [Execution reaches an invalid operation], [Using a name that does not exist],
      [Logic error], [The program runs but gives the wrong result], [Subtracting the discount twice],
    ),
  )

  Debugging compares the intended procedure with the program's actual state and behavior.
]

// ----------------------------------------------------------------------------
// LAB PART 1: VALUES, VARIABLES, TYPES, OPERATORS, STRINGS
// ----------------------------------------------------------------------------

#focus-slide[
Values and Variables]

#slide(title: "Values and Expressions")[
  A value is a piece of data. An expression combines values and operations to produce another value.

  ```python
  42
  3.14
  "wireless sensor"
  True

  12 * 49.90
  (1200 - 300) / 1200
  ```

  Python evaluates the inner operations first, following precedence and parentheses.
]

#slide(title: "Names and Assignment")[
  ```python
  unit_price = 49.90
  quantity = 12
  subtotal = unit_price * quantity
  ```

  - `=` associates a name with a value
  - the right-hand expression is evaluated before the association changes
  - later expressions can use the name
  - a meaningful name documents the role of the value

]

#slide(title: "Basic Python Types")[
  #simple-table(
    (1fr, 1.25fr, 1.9fr),
    (
      [*Type*], [*Example*], [*Typical meaning*],
      [`int`], [`12`], [Whole number],
      [`float`], [`49.90`], [Number with a fractional part],
      [`str`], [`"sensor"`], [Unicode text],
      [`bool`], [`True`], [Logical truth value],
      [`NoneType`], [`None`], [Absence of a value],
    ),
  )

  ```python
  type(49.90)  # float
  ```
]

#slide(title: "Meaningful Variable Names")[
  At school, my friend Ramzi used to name *every variable after himself*:
  
  #simple-table(
    (1fr, 1fr),
    (
      [Ramzi's version], [A readable version],

      [
        ```python
        ramzi1 = 49.90
        ramzi2 = 12
        ramzi3 = ramzi1 * ramzi2
        ```
      ],
      [
        ```python
        unit_price = 49.90
        quantity = 12
        subtotal = unit_price * quantity
        ```
      ],
    ),
  )

  Both programs work, but after five minutes nobody (*not even Ramzi*)
  remembers what `ramzi1`, `ramzi2`, and `ramzi3` mean.

  #align(center)[
    #text(size: 1.2em, weight: "bold")[
      The computer understands both. Humans understand only one.
    ]
  ]
]


#slide(title: "Operators")[
  #set text(size: 0.88em)
  #simple-table(
    (1.05fr, 1.35fr, 2fr),
    (
      [*Family*], [*Operators*], [*Example*],
      [Arithmetic], [`+  -  *  /  //  %  **`], [`7 // 2` gives `3`, while `7 % 2` gives `1`],
      [Comparison], [`==  !=  <  <=  >  >=`], [`total >= 500` gives a boolean],
      [Boolean], [`and  or  not`], [`valid and total >= 500`],
    ),
  )

  `=` assigns a value. `==` compares two values.
]

#slide(title: "Strings and Input")[
  #two-col(
    [
      A string stores text.

      ```python
      product = "  wireless sensor  "
      clean = product.strip().title()
      message = f"Product: {clean}"
      ```

      Python has no separate `char` type. A one-character string is still a string.
    ],
    [
      `input()` always returns a string.

      ```python
      raw = input("Quantity: ")
      quantity = int(raw)
      ```

      Conversions such as `int(...)` and `float(...)` can fail when the text has the wrong format.
    ],
  )
]

// #slide(title: "Exercise 1: Order Total")[
//   #activity("12 minutes")[
//     Create variables for:
//     - a product name
//     - unit price
//     - quantity
//     - discount rate

//     Calculate the subtotal and discounted total. Print a sentence such as:

//     ```text
//     12 Wireless Sensors: €538.92
//     ```

//     Inspect at least two values with `type()`. Then change the inputs and run the cell again.
//   ]
// ]

// #slide(title: "Exercise 1: Solution")[
//   #solution[
//     ```python
//     product = "wireless sensor"
//     unit_price = 49.90
//     quantity = 12
//     discount_rate = 0.10

//     subtotal = unit_price * quantity
//     total = subtotal * (1 - discount_rate)

//     print(f"{quantity} {product.title()}s: €{total:.2f}")
//     print(type(total))
//     ```
//   ]
// ]

#slide(title: "Sequential Execution and State")[
  Python normally executes statements from top to bottom.

  #simple-table(
    (1.45fr, 1.2fr, 1.2fr),
    (
      [*Statement*], [*Name changed*], [*New value*],
      [`quantity = 12`], [`quantity`], [`12`],
      [`unit_price = 49.90`], [`unit_price`], [`49.90`],
      [`subtotal = quantity * unit_price`], [`subtotal`], [`598.8`],
      [`quantity = quantity + 1`], [`quantity`], [`13`],
    ),
  )

  A variable's current value depends on which statements have already executed.
]

// ----------------------------------------------------------------------------
// LAB PART 2: CONDITIONS
// ----------------------------------------------------------------------------

#focus-slide[Conditions]

#slide(title: "Boolean Conditions")[
  Comparisons produce `True` or `False`.

  ```python
  total >= 500
  quantity == 0
  product != ""
  ```

  Boolean operators combine conditions:

  ```python
  total >= 500 and quantity >= 10
  product == "sensor" or product == "gateway"
  not quantity == 0
  ```
]

#slide(title: "Boolean Logic: Truth Tables")[
  #grid(
    columns: (1fr, 1fr, 0.8fr),
    gutter: 1em,

    [
      #align(center)[AND]

      #simple-table(
        (1fr, 1fr, 1.3fr),
        (
          [A], [B], [A and B],
          [`F`], [`F`], [`F`],
          [`F`], [`T`],  [`F`],
          [`T`],  [`F`], [`F`],
          [`T`],  [`T`],  [`T`],
        ),
      )
    ],

    [
      #align(center)[OR]

      #simple-table(
        (1fr, 1fr, 1.3fr),
        (
          [A], [B], [A or B],
          [`F`], [`F`], [`F`],
          [`F`], [`T`],  [`T`],
          [`T`],  [`F`], [`T`],
          [`T`],  [`T`],  [`T`],
        ),
      )
    ],

    [
      #align(center)[NOT]

      #simple-table(
        (1fr, 1fr),
        (
          [A], [not A],
          [`F`], [`T`],
          [`T`],  [`F`],
        ),
      )
    ],
  )

]

#slide(title: "Conditional Execution")[
  ```python
  if total >= 500:
      label = "high-value order"
  else:
      label = "standard order"

  print(label)
  ```

  - Python evaluates the condition
  - exactly one branch runs
  - indentation defines the body of each branch
  - execution continues after the conditional
]

#slide(title: "Several Mutually Exclusive Cases")[
  ```python
  if total <= 0:
      label = "invalid"
  elif total >= 500:
      label = "high value"
  elif total >= 100:
      label = "standard"
  else:
      label = "small"
  ```

  Python tests conditions from top to bottom and runs the first matching branch. The order therefore changes the result.
]

// #slide(title: "Exercise 2: Order Classification")[
//   #activity("12 minutes")[
//     Ask the user for an order amount with `input()` and convert it to `float`.

//     Classify it as:
//     - `invalid` when the amount is zero or negative
//     - `high value` when it is at least 500
//     - `standard` otherwise

//     Test `-10`, `0`, `499.99`, and `500`.

//     *Extension:* add a boolean `is_vip` and classify VIP orders of at least 250 as `priority`.
//   ]
// ]

// #slide(title: "Exercise 2: Solution")[
//   #solution[
//     ```python
//     amount = float(input("Order amount: "))

//     if amount <= 0:
//         label = "invalid"
//     elif amount >= 500:
//         label = "high value"
//     else:
//         label = "standard"

//     print(f"Classification: {label}")
//     ```
//   ]

//   Boundary values deserve explicit tests because they expose incorrect comparison operators.
// ]

// ----------------------------------------------------------------------------
// LAB PART 3: LOOPS
// ----------------------------------------------------------------------------

#focus-slide[Loops]

#slide(title: "Lists and For Loops")[
  A list stores an ordered collection of values.

  ```python
  amounts = [120.0, 75.5, 630.0, -5.0, 240.0]

  for amount in amounts:
      print(amount)
  ```

  The loop assigns each element to `amount`, runs the indented body, and then advances to the next element.
]

#slide(title: "Accumulator Pattern")[
  A loop can update state that summarizes the elements seen so far.

  ```python
  total = 0

  for amount in amounts:
      if amount > 0:
          total = total + amount

  print(total)
  ```

  Initialize the accumulator before the loop. Updating it inside the loop preserves information across iterations.
]

#slide(title: "Range and While")[
  #two-col(
    [
      `range(n)` produces integers from `0` to `n - 1`.

      ```python
      for index in range(3):
          print(index)
      ```

      Use a `for` loop when iterating over a collection or known sequence.
    ],
    [
      A `while` loop repeats while its condition remains true.

      ```python
      attempts = 3
      while attempts > 0:
          print(attempts)
          attempts = attempts - 1
      ```

      The body must eventually make the condition false.
    ],
  )
]

// #slide(title: "Exercise 3: Order Summary")[
//   #activity("15 minutes")[
//     Starting from:

//     ```python
//     amounts = [120.0, 75.5, 630.0, -5.0, 240.0]
//     ```

//     Use a loop to calculate:
//     - the total of positive amounts
//     - the number of valid amounts
//     - the number of amounts at least 500
//     - the mean of valid amounts

//     Ignore zero and negative values. Print a readable summary.
//   ]
// ]

// #slide(title: "Exercise 3: Solution")[
//   #set text(size: 0.84em)
//   #solution[
//     ```python
//     amounts = [120.0, 75.5, 630.0, -5.0, 240.0]
//     total = 0
//     valid_count = 0
//     high_count = 0

//     for amount in amounts:
//         if amount > 0:
//             total = total + amount
//             valid_count = valid_count + 1
//             if amount >= 500:
//                 high_count = high_count + 1

//     mean = total / valid_count
//     print(f"Total: €{total:.2f}, mean: €{mean:.2f}")
//     print(f"High-value orders: {high_count}")
//     ```
//   ]
// ]

// ----------------------------------------------------------------------------
// LAB PART 4: COLLECTIONS
// ----------------------------------------------------------------------------

#focus-slide[Collections]

#slide(title: "Lists")[
  Lists are ordered, mutable, and allow duplicate values.

  ```python
  amounts = [120.0, 75.5, 630.0]

  first = amounts[0]
  amounts.append(240.0)
  count = len(amounts)
  largest = max(amounts)
  total = sum(amounts)
  ```

  Indices start at `0`. An invalid index raises `IndexError`.
]

#slide(title: "Dictionaries, Sets, and Strings")[
  #set text(size: 0.86em)
  #simple-table(
    (1fr, 1.5fr, 1.9fr),
    (
      [*Structure*], [*Main idea*], [*Example*],
      [Dictionary], [Unique keys associated with values], [`{"total": 1065.5, "count": 4}`],
      [Set], [Unique elements with no order to rely on], [`{"standard", "high value"}`],
      [String], [Immutable sequence of Unicode characters], [`"sensor"[0]` gives `"s"`],
    ),
  )

  Choose a structure based on how the program needs to access and update the information.
]

#slide(title: "A Record as a Dictionary")[
  ```python
  order = {
      "product": "wireless sensor",
      "amount": 598.80,
      "customer": "ACME",
      "paid": True,
  }

  print(order["amount"])
  order["paid"] = False
  ```

  A dictionary groups fields that describe one entity. A list of dictionaries can represent several records.
]

// #slide(title: "Collection Practice")[
//   #activity("8 minutes")[
//     Build a `summary` dictionary from Exercise 3 with these keys:

//     ```text
//     total, valid_count, high_count, mean
//     ```

//     Print the mean using the dictionary. Then create a set from:

//     ```python
//     labels = ["standard", "high value", "standard"]
//     ```

//     How many unique labels remain?
//   ]
// ]

// #slide(title: "Collection Practice: Solution")[
//   #solution[
//     ```python
//     summary = {
//         "total": total,
//         "valid_count": valid_count,
//         "high_count": high_count,
//         "mean": mean,
//     }

//     print(f"Mean: €{summary['mean']:.2f}")

//     labels = ["standard", "high value", "standard"]
//     unique_labels = set(labels)
//     print(len(unique_labels))  # 2
//     ```
//   ]
// ]

// ----------------------------------------------------------------------------
// LAB PART 5: FUNCTIONS
// ----------------------------------------------------------------------------

#focus-slide[Functions]

#slide(title: "Defining and Calling a Function")[
  ```python
  def classify_order(amount):
      if amount <= 0:
          return "invalid"
      elif amount >= 500:
          return "high value"
      else:
          return "standard"

  label = classify_order(630.0)
  print(label)
  ```

  The definition creates the function. A call executes its body with a specific argument.
]

#slide(title: "Parameters, Arguments, and Return Values")[
  #simple-table(
    (1.15fr, 2.7fr),
    (
      [*Term*], [*Meaning*],
      [Parameter], [Name used by the function definition, such as `amount`],
      [Argument], [Value supplied by a call, such as `630.0`],
      [Return value], [Result sent back to the caller],
      [Local variable], [Name created inside the function and unavailable outside it],
    ),
  )

  A clear function has a small purpose and a predictable interface.
]

#slide(title: "Print and Return")[
  #two-col(
    [
      `print(...)` displays text for a person.

      ```python
      def show_total(total):
          print(total)
      ```

      The displayed text is not automatically available for another calculation.
    ],
    [
      `return` sends a value to the caller.

      ```python
      def add_tax(price, tax):
          return price + tax
      ```

      The caller can store, print, compare, or combine the returned value.
    ],
  )
]

#slide(title: "Lambda Functions")[
  A *lambda expression* creates a small anonymous function.

  #align(center)[
    `lambda parameters: expression`
  ]

  #two-col(
    [
      *Named function*

      ```python
      def last_character(name):
          return name[-1]

      names = ["Ada", "Grace", "Alan"]

      sorted(names, key=last_character)
      ```
    ],
    [
      *Lambda function*

      ```python
      names = ["Ada", "Grace", "Alan"]

      sorted(
          names,
          key=lambda name: name[-1]
      )
      ```
    ],
  )

  Both versions produce:

  ```python
  ["Ada", "Grace", "Alan"]
  ```
  - A lambda can contain only one expression.
  - Python returns the result of that expression automatically.
  - Lambdas are useful when a short function is needed only once, often as an argument to another function.
]

#slide(title: "Recursive Functions")[
  A *recursive function* solves a problem by calling itself on a smaller
  version of the same problem.

  #two-col(
    [
      *Factorial*

      For a non-negative integer $n$:

      $ n! = n times (n - 1) times dots.c times 1 $

      ```python
      def factorial(n):
          if n == 0:
              return 1

          return n * factorial(n - 1)
      ```
    ],
    [
      *Executing `factorial(4)`*

      ```text
      factorial(4)
      = 4 * factorial(3)
      = 4 * 3 * factorial(2)
      = 4 * 3 * 2 * factorial(1)
      = 4 * 3 * 2 * 1 * factorial(0)
      = 4 * 3 * 2 * 1 * 1
      = 24
      ```
    ],
  )

  #v(1.8em)
  - `n == 0` is the *base case*: it stops the recursion.
  - `factorial(n - 1)` is the *recursive case*: each call moves closer to the base case.
  - Without a reachable base case, the function continues calling itself until Python raises a `RecursionError`.

]
// #slide(title: "Final Exercise: Summarize Orders")[
//   #activity("18 minutes")[
//     Write a function:

//     ```python
//     summarize(amounts, threshold)
//     ```

//     It must ignore non-positive amounts and return a dictionary containing:
//     - `total`
//     - `valid_count`
//     - `mean`
//     - `high_count`

//     When no valid amounts exist, use `None` for the mean. Test at least two lists, including one with no valid values.
//   ]
// ]

// #slide(title: "Final Exercise: Core Logic")[
//   #set text(size: 0.82em)
//   #solution[
//     ```python
//     def summarize(amounts, threshold):
//         total = 0
//         valid_count = 0
//         high_count = 0

//         for amount in amounts:
//             if amount > 0:
//                 total = total + amount
//                 valid_count = valid_count + 1
//                 if amount >= threshold:
//                     high_count = high_count + 1

//         if valid_count == 0:
//             mean = None
//         else:
//             mean = total / valid_count
//     ```
//   ]
// ]

// #slide(title: "Final Exercise: Result and Tests")[
//   #set text(size: 0.84em)
//   #solution[
//     Complete the function with:

//     ```python
//         return {
//             "total": total,
//             "valid_count": valid_count,
//             "mean": mean,
//             "high_count": high_count,
//         }
//     ```

//     Then test it:

//     ```python
//     amounts = [120.0, 75.5, 630.0, -5.0, 240.0]
//     result = summarize(amounts, 500)
//     print(result)

//     empty_result = summarize([-4.0, 0.0], 500)
//     print(empty_result)
//     ```
//   ]
// ]

// #slide(title: "Laboratory Recap")[
//   The program now combines the main building blocks:

//   - values and names represent state
//   - expressions calculate new values
//   - conditions select a branch
//   - loops repeat work across a collection
//   - dictionaries organize a result
//   - functions package a reusable procedure

//   #v(0.6em)
//   #callout[The next step is practice: change the data, test boundary cases, read each error, and explain why the program behaves as it does.]
// ]
