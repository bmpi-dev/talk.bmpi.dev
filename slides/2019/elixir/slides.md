---
# try also 'default' to start simple
theme: seriph
download: true
# random image from a curated Unsplash collection by Anthony
# like them? see https://unsplash.com/collections/94734566/slidev
background: https://source.unsplash.com/collection/94734566/1920x1080
# apply any windi css classes to the current slide
class: 'text-center'
# https://sli.dev/custom/highlighters.html
highlighter: shiki
# show line numbers in code blocks
lineNumbers: false
# some information about the slides, markdown enabled
info: |
  ## Slidev Starter Template
  Presentation slides for developers.

  Learn more at [Sli.dev](https://sli.dev)
---

# Elixir

Presented by [@Dawei Ma](https://twitter.com/madawei2699)

---
layout: center
class: text-center
---

![](https://img.bmpi.dev/3c4893ed-d5ef-e8f3-d24b-4b7318b582ba.png)

<v-click>

从入门到失业

</v-click>

---

## My programming language learning path

* C/C++ 
* Java/Scala (SpringBoot/Play2/Vert.x/RxJava)
* Swift/Objective-C (RxSwift)
* Python (Django/Flask/Tornado)
* Elixir/Erlang (Phoenix)
* Golang
* Javascript (Vue/Angular)
* PHP (Laravel)
* CommonLisp (Learning)
* Rust (Will Learn)

---

## Rules for learning a language

* Must solve a problem
* Problem not addressed by current stack
* “Fast” is not a purpose
* Should be the best solution

---
layout: center
class: text-center
---

<img src="https://img.bmpi.dev/6b140fbf-3969-3c0b-da66-ed8c7d6cb0e7.png" width="600"/>

---
layout: center
class: text-center
---

<img src="https://img.bmpi.dev/08ec6121-52cf-5787-b341-cc8a609704eb.png" width="600"/>

---

## Type System

![](https://img.bmpi.dev/6d89e5c3-9b7c-3527-8caa-c9158cb803dc.png)

---
layout: center
class: text-center
---

## Evolution of Programming Languages

<img src="https://img.bmpi.dev/f70c3464-fad4-39a2-2608-96972f5e836e.png" width="350"/>

---

## Classify

<img src="https://img.bmpi.dev/887e7de2-a6fa-66d8-8eab-809ff012738f.png" width="600"/>

---

## Evaluate programming languages

![](https://img.bmpi.dev/7addfc60-98ba-1dcd-562a-097381bea8ff.png)

---

![](https://img.bmpi.dev/d3361db6-0cd8-9239-a02e-27ca880be57f.png)

---
layout: center
class: text-center
---

<img src="https://img.bmpi.dev/7083e9da-dd79-5a17-8c96-85bcfea0efd0.png" width="500"/>

---

### What’s the big deal with Elixir? 

* Ruby-like focus on developer productivity
* Embedded database
* Compiles down to code to run on the BEAM Virtual Machine
* BEAM/OTP is what Erlang runs on
* Erlang/BEAM is the best existing language for concurrency, consistency and fault tolerance, hot code swapping
* Erlang does not focus on developer productivity
* Problem in Ruby is concurrency model

---
layout: center
class: text-center
---

> So what does that mean? 

---
layout: two-cols
---

## Standard Web App

<img src="https://img.bmpi.dev/76e82bd2-2905-1f1d-9e84-9f41f6977c62.png">

::right::

## OTP

<img src="https://img.bmpi.dev/69b6963f-8d49-4520-8410-f1bdbc3697de.png">

---

## What’s the big deal?

* Facebook paid $22 billion for WhatsApp
* WhatsApp had $10 million in revenue
* What was the big deal?
  * Erlang/OTP
  * 2 million users / server
  * No central relay point
  * Scales horizontally
  * Deploys w/o disconnect

---

## Other languages  

* Boot up
* Memory is shared
  * Where leaks come from
  * Changing shared memory requires a mutex lock
* Garbage collector periodically runs
  * Pause entire stack
* Requests run in threads in the same process 
  * Threads are cooperatively scheduled
  * Deployment means shutting down current code, starting new code

---

## Erlang/Elixir/OTP

* No memory is shared
* Data structures are immutable 
* Each Erlang process (basically a light thread) has its own HEAP 
  * Reclaimed on completion
* Code can be hot deployed
  * New code runs next time it’s accessed (existing code keeps running) 
* Processes are prescheduled 

---

## Sound familiar? 

* Difference is size of the allocations 
  * An Erlang process is 0.5 kb
  * A Go goroutine is 2 kb (version 1.4)
  * A Java thread is 1024 kb on 64 bit VM 
  * PHP request varies by how much is loaded
  * Laravel averages 7-12mb / request

---

<img src="https://img.bmpi.dev/c74980b8-0a2d-9ad6-dfdb-7db7c055a6f9.png" width="500">

Programming Elixir, Chapter 15 
Laptop w/ 4 cores and 4gb of RAM counting concurrently 1,000,000 processes = 
* 0.48 gb in Elixir 
* 1.91 gb in Golang (go routines)
* 977 gb in Java (threads) 
* 6,836 gb in PHP (Laravel requests) 

---

## Immutable Data

* There’s no passing pointers 
* Add something to a list, get a new list 
* Everything is “message passing”
  * Avoids mutex locks
  * Enables per-process garbage collection 
  * Makes calling a function locally, in another process or on another machine transparent

---

## 3 Databases Built In

* ETS – Erlang Term Storage 
  * In memory table storage for a node
* DETS – Disk-based Erlang Term Storage 
  * Disk table storage for a node 

---

## 3 Databases Built In

* Mnesia - #awesome
  * A relational/object hybrid data model that is suitable for telecommunications applications. 	
  * A DBMS query language, Query List Comprehension (QLC) as an add-on library. 	
  * Persistence. Tables can be coherently kept on disc and in the main memory. 	
  * Replication. Tables can be replicated at several nodes. 	
  * Atomic transactions. A series of table manipulation operations can be grouped into a single atomic transaction. 	
  * Location transparency. Programs can be written without knowledge of the actual data location. 	
  * Extremely fast real-time data searches. 	
  * Schema manipulation routines. The DBMS can be reconfigured at runtime without stopping the system. 

---

## Loops?

How do you have a for loop with an immutable increment? 

<v-click>
 
Recursion. Lots of recursion.

</v-click>

---
layout: center
class: text-center
---

> “If Java is the right one to run anywhere, then Erlang is the right one to run forever.”
> 
> \- Joe Armstrong

---
layout: center
class: text-center
---

<img src="https://img.bmpi.dev/da934577-7910-0179-fe59-edbc27ccdabe.png" width="500">

---
layout: center
class: text-center
---

<img src="https://img.bmpi.dev/db092543-404b-56f9-7046-20b0ad238136.png" width="500">

---
layout: center
class: text-center
---

<img src="https://img.bmpi.dev/80f97e50-8220-3e56-3525-87d02f8c15a9.png" width="500">

---
layout: center
class: text-center
---

<img src="https://img.bmpi.dev/fbf43a0f-725d-3e7f-ad38-62626693e749.png" width="500">

---

## Let it crash

![](https://img.bmpi.dev/baf6e708-112b-3ce4-a5a8-64280e286ed9.png)

---

## Let it crash

<img src="https://img.bmpi.dev/c0253d3b-d7a9-ae9f-4381-81420a7210a8.png" width="500">

---
layout: center
class: text-center
---

<img src="https://img.bmpi.dev/81e003b2-6e2d-a63d-efc6-f189e82def18.png" width="300">

---
layout: center
class: text-center
---

![](https://img.bmpi.dev/7b7993c7-1f7e-1539-bfbe-86dede164c74.png)

---
layout: center
class: text-center
---

<img src="https://img.bmpi.dev/8241bfbd-cfa4-7834-fa1e-8b161ee4cff0.png" width="300">

---
layout: center
class: text-center
---

![](https://img.bmpi.dev/c2e7dd96-7a3b-c3cb-f708-a7475010b821.png)

---

## Pattern Matching Functions

```elixir
defmodule Factorial do
    def of(0), do: 1
    def of(n), do: n * of(n-1)
end
defmodule PrintStuff do
  def print({:error, stuff}) do
    IO.puts “ERROR! #{stuff}”
  end
  def print({:ok, stuff}), do: IO.puts stuff
end
PrintStuff.print({:ok, stuff})
```

---

## Parallel Map

```elixir
defmodule Paraller do
  def pmap(collection, fun) do
    me = self
    collection
    |> Enum.map(fn (elem) ->
        spawn_link fn -> (send me, { self, fun.(elem) }) end
       end)
    |> Enum.map(fn (pid) ->
         receive do { ^pid, result } -> result end
       end)
  end
end
```

---

## OTP

![](https://img.bmpi.dev/95688637-6ce7-e2f0-2f5a-94a6854fd89c.png)

---

```elixir
defmodule Stack do
  use GenServer

  def init(stack) do
    {:ok, stack}
  end

  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

  def handle_cast({:push, item}, state) do
    {:noreply, [item | state]}
  end
end

{:ok, pid} = GenServer.start_link(Stack, [:hello])

GenServer.call(pid, :pop)            #=> :hello
GenServer.cast(pid, {:push, :world}) #=> :ok
GenServer.call(pid, :pop)            #=> :world
```

---
layout: center
class: text-center
---

![](https://img.bmpi.dev/9eb242db-c860-369f-6615-505a615c20f2.png)

---

## Phoenix Framework

![](https://img.bmpi.dev/c5a8569f-42b1-63de-15a5-25d77f29a050.png)

---
layout: center
class: text-center
---

> Phoenix LiveView
>
> real-time user experiences with server-rendered HTML
> 
> No JavaScript!

---
layout: center
class: text-center
---

<img src="https://img.bmpi.dev/92f9dc01-8ca6-d73f-9580-b53ae82ce7ad.png" width="600">

---

## Erlang is Full Stack

![](https://img.bmpi.dev/04d7ad4d-ace5-ddc9-5211-0572c5b614e6.png)

---
layout: center
class: text-center
---

# Q&A

---
layout: center
class: text-center
---

# THANKS!
