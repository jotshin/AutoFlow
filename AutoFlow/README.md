#  AutoFlow

## Goal
- This is a project that tries to demo a flow that can be automatically based on their dependencies, what you need to do is:
    1. add a step to `FlowCoordinator`
    2. call `setDepedency(on:)` set its dependency to another step
    3. make the new step conform to `FlowStep` protocol
    4. call `getNext`

- This mainly solves:
    - manual dependency management
    - write custom code
    
## TODO
- consider different view states and nav
- begin and end must be known? 

## Example 
- we have A -> B -> C modules / views 
- we want to add a new step D to be dependent on B and add C to be dependent on D

1. `add(D)` -> add to array
2. `D.setDependency(on: B)` and `C.setDependency(on: D)` -> do dfs for order array
3.  `flowCoordinator.getNext()`  -> get order array given index


## Algorithm
- Topological sort

## Protocol and APIs
```
- FlowStep
    - let coordinator: FlowCoordinator 
    - func setDepedency(on step: FlowStep)

- FlowCoordinator
    - func getNext() -> FlowStep
    - func add(_ step: FlowStep)
    
    helpers:
    - func getCurrentIndex() -> Int
    - func getSteps() -> [FlowStep]
```

