library ieee;
use ieee.std_logic_1164.all;
use work.para.byte;

entity mul_02 is
    port (
        byte_in : in byte;
        byte_out : out byte
    );
end entity mul_02;

architecture behavioral of mul_02 is
    constant pol_M : byte := x"1b";
begin
    process (byte_in) is
        variable byte_shift : byte;
    begin
        byte_shift := byte_in(6 downto 0) & '0';
        if (byte_in(7) = '1') then
            byte_out <= byte_shift xor pol_M;
        elsif (byte_in(7) = '0') then
            byte_out <= byte_shift;
        else
            byte_out <= (others => 'X');
        end if;
    end process;
end architecture behavioral;