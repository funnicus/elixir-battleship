# Documentation

In this documentation, we will go through how I implemented the classic battleship board game using the **Elixir programming language**.
Since Elixir is a functional programming language, it is a bit different than many other more popular languages in how it should be used. We will try to focus on execution model, state, types, abstractions, the data and the control flow and how their implementation in Elixir affected the development of this game.

## Execution model: The Erlang virtual machine

Elixir runs on the Erlang VM, which is also used for the implementation of **Erlang**. Erlang VM is especially powerful for implementing distributed and fault tolerant applications. As a programmer, you can define different kinds of processes for different tasks in your system. The processes can fail and then be restarted in isolation, without crashing the whole system. The execution model of Erlang VM would have definitely come in handy, if I implemented this game to be played as a multiplayer game through the internet for example. However, I made this game to only be played locally against a computer player, so I did not find many benefits from using the Erlang VM compared to any other language platform.

## Functional programming

Elixir is a functional programming language, and behaves a bit differently from many other more popular procedural programming languages.

For starters, Elixir encourages all data to be treated as immutable. Instead data is modified by passing it through a chain of pure functions. This can be a comforting style to program in, as you know for certain that your variables will not change because of unnoticed side-effects. However, it takes some time to get accustomed in this style of programming, and it can feel a bit limiting at the beginning. Using the pipe `|>` operator made chaining of functions together very easy.

Elixir control flow is also a bit different from other languages. The biggest things I immediately noticed were the lack of explicit return statements and loop structures. Loops had to be done with recursive functions. The last statement executed in the function was always the value it returned. Especially the `case` control flow structure was useful in these situations.

In the context of this project, the functional style of writing code seemed to work as well as any other style. I most liked about how it made the code very concise. Also not worrying about function side effects was very nice.

## The type system

Elixir is dynamically-typed, and it does not have a static type system. Coming in with a background in TypeScript, this was certainly my biggest gripe with the language. Static typing brings with it many developer experience improving things that I suddenly could not use with this new language. The **@spec** module attribute helped the situation, but was certainly not enough the get the full feeling of safety types bring.

The lack of static typing did not really come into the way building this project too much, since it is was so small. I wonder though, if this would become an issue with larger codebases. Maybe in those cases, the Erlang VM will be the saving grace.
