## What does the script do?

This script helps you to have a constante duration for all your frames by duplicating longer one and, if wanted, expand sorte ones.
### Example:
Initial frames at: 
- a:125, b:200, c:25

Case where all frames are wanted at 50 **exactly**:
- a:50, a:50, a:50, b:50, b:50, b:50, b:50, c:50
  
Case where all frames are wanted at 50 **maximum**:
- a:50, a:50, a:25, b:50, b:50, b:50, b:50, c:25  

## How to use

The Script window will ask you the desired duration
You will also see another option, it will allow or not to have smaller duration.
For instance, with a desired duration of 50ms, if you have a frame at 25ms, it will keep it to 25ms if unchecked, or turn it to 50ms if checked
