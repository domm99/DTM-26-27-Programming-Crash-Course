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
  title: "Lesson 01: Computers, Programs, and Python",
  subtitle: "Introduction to Programming, Digital Transformation Management 2026–27",
  author: author,
)

#slide(title: "Two Teaching Blocks")[
  #simple-table(
    (1fr, 1.25fr, 2.25fr),
    (
      [*Time*], [*Setting*], [*Purpose*],
      [First 3 hours], [Classroom], [Build a mental model of hardware, operating systems, algorithms, and programming languages],
      [Last 3 hours], [Laboratory], [Use Python and develop a small program through progressive exercises],
    ),
  )

  #v(0.8em)
  #callout[The first block explains what happens underneath a program. The second block turns those ideas into code.]
]

#slide(title: "Learning Goals")[
  By the end of the lesson, you should be able to:

  - explain how a computer represents and processes information
  - distinguish hardware, software, operating systems, and applications
  - explain why programming languages need translators
  - turn a small problem into a precise algorithm
  - write Python programs with values, decisions, loops, collections, and functions
  - read simple error messages and improve a program incrementally
]

// =============================================================================
// CLASSROOM BLOCK
// =============================================================================

#focus-slide[Classroom Block\
Foundations]

// ----------------------------------------------------------------------------
// PART 1: INTRODUCTION
// ----------------------------------------------------------------------------

#focus-slide[Part 1\
Why Computers and Programming?]

#slide(title: "Why We Use Computers")[
  #two-col(
    [
      Computers are useful when a task requires:
      - many repeated operations
      - large amounts of information
      - consistent application of rules
      - fast communication between systems
      - simulation of alternatives

      They trade human effort for a precise procedure that can run at scale.
    ],
    [#placeholder("one human task expanding into repeated calculation, data analysis, automation, and simulation", height: 9em)],
  )
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

#slide(title: "A Manual Workflow and a Program")[
  #two-col(
    [
      *Manual workflow*
      + Open every monthly file
      + Remove invalid rows
      + Group entries by category
      + Calculate totals
      + Produce a report
    ],
    [
      *Programmed workflow*
      - stores the procedure once
      - applies the same rules each time
      - handles larger inputs
      - records errors consistently
      - can run whenever new data arrives
    ],
  )
]

#slide(title: "Software Across Industries")[
  #placeholder("collage of manufacturing, healthcare, logistics, finance, public services, and scientific research software", height: 8.5em)

  Software now coordinates physical processes, records decisions, connects organizations, and turns data into actions. This makes basic programming literacy useful even outside software development.
]

#slide(title: "Computational Thinking")[
  Computational thinking helps us turn an informal goal into a procedure that someone else, or a computer, can follow.

  - *Decomposition:* divide the problem into manageable parts
  - *Pattern recognition:* identify repeated cases and shared structure
  - *Abstraction:* keep relevant details and hide the rest
  - *Algorithm design:* define ordered and unambiguous steps
  - *Evaluation:* test the result and revise incorrect assumptions
]

#slide(title: "One Problem, Five Thinking Tools")[
  Problem: produce a weekly summary from hundreds of order records.

  #set text(size: 0.88em)
  #simple-table(
    (1.15fr, 2.8fr),
    (
      [*Tool*], [*Question*],
      [Decomposition], [Which smaller tasks make up the report?],
      [Patterns], [Which fields and rules repeat for every order?],
      [Abstraction], [Which details affect the report?],
      [Algorithm], [In what order should the tasks run?],
      [Evaluation], [Which examples and edge cases prove that it works?],
    ),
  )
]

// Teaching note: collect two examples and reuse one later when discussing algorithms.
#slide(title: "Automation Candidate")[
  #activity("4 minutes")[
    Think of a task from university or work that is repetitive, rule-based, or data-heavy.

    Write down:
    + the input
    + the desired output
    + the main steps
    + one exceptional case
  ]
]

// ----------------------------------------------------------------------------
// PART 2: HARDWARE
// ----------------------------------------------------------------------------

#focus-slide[Part 2\
Hardware and Information]

#slide(title: "A Computer Seen From the Outside")[
  #placeholder("input, processing, output, and storage around a laptop, including keyboard, file, network, screen, and saved file", height: 8em)

  - *Input* brings information into the system
  - *Processing* transforms the information according to instructions
  - *Output* communicates the result
  - *Storage* preserves information for later use

  This simple model works for a laptop, a server, a smartphone, or an embedded controller.
]

