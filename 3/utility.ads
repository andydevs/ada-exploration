-- Utility package for Linear 
-- Regression solution system
package Utility is

    -- Read data from file.
    -- Determine summation 
    -- variables for linear
    -- regression equation
    procedure Accum_From_File (
        File_Name : in String;
        N : out Float;
        Sum_Xi : out Float;
        Sum_Xi2 : out Float;
        Sum_Yi : out Float;
        Sum_YiXi : out Float);

    -- Determine Coefficients
    -- by solving linear equation
    -- using summation variables
    procedure Determine_Coeffs (
        N : in Float;
        Sum_Xi : in Float;
        Sum_Xi2 : in Float;
        Sum_Yi : in Float;
        Sum_YiXi : in Float;
        A0 : out Float;
        A1 : out Float);
        
end Utility;