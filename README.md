# AutoFlow
Please note this repo is still in its early stage.

## Goal
Conditional navigation flow means going forward or backward to different flow steps based on different conditions. The usual approach is to predefine the flow steps and their dependencies. However, this isn't practical if we want to make it real-time and dynamic, meaning the condition would depend on changing inputs. As a result, we need a solution to achieve it.

## Solution
We'll try to attack the problem by leveraging the algorithm: [topological sort](https://github.com/trekhleb/javascript-algorithms/tree/master/src/algorithms/graph/topological-sorting).

![link](https://camo.githubusercontent.com/46778ce4ba450edb3149de67c2718061def8fd96/68747470733a2f2f75706c6f61642e77696b696d656469612e6f72672f77696b6970656469612f636f6d6d6f6e732f632f63362f546f706f6c6f676963616c5f4f72646572696e672e737667)

Every time we need to go forward or backward in the navigation flow, we'll check the dependency and rebuild the graph for the flow.