#slide(title: "Layers of a Computer System")[
  #placeholder("vertical stack with electronics, hardware components, operating system, language runtime, application, and user", height: 9em)

  Each layer exposes a simpler interface and hides details below it. These abstractions let us build applications without controlling individual electrical signals.
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
    [#placeholder("open desktop computer with CPU, RAM, SSD, GPU, motherboard, power supply, and ports labelled", height: 9em)],
  )
]

#slide(title: "The Motherboard")[
  #two-col(
    [
      The motherboard provides the physical and electrical connections among components.

      It contains sockets, memory slots, data links, controllers, and connectors. It also distributes power and carries timing and control signals.

      The motherboard coordinates communication. It does not perform all computation itself.
    ],
    [#placeholder("annotated motherboard with CPU socket, RAM slots, storage connector, GPU slot, and external ports", height: 9.5em)],
  )
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

#slide(title: "Binary Place Values")[
  #placeholder("four binary columns labelled 8, 4, 2, 1, with 1011 producing 11", height: 7em)

  ```text
  1011₂ = 1×8 + 0×4 + 1×2 + 1×1
         = 11₁₀
  ```

  Binary uses positional notation like decimal, but every position represents a power of 2.
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

#slide(title: "Binary Check")[
  #activity("3 minutes")[
    + Convert `10₁₀` to binary
    + Convert `10110₂` to decimal
    + Find the largest unsigned value that fits in four bits
  ]

  #v(0.5em)
  Answers: `1010₂`, `22₁₀`, and `15`.
]

#slide(title: "ASCII and Unicode")[
  #two-col(
    [
      *ASCII*

      The original ASCII standard assigns numbers from 0 to 127 to letters, digits, punctuation, and control characters.

      ```text
      A = 65 = 01000001
      a = 97 = 01100001
      ```
    ],
    [
      *Unicode and UTF-8*

      Unicode assigns code points to characters across many writing systems. UTF-8 encodes those code points as one or more bytes.

      One byte does not always equal one character.
    ],
  )
]

#slide(title: "Logical Bits and Electrical Signals")[
  #two-col(
    [
      A bit is an abstract logical state. Digital circuits often represent it with voltage ranges:

      - a low range means logical `0`
      - a high range means logical `1`

      Ranges provide tolerance against small amounts of electrical noise.
    ],
    [#placeholder("voltage axis with low range, undefined transition region, and high range", height: 8.5em)],
  )
]

#slide(title: "Transistors and Logic")[
  #two-col(
    [
      A transistor can control whether current flows. Networks of transistors form logic gates.

      Gates implement operations such as `NOT`, `AND`, and `OR`. Larger circuits combine gates into adders, memory cells, and processors.

      Software eventually causes physical signals to move through these circuits.
    ],
    [#placeholder("transistor as a switch beside simple NOT and AND gates", height: 9em)],
  )
]

// Source: Nappa, Hobbs, and Lanzi, arXiv:2105.05103. Belgian 2003 expert report cited there.
#slide(title: "A Bit Flip With 4,096 Consequences")[
  #two-col(
    [
      During the 2003 Belgian election, an electronic tally in Schaerbeek gave one candidate 4,096 extra preference votes.

      `4,096 = 2¹²`, which matches changing one binary position from 0 to 1.

      The expert report described a probable random bit inversion in memory. The precise physical cause was not proven.
    ],
    [#placeholder("vote count before and after one highlighted bit flips, changing the value by 4096", height: 9em)],
  )

  #source-note[#link("https://arxiv.org/abs/2105.05103")[Nappa et al., “Deja-Vu,” 2021, arXiv:2105.05103]]
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
  #placeholder("stored-program architecture with CPU, memory, input/output, and persistent storage, with instructions and data labelled in memory", height: 9em)

  The diagram is an abstraction, not a literal map of a modern chip. Its value comes from showing the roles and communication among components.
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
    [#placeholder("simplified CPU with control unit, arithmetic logic unit, registers, cache, and multiple cores", height: 9em)],
  )
]

#slide(title: "Fetch, Decode, Execute")[
  #placeholder("cycle with four stages: fetch instruction, decode operation, execute, store result", height: 7.5em)

  The CPU repeatedly:
  + fetches an instruction from memory
  + decodes what the instruction requests
  + executes the operation
  + stores the result and selects the next instruction

  Real processors overlap and reorder work, but this simplified cycle remains a useful model.
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

#slide(title: "The GPU")[
  #two-col(
    [
      A GPU contains many processing units designed to perform similar operations on many data elements.

      Graphics naturally requires this form of parallel work. The same capability also supports scientific computing and machine learning.

      A CPU remains better suited to many irregular, sequential, or control-heavy tasks.
    ],
    [#placeholder("CPU with a few powerful cores compared with GPU containing many smaller parallel units", height: 9em)],
  )
]

