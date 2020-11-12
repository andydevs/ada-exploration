-- Import Packages
with Ada.Text_IO; use Ada.Text_IO;
with Utility; use Utility;

-- Solving Linear Regression
-- using algorithm. Read input
-- data from file and determine
-- coefficients of linear 
-- equation that best fits 
-- the data from the file
procedure Linear_Regression is

    -- Float IO
    package F is new Float_IO(Float);

    -- Data File Name
    Data_File_Name : constant String := "data.txt";

    -- Sumation variables
    N : Float;
    Sum_Xi : Float;
    Sum_Xi2 : Float;
    Sum_Yi : Float;
    Sum_YiXi : Float;

    -- Resulting Terms
    A0 : Float;
    A1 : Float;

begin

    -- Create accumulation from file
    Accum_From_File(
        File_Name => Data_File_Name,
        N => N,
        Sum_Xi => Sum_Xi,
        Sum_Xi2 => Sum_Xi2,
        Sum_Yi => Sum_Yi,
        Sum_YiXi => Sum_YiXi);

    -- Determine coefficients
    Determine_Coeffs(
        N => N,
        Sum_Xi => Sum_Xi,
        Sum_Xi2 => Sum_Xi2,
        Sum_Yi => Sum_Yi,
        Sum_YiXi => Sum_YiXi,
        A0 => A0,
        A1 => A1);

    -- Print A0 and A1
    F.Put(A1);
    Put(" ");
    F.Put(A0);
    New_Line;

end Linear_Regression;