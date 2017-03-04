#Description

This project tests how much time does overwriting a prototype of plymer element takes.

#Testing Env
- **OS**: Sierra 10.12.3
- **processor** 2.2GHz(throttled to 5x slowdown in chrome)
- **memory** 16GB 1600MHz DDR3
- I've also added multiple custom elements so as to increase the size of __array in telemetry__(147 to be precise)

#Test Reults
- It takes around __11ms__
- Most of the time is taken by _find_ function