1| This MATLAB code implements the Jacobi iterative method to solve 1D Laplace equation using the finite difference method, with a convergence tolerance of $10^{-7}$.
2| 
3| ## Problem Definition
4| 
5| The problem is defined as:
6| 
7| ```math
8| \frac{d^2y}{dx^2}=0,\qquad 0\leq x\leq1
9| ```
10| 
11| **Subject to the boundary conditions:**
12| 
13| ```math
14| y(0)=0,\qquad y(1)=1
15| ```
16| 
17| ## How to Use
18| 
19| 1. Open MATLAB and navigate to this repository folder
20| 2. Run the main script in MATLAB console
21| 3. The code will compute the numerical solution and display results
22| 
23| ## Parameters
24| 
25| - **Grid Points**: Currently set to 5 (can be changed to any number for finer/coarser discretization)
26| - **Convergence Tolerance**: $10^{-7}$ (accuracy of the iterative solver)
27| - **Maximum Iterations**: Can be adjusted based on your needs
28| 
29| ## How It Works
30| 
31| - Uses **finite difference method** to discretize the differential equation
32| - Applies **Jacobi iterative method** to solve the resulting linear system
33| - Continues iterating until convergence or maximum iterations reached
34| - Returns the solution at all grid points
35| 
36| ## Output
37| 
38| The code produces:
39| - Numerical solution values at each grid point
40| - Convergence plots showing iteration progress
41| 
42| ## Visualization
43| 
43| The script generates a plot of the numerical solution:
44| 
45| - **X-axis**: Spatial domain from 0 to 1
46| - **Y-axis**: Solution values
47| - **Output**: A linear solution connecting the boundary conditions y(0) = 0 to y(1) = 1
48| 
49| **Expected Result**: For the Laplace equation with these boundary conditions, the solution should appear as a straight line, demonstrating that the Jacobi iterative method converges to the analytical solution y = x.
50| 
51| **Note**: You can modify `n_points` to observe how grid refinement affects the solution representation. Finer grids (larger `n_points`) will show smoother interpolation between computed points.
52| 
53| ## Main Script
54| 
54| See the implementation: [Descritization_1D_diffusion_equation.m](https://github.com/UmmeSalmaTasnim/Descritization-1D-Diffussion-Equation/blob/main/Descritization_1D_diffusion_equation.m)