#slide(title: "Opening an Application")[
  #placeholder("program files on storage, operating system creating a process, code and data in RAM, CPU executing instructions, output on screen", height: 8.5em)

  + Program files already exist on persistent storage
  + The operating system creates a process and maps the required code and data into memory
  + The CPU executes instructions from that process
  + The application requests files, devices, network access, and screen output through the operating system
]

#focus-slide[Break\
10 minutes]

// ----------------------------------------------------------------------------
// PART 3: OPERATING SYSTEMS
// ----------------------------------------------------------------------------

#focus-slide[Part 3\
Operating Systems]

#slide(title: "The Problem an Operating System Solves")[
  #two-col(
    [
      A computer contains different processors, memories, devices, and communication links.

      Without a common manager, every application would need to control each device directly and negotiate resource use with every other application.
    ],
    [#placeholder("applications competing for CPU, memory, disk, display, and network, followed by an OS mediating access", height: 9em)],
  )
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
      - files have names and metadata
      - directories group files and other directories
      - paths identify locations
      - permissions restrict access

      The file system is an operating-system abstraction over storage devices.
    ],
    [#placeholder("directory tree with project, data, src, report.py, and orders.csv", height: 9em)],
  )
]

#slide(title: "File System pt.2")[

  qui slide con gli alberi di come sono organizzati diversamente i FS in linux/windows
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
  An algorithm is a finite and unambiguous procedure that transforms valid input into a result or observable effect.

  A useful algorithm states:
  - what input it expects
  - which steps run and in what order
  - how it handles relevant cases
  - when it stops

  We also evaluate correctness, execution time, and memory use.
]

#slide(title: "Natural Language Can Be Ambiguous")[
  Consider this instruction:

  #align(center)[_“Take the largest value and divide it by two if it is positive.”_]

  Questions appear immediately:
  - What happens if the collection is empty?
  - What happens when several values share the maximum?
  - Does “it” refer to the value or the result?
  - What should happen when the maximum is zero or negative?

  Humans use context to resolve ambiguity. Computers need explicit rules.
]

#slide(title: "A More Precise Procedure")[
  ```text
  input: a non-empty collection of numbers

  largest = maximum value in the collection

  if largest > 0:
      output largest / 2
  otherwise:
      output largest
  ```

  The procedure now defines its input, condition, branches, and output.
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
  #placeholder("ladder with machine code, assembly, C, and Python, showing increasing abstraction and decreasing direct hardware control", height: 9em)

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

#slide(title: "The Translation Chain")[
  #placeholder("source code, translator, intermediate or machine representation, operating system, CPU", height: 8.5em)

  The programmer writes source code. Translators and runtimes convert that code into operations supported by the execution environment. The CPU ultimately executes machine instructions.
]

#slide(title: "Compiler")[
  #two-col(
    [
      A compiler analyzes source code and produces another representation before the program runs.

      The output may be native machine code or an intermediate form such as bytecode.

      Translation happens once per build, while the result may run many times.
    ],
    [#placeholder("translator finishing an entire book before readers receive the translated edition", height: 8.5em)],
  )
]

#slide(title: "Interpreter")[
  #two-col(
    [
      An interpreter executes a program representation while the program runs.

      This supports interactive experimentation and allows the runtime to inspect the current execution state.

      The interpreter must be available on the machine that runs the program.
    ],
    [#placeholder("simultaneous interpreter translating while a speaker talks", height: 8.5em)],
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

#slide(title: "Real Implementations Combine Strategies")[
  The categories describe execution strategies rather than permanent properties of a language.

  #v(0.5em)
  #simple-table(
    (1fr, 2.8fr),
    (
      [*Implementation*], [*Typical path*],
      [C compiler], [Source code becomes native machine code],
      [Java virtual machine], [Source becomes bytecode, then the virtual machine interprets or compiles it],
      [Browser JavaScript engine], [The engine interprets code and compiles frequently used parts],
      [CPython], [Python source becomes bytecode, then the Python virtual machine executes it],
    ),
  )
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
  #placeholder("three small flowcharts: sequence, if/else selection, and loop with a condition", height: 9em)

  A flowchart makes execution order visible. Each decision needs a condition with a true or false result. Each loop needs a path that eventually stops.
]

#slide(title: "Algorithm Design Check")[
  #activity("5 minutes")[
    Return to the automation candidate from the beginning.

    + Divide it into four to seven ordered steps
    + Add one explicit decision
    + Add one repeated action
    + State a stopping condition
    + Identify one input that should produce an error
  ]
]

