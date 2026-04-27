I'm trying to fix arm_instructionrate to fully eliminate the latency bottleneck on modern processors.

Current progress (on an Cortex-X2):

| Type           | Reported IPC | Original IPC | Theoretical IPC | Saturation % | Reason for bottlenecks |
|----------------|--------------|--------------|-----------------|--------------|------------------------|
| VAdd           | 4            | 2.5          | 4               | 100          | 5/2 = 2.5              |
| VMul           | 2            | 1.25         | 2               | 100          | 5/4 = 1.25             |
| FMLA/FADD/FMUL | 4            | 2.5          | 4               | 100          | 5/2 = 10/4 = 2.5       |
| Add/XOR        | 3.88         | 3.44         | 4               | 97           | Unknown                |
| Mix VAdd/VMul  | 2.30         | 1.67         | 4          |58          | 5/3 = 1.6; Unknown - up to 3.25 IPC at 16 instructions. Needs interleaving?             |
| Mix FADD/FMLA  | 3.57         | 2.5          | 4               | 89           | 10/4 = 2.5             |
| Mix FMUL/FMLA  | 3.78         | 2.5          | 4               | 95           | 10/4 = 2.5             |
