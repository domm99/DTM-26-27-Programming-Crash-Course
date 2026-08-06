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


#slide(title:"Overview of Developer Tools")[
  - #alert[Why Tools Matter:] Efficiency, Quality, Collaboration
  - #underline[Categories of Tools:]
    - IDEs (Integrated Development Environments)
    - Linters and Code Formatters
    - Debugging Tools
    - Version Control (Git)
    - CI/CD (Continuous Integration/Continuous Delivery)
]

#focus-slide[IDEs]

#slide(title:"IDEs")[
  #align(center)[
    _An #alert[Integrated Development Environment] (IDE) is a comprehensive software tool that provides everything a developer needs in one place. It combines a code editor, compiler/interpreter, debugger, and other useful features to facilitate the software development process._
  ]
  === Why should we use an IDE?
  - #alert[Productivity Boost:] provides shortcuts, code suggestions, and integrated tools to speed up coding
  - #alert[Error Reduction:] immediate feedback through syntax highlighting and error detection
  - #alert[Code Management:] makes organizing, searching, and navigating through large codebases easier

]

#slide(title:"Core features of IDEs")[

  - #alert[Code Editor]
    - The main workspace where you write code.
    - Supports syntax highlighting (colors specific parts of code based on language)
    - Auto-completion suggests possible code completions as you type, speeding up development and reducing errors
    - Many editors offer code snippets, allowing you to insert common code blocks quickly

  - #alert[Debugger]
    - Built-in tools to test and troubleshoot your code.
    - Set breakpoints to pause the execution at specific lines of code
    - Step-through feature to execute code line-by-line, helping you understand the flow and locate bugs
    - Inspect variables and states while the program is running to find incorrect logic or data

  - #alert[Compiler/Interpreter Integration]
    - Run your code directly within the IDE
    - Provides error messages and warnings during compilation, helping you spot issues early
    - Support for various languages through plugins (e.g., Java, Python, C++)
  
  - #alert[Version Control Integration]
    - Built-in tools for managing your code through version control systems like Git
    - Allows you to commit, push, pull, and merge changes directly from the IDE
    - Visual tools for comparing changes between file versions
    
  - #alert[Package Management]
    - IDEs often integrate with package managers like npm (JavaScript) or pip (Python)
    - Allows easy installation and management of external libraries and dependencies
    
  - #alert[Code Refactoring Tools]
    - Simplify and clean up code without changing its functionality
    - Common refactoring options: rename variables, extract methods, inline variables, and more
    - Ensures your code stays maintainable and readable over time
  
  - #alert[Customization & Extensions]
    - Most IDEs support plugins and themes
    - Customize your development environment by adding tools for specific programming languages, linters, code  formatters, or even team collaboration tools like Slack or Jira

]

#slide(title:"Advantages of Using an IDE")[
  - #alert[Efficiency:] a one-stop solution for coding, debugging, testing, and deploying software, no need to switch between different tools
  - #alert[Consistency:] provides a consistent development environment, reducing setup time and ensuring that code behaves the same for all team members
  - #alert[Collaboration:] shared configurations and built-in version control integration make team-based development smoother
  - #alert[Learning Curve:] can simplify the learning process for new developers by offering autocomplete, helpful tooltips, and built-in documentation

]

#slide(title:"Some Popular IDES")[
  #figure(
    image("images/ides.svg")
  )
]

#slide(title:"Choosing the Right IDE")[
  - #alert[Project Type:] some IDEs are optimized for specific languages or platforms. For example, PyCharm for Python, IntelliJ IDEA for Java, or Xcode for iOS/macOS
  - #alert[Customization:] tools like VS Code offer a vast marketplace of extensions, making it a flexible choice for a variety of languages and frameworks
  - #alert[Team Collaboration:] consider the tools your team uses for version control and debugging. IDEs like JetBrains' family (PyCharm, IntelliJ IDEA) and VS Code offer robust Git integration
  - #alert[Performance:] IDEs like Eclipse and IntelliJ IDEA can be heavy on system resources, while lighter editors like VS Code provide flexibility at the cost of requiring more setup for complex workflows
]

#focus-slide[Linters and Code Formatters]

#slide(title:"Linters and Code Formatters")[
  #align(center)[
    _A #alert[linter] is a tool that analyzes your source code for potential errors, bugs, style violations, or suspicious constructs. It helps enforce coding standards, improving code quality and reducing bugs before they even occur_
  ]
]

#slide(title:"Why Linters are Important")[
  - #alert[Prevents bugs early:] helps catch mistakes that could lead to bugs before they reach production
  - #alert[Enforces consistency:] ensures that all team members follow the same coding conventions, making code more readable and maintainable
  - #alert[Saves time:] automated checks reduce the need for manual code reviews on style issues

]

#slide(title:"Common Linter Types")[
  - #alert[Syntax Linters:]
    - Focus on basic #underline[syntactical correctness] (e.g., missing parentheses, incorrect variable declarations)
    - Example: JSLint for JavaScript
  - #alert[Style Linters:]
    - Focus on enforcing #underline[coding style guidelines], such as indentations, naming conventions, and spacing
    - Example: ESLint for JavaScript, Pylint for Python
  - #alert[Static Analysis Linters:]
    - Perform deeper analysis to catch #underline[logical errors or code that may lead to bugs], such as unused variables, unreachable code, or inefficient loops
    - Example: SonarQube (supports multiple languages)
]

#slide(title:"Code Formatters")[
  #align(center)[
    _A #alert[code formatter] is a tool that automatically formats your code to match a specific style guide, ensuring consistency throughout the project_
  ]

  - After writing code, the formatter adjusts the layout, applying uniform styling #underline[based on predefined rules] (such as line length, indentation, spaces vs. tabs, etc.)
  - Why Use a Code Formatter?
    - #alert[Enforces consistency:] keeps code style uniform across the project
    - #alert[Saves time:] developers no longer need to worry about formatting issues during code reviews
    - #alert[Improves readability:] well-formatted code is easier to read and maintain
]

#focus-slide[Debugging Tools]

#slide(title:"Debugging Tools")[
  #align(center)[
    _#alert[Debugging] is the process of identifying, isolating, and fixing issues or bugs in your code. Bugs can manifest as errors, incorrect logic, or unexpected behavior that disrupts the intended functionality of the program._
  ]
  - #underline[Why Debugging is Important:]
    - Ensures your code works as intended
    - Helps identify logical errors or unintended consequences in the code
    - Essential for maintaining code quality and reducing future errors

]

#slide(title:"How Debuggers Work")[
  - A debugger helps you run your code #underline[interactively], allowing you to:
    - #alert[Pause] (Break) the execution at specific points
    - #alert[Inspect] the values of variables and the state of the program at any given point
    - #alert[Step] through code line-by-line to see exactly how it is being executed
    - #alert[Change] variable values during execution to test different scenarios
]

#focus-slide[Version Control System]

#slide(title:"Version Control Systems")[
  #align(center)[
    _A #alert[Version Control System] (VCS) is a tool that tracks and manages changes to code over time. It allows multiple developers to collaborate, maintain historical versions of the code, and resolve conflicts when merging changes from different contributors._
  ]
]

#slide(title:"Why Use Version Control?")[
  - #alert[Collaboration:] multiple developers can work on the same codebase simultaneously
  - #alert[Backup and Restore:] you can revert to previous versions of your code if something goes wrong
  - #alert[Track Changes:] keep a history of all modifications, including what changed, who made the change, and why
  - #alert[Branching and Merging:] safely experiment with new features without disrupting the main codebase
]

#slide(title:"Git")[
  === What is Git?
  - Git is the most popular distributed version control system (VCS) used in software development
  === Why Git?
  - #alert[Distributed:] every developer has a full copy of the entire codebase and its history
  - #alert[Branching:] Git's lightweight branching model encourages experimentation and easy  integration of new features
  - #alert[Speed and Efficiency:] operations like committing changes, switching branches, and merging are very fast in Git compared to older VCS systems
]

#focus-slide[Last Lab]

#slide(title:"Lab 2")[
  #components.side-by-side(columns: (1fr, 1fr), gutter: 0em)[
    #link("https://tinyurl.com/DTM-LAB02")
  ][
    #figure(image("images/DTM-LAB02.svg", width:50%))
  ]
]