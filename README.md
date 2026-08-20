This MATLAB code implements the Jacobi iterative method to solve 1D Laplace equation using the finite difference method, with a convergence tolerance of $10^{-7}$.

## Problem Definition

The problem is defined as:

```math
\frac{d^2y}{dx^2}=0,\qquad 0\leq x\leq1
```

**Subject to the boundary conditions:**

```math
y(0)=0,\qquad y(1)=1
```

## How to Use

1. Open MATLAB and navigate to this repository folder
2. Run the main script in MATLAB console
3. The code will compute the numerical solution and display results

## Parameters

- **Grid Points**: Currently set to 5 (can be changed to any number for finer/coarser discretization)
- **Convergence Tolerance**: $10^{-7}$ (accuracy of the iterative solver)
- **Maximum Iterations**: Can be adjusted based on your needs

## How It Works

- Uses **finite difference method** to discretize the differential equation
- Applies **Jacobi iterative method** to solve the resulting linear system
- Continues iterating until convergence or maximum iterations reached
- Returns the solution at all grid points

## Output

The code produces:
- Numerical solution values at each grid point
- Convergence plots showing iteration progress
