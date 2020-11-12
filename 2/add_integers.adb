with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Add_Integers is
	A_max: Integer := 72;
	B_max: Integer := 64;
	C: Integer;
begin	
	A_loop: for A in Integer range 0 .. A_max loop
		B_loop: for B in Integer range 0 .. B_max loop
			-- Do Operation
			C := A + B;

			-- Print Result
			Put(A);
			Put(" + ");
			Put(B);
			Put(" = ");
			Put(C);
			New_Line;
		end loop B_loop;
	end loop A_loop;
end Add_Integers;
