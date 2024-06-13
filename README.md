# Game Development Repository

Welcome to the game development repository! This repository contains two games: **SpaceDefender** (developed with Löve and Lua) and **Snake-Game** (developed with Python). This document provides an overview of the games, the programming paradigms used, the challenges faced during development, and instructions for installation and execution.

## Table of Contents

- [Games](#games)
  - [SpaceDefender](#spacedefender)
  - [Snake-Game](#snake-game)
- [Programming Paradigms](#programming-paradigms)
- [Challenges Faced](#challenges-faced)
- [Installation and Execution Instructions](#installation-and-execution-instructions)
- [Contribution](#contribution)
- [License](#license)

## Games

### SpaceDefender

**SpaceDefender** is a space shooter game developed using Löve and Lua. The player controls a spaceship that must defend Earth from waves of asteroids and enemy ships.

#### Features

- Control the spaceship with the keyboard
- Scoring system
- Multiple waves of enemies with increasing difficulty
- Retro sound effects and graphics

#### Technologies Used

- Löve 2D (game framework)
- Lua (programming language)

### Snake-Game

**Snake-Game** is a recreation of the classic snake game, developed in Python. The player controls a snake that must eat food to grow while avoiding collisions with the walls and itself.

#### Features

- Control the snake with arrow keys
- Scoring system
- Gradually increasing speed as the snake grows

#### Technologies Used

- Python
- Pygame (game library)

## Programming Paradigms

During the development of these games, different programming paradigms were applied:

### Object-Oriented Programming (OOP)

OOP was extensively used in the development of **SpaceDefender**. Spaceships, projectiles, and enemies were implemented as objects, allowing for more modular and reusable code.

### Procedural Programming

**Snake-Game** was predominantly developed using the procedural paradigm, where the program flow is based on function calls. This paradigm was chosen for its simplicity and efficiency, given the game's requirements.

## Challenges Faced

### State Management

One of the main challenges was managing the game states, especially in **SpaceDefender**. Implementing smooth transitions between different states, such as the main menu, in-game, and game over screens, required careful planning and the use of state machines.

### Performance and Optimization

Ensuring that both games ran smoothly and responsively was another challenge. For **Snake-Game**, optimizing collision detection to avoid noticeable delays was crucial. For **SpaceDefender**, managing multiple moving objects and real-time collision detection required specific optimization techniques.

### Resource Handling

Dealing with graphic and sound resources was a challenging aspect, particularly in **SpaceDefender**. Ensuring that all resources were loaded correctly and used efficiently without causing performance drops was essential for the user experience.

## Installation and Execution Instructions

### SpaceDefender

1. Make sure you have [Löve 2D](https://love2d.org/) installed.
2. Clone the repository and navigate to the `spacedefender` directory.
3. Run the game with the command:
   love .

### Snake-Game

1. Make sure you have Python and Pygame installed.
2. Clone the repository and navigate to the snake-game directory.
3. Run the game with the command:
   python snake-game.py


## Contributions

Contributions are welcome! Feel free to open issues to report bugs or suggest improvements, and submit pull requests for new features.

## License

MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.




