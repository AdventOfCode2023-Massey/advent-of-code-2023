# Advent Of Code 2023: Solutions by AI
Copyright (c) 2023 Bart Massey

Herein lie solutions to the programs of the 2023 [Advent of
Code](http://adventofcode.com) through Day 5 Part 1. The
approach this year was "Advent Of Copilot": I had an AI
write the code from the problem descriptions, giving it as
little help as possible along the way. I was using GitHub
Copilot, as it's purpose-built for the task of programming
and has a one-month free trial.

The solutions stopped when the fun stopped. For me this was
Day 5 Part 2, where a bunch of tedious interval arithmetic
needed to be done. Copilot got too lost to be helpful, and I
get tired of the exercise.

## Notes

I was overall amazed at the ability of Copilot to write
Python. It used some sophisticated constructions of the
language; its many mistakes were mostly semantics of problem
reading. To be fair, humans make these mistakes on AoC
problems all the time.

I don't know how much faster or slower Copilot was than my
hand-coding would have been. The overall process felt
similar in time taken. (This is part of why I quit AoC: I
don't want to spend several hours a night close to
Christmas.)

I'm glad I tried this, but also glad to be done with it.

## Organization

The solutions are in directories named `day01`, `day02`,
etc. Each day is its own Git submodule. When you clone
this repo, you will need to do

    git submodule update --init

For each solution, we include code written by the AI. The
code is modified as little as practically possible: any
human modifications are clearly commented.

There is a `README.md` in every problem directory containing
a description and evaluation of the day's session, a chat
log for the AI interaction, and other relevant comments.
(We used to included the problem descriptions and my
specific `input.txt`, but apparently the authors of AoC
don't want us to do that.)

## Code Quality

There are no special tests written for this code except
during debugging. Even the ones provided as part of the
problem are usually ignored. I regard passing both parts of
a day's problem as sufficient validation for the AI solution
for now.

These programs are not production-quality: it is often
considered acceptable to panic or produce weird answers on
erroneous input.

## Infrastructure

There's some engineering infrastructure here in the form of
the `template` directory and the `mkday.sh` and other shell
scripts.  These speed each day's setup considerably. At the
beginning of each day we `sh mkday.sh`. (The day number is
tracked automatically but can be overwritten on the command
line.)

## Previously

* [2022](http://github.com/BartMassey/advent-of-code-2022)
  in Rust (incomplete)
* [2020](http://github.com/BartMassey/advent-of-code-2020)
  in Rust (incomplete)
* [2019](http://github.com/BartMassey/advent-of-code-2019)
  in Rust (incomplete)
* [2018](http://gitlab.com/BartMassey/advent-of-code-2018)
  in Javascript (incomplete)
* [2017](http://gitlab.com/BartMassey/advent-of-code-2017)
  in Go
* [2016](http://github.com/BartMassey/advent-of-code-2016)
  in Rust
* [2015](http://github.com/BartMassey/advent-of-code-2015)
  in Haskell

## License

Work produced by me is licensed under the "MIT License".
Please see the file `LICENSE` in the source distribution of
this software for license terms.

Work produced by GitHub Copilot is apparently owned by me
under the [GitHub Copilot Customer
Agreement](https://github.com/customer-terms/github-copilot-product-specific-terms). To
the extend that I have ownership, I also license this work
under the "MIT License" as above.

## Acknowledgments

Advent of Code is a fun exercise up to a point, and we thank
the author and others involved for their work. Thanks also
to `relsqui` for pointing us at this back in 2015.
