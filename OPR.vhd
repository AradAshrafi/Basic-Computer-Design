----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:47:04 06/17/2018 
-- Design Name: 
-- Module Name:    OPR - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_signed.all;


entity OPR is
    Port ( input_data : in  STD_LOGIC_VECTOR (3 downto 0);
			  output_data : out  STD_LOGIC_VECTOR (3 downto 0);
           load : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           inc : in  STD_LOGIC);
end OPR;

architecture Behavioral of OPR is

signal t :std_logic_vector(3 downto 0) := (others => '0');

begin

process(clk)
begin
	if(rising_edge(clk))then
		if(Reset = '1')then
			t <= "0000";
		else
			if(inc = '1')then
				t <= t + 1;
			else
				if(load = '1')then
					t <= input_data;
				end if;
			end if;
		end if;
	end if;
end process;
	output_data <= t;
end Behavioral;