#slide(title: "Bridge to Python")[
  The classroom block established the complete path:

  #align(center)[*problem · algorithm · source code · runtime · operating system · hardware · physical state*]

  #v(0.8em)
  In the laboratory, we move in the other direction. We start with a problem, write Python source code, execute it, inspect the state, and correct the result.
]

// =============================================================================
// LAB BLOCK
// =============================================================================

#focus-slide[Laboratory Block\
Python Fundamentals]

#slide(title: "Laboratory Plan")[
  #set text(size: 0.88em)
  #simple-table(
    (1.1fr, 2.3fr, 1.15fr),
    (
      [*Time*], [*Topic*], [*Mode*],
      [00:00–00:20], [Ways to run Python and first program], [Demo + setup],
      [00:20–00:55], [Values, variables, types, operators, strings], [Demo + exercise],
      [00:55–01:25], [Execution flow and conditions], [Demo + exercise],
      [01:25–01:35], [Break], [10 minutes],
      [01:35–02:05], [Loops], [Demo + exercise],
      [02:05–02:30], [Collections], [Demo + practice],
      [02:30–02:40], [Functions], [Demo],
      [02:40–03:00], [Final exercise and recap], [Work + debrief],
    ),
  )
]

#slide(title: "Why Python")[
  #two-col(
    [
      Python offers:
      - readable syntax
      - immediate interactive feedback
      - libraries for data, automation, science, web systems, and machine learning
      - the same language for small scripts and large projects
    ],
    [
      In this laboratory, Python lets us focus on the concepts:
      - values and state
      - decisions
      - repetition
      - reusable procedures

      The syntax remains visible, but it does not dominate the lesson.
    ],
  )
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

  #v(0.5em)
  We will use a notebook for exercises, while also seeing how the same code works in a script.
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
  #two-col(
    [
      A larger program is divided across files and directories:
      - source modules
      - tests
      - documentation
      - configuration and dependency metadata

      Phyelds is a Python toolkit for building and experimenting with decentralized adaptive systems.
    ],
    [#placeholder("screenshot of the phyelds/phyelds GitHub repository, highlighting README, src, tests, and pyproject.toml", height: 9em)],
  )

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

#focus-slide[Lab 1\
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
      [**Ramzi's version**], [**A readable version**],

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

  Both programs work, but after five minutes nobody — *not even Ramzi* —
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
      A string stores Unicode text.

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

#slide(title: "Exercise 1: Order Total")[
  #activity("12 minutes")[
    Create variables for:
    - a product name
    - unit price
    - quantity
    - discount rate

    Calculate the subtotal and discounted total. Print a sentence such as:

    ```text
    12 Wireless Sensors: €538.92
    ```

    Inspect at least two values with `type()`. Then change the inputs and run the cell again.
  ]
]

#slide(title: "Exercise 1: Solution")[
  #solution[
    ```python
    product = "wireless sensor"
    unit_price = 49.90
    quantity = 12
    discount_rate = 0.10

    subtotal = unit_price * quantity
    total = subtotal * (1 - discount_rate)

    print(f"{quantity} {product.title()}s: €{total:.2f}")
    print(type(total))
    ```
  ]
]

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

#focus-slide[Lab 2\
Conditions]

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
      #align(center)[**AND**]

      #simple-table(
        (1fr, 1fr, 1.3fr),
        (
          [**A**], [**B**], [**A and B**],
          [`F`], [`F`], [`F`],
          [`F`], [`T`],  [`F`],
          [`T`],  [`F`], [`F`],
          [`T`],  [`T`],  [`T`],
        ),
      )
    ],

    [
      #align(center)[**OR**]

      #simple-table(
        (1fr, 1fr, 1.3fr),
        (
          [**A**], [**B**], [**A or B**],
          [`F`], [`F`], [`F`],
          [`F`], [`T`],  [`T`],
          [`T`],  [`F`], [`T`],
          [`T`],  [`T`],  [`T`],
        ),
      )
    ],

    [
      #align(center)[**NOT**]

      #simple-table(
        (1fr, 1fr),
        (
          [**A**], [**not A**],
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

#slide(title: "Exercise 2: Order Classification")[
  #activity("12 minutes")[
    Ask the user for an order amount with `input()` and convert it to `float`.

    Classify it as:
    - `invalid` when the amount is zero or negative
    - `high value` when it is at least 500
    - `standard` otherwise

    Test `-10`, `0`, `499.99`, and `500`.

    *Extension:* add a boolean `is_vip` and classify VIP orders of at least 250 as `priority`.
  ]
]

#slide(title: "Exercise 2: Solution")[
  #solution[
    ```python
    amount = float(input("Order amount: "))

    if amount <= 0:
        label = "invalid"
    elif amount >= 500:
        label = "high value"
    else:
        label = "standard"

    print(f"Classification: {label}")
    ```
  ]

  Boundary values deserve explicit tests because they expose incorrect comparison operators.
]

#focus-slide[Break\
10 minutes]

// ----------------------------------------------------------------------------
// LAB PART 3: LOOPS
// ----------------------------------------------------------------------------

#focus-slide[Lab 3\
Loops]

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

#slide(title: "Exercise 3: Order Summary")[
  #activity("15 minutes")[
    Starting from:

    ```python
    amounts = [120.0, 75.5, 630.0, -5.0, 240.0]
    ```

    Use a loop to calculate:
    - the total of positive amounts
    - the number of valid amounts
    - the number of amounts at least 500
    - the mean of valid amounts

    Ignore zero and negative values. Print a readable summary.
  ]
]

#slide(title: "Exercise 3: Solution")[
  #set text(size: 0.84em)
  #solution[
    ```python
    amounts = [120.0, 75.5, 630.0, -5.0, 240.0]
    total = 0
    valid_count = 0
    high_count = 0

    for amount in amounts:
        if amount > 0:
            total = total + amount
            valid_count = valid_count + 1
            if amount >= 500:
                high_count = high_count + 1

    mean = total / valid_count
    print(f"Total: €{total:.2f}, mean: €{mean:.2f}")
    print(f"High-value orders: {high_count}")
    ```
  ]
]

// ----------------------------------------------------------------------------
// LAB PART 4: COLLECTIONS
// ----------------------------------------------------------------------------

#focus-slide[Lab 4\
Collections]

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

#slide(title: "Collection Practice")[
  #activity("8 minutes")[
    Build a `summary` dictionary from Exercise 3 with these keys:

    ```text
    total, valid_count, high_count, mean
    ```

    Print the mean using the dictionary. Then create a set from:

    ```python
    labels = ["standard", "high value", "standard"]
    ```

    How many unique labels remain?
  ]
]

#slide(title: "Collection Practice: Solution")[
  #solution[
    ```python
    summary = {
        "total": total,
        "valid_count": valid_count,
        "high_count": high_count,
        "mean": mean,
    }

    print(f"Mean: €{summary['mean']:.2f}")

    labels = ["standard", "high value", "standard"]
    unique_labels = set(labels)
    print(len(unique_labels))  # 2
    ```
  ]
]

// ----------------------------------------------------------------------------
// LAB PART 5: FUNCTIONS
// ----------------------------------------------------------------------------

#focus-slide[Lab 5\
Functions]

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

#slide(title: "Final Exercise: Summarize Orders")[
  #activity("18 minutes")[
    Write a function:

    ```python
    summarize(amounts, threshold)
    ```

    It must ignore non-positive amounts and return a dictionary containing:
    - `total`
    - `valid_count`
    - `mean`
    - `high_count`

    When no valid amounts exist, use `None` for the mean. Test at least two lists, including one with no valid values.
  ]
]

#slide(title: "Final Exercise: Core Logic")[
  #set text(size: 0.82em)
  #solution[
    ```python
    def summarize(amounts, threshold):
        total = 0
        valid_count = 0
        high_count = 0

        for amount in amounts:
            if amount > 0:
                total = total + amount
                valid_count = valid_count + 1
                if amount >= threshold:
                    high_count = high_count + 1

        if valid_count == 0:
            mean = None
        else:
            mean = total / valid_count
    ```
  ]
]

#slide(title: "Final Exercise: Result and Tests")[
  #set text(size: 0.84em)
  #solution[
    Complete the function with:

    ```python
        return {
            "total": total,
            "valid_count": valid_count,
            "mean": mean,
            "high_count": high_count,
        }
    ```

    Then test it:

    ```python
    amounts = [120.0, 75.5, 630.0, -5.0, 240.0]
    result = summarize(amounts, 500)
    print(result)

    empty_result = summarize([-4.0, 0.0], 500)
    print(empty_result)
    ```
  ]
]

#slide(title: "Laboratory Recap")[
  The program now combines the main building blocks:

  - values and names represent state
  - expressions calculate new values
  - conditions select a branch
  - loops repeat work across a collection
  - dictionaries organize a result
  - functions package a reusable procedure

  #v(0.6em)
  #callout[The next step is practice: change the data, test boundary cases, read each error, and explain why the program behaves as it does.]
]
