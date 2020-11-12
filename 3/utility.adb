-- Import Packages
with Ada.Text_IO; use Ada.Text_IO;

-- Utility package for Linear 
-- Regression solution system
package body Utility is

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
        Sum_YiXi : out Float)
    is
        -- IO System
        package F is new Float_IO(Float);
        Data_File : File_Type;

        -- Constant 0 and 1 Definition
        Zero : constant Float := 0.0;
        One : constant Float := 1.0;

        -- X and Y value from current line
        X : Float;
        Y : Float;
    begin
        -- Initialize summations
        N := Zero;
        Sum_Xi := Zero;
        Sum_Xi2 := Zero;
        Sum_Yi := Zero;
        Sum_YiXi := Zero;

        -- Open file
        Open (File => Data_File,
            Mode => In_File,
            Name => File_Name);

        -- Read lines
        while not End_Of_File(Data_File) loop
            -- Read floats
            F.Get(Data_File, X);
            F.Get(Data_File, Y);
            Skip_Line(Data_File);

            -- Update Summations
            N := N + One;
            Sum_Xi := Sum_Xi + X;
            Sum_Xi2 := Sum_Xi2 + X*X;
            Sum_Yi := Sum_Yi + Y;
            Sum_YiXi := Sum_YiXi + Y*X;
        end loop;

        -- Close file
        Close(Data_File);
    end Accum_From_File;

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
        A1 : out Float)
    is
        -- Intermediate Terms
        Det: Float;
        Sum0: Float;
        Sum1: Float;
    begin
        -- Calculate intermediate terms
        Det := N*Sum_Xi2 - Sum_Xi*Sum_Xi;
        Sum0 := Sum_Xi2*Sum_Yi - Sum_Xi*Sum_YiXi;
        Sum1 := N*Sum_YiXi - Sum_Yi*Sum_Xi;

        -- Determine A0 and A1
        A0 := Sum0 / Det;
        A1 := Sum1 / Det;
    end Determine_Coeffs;

end Utility;