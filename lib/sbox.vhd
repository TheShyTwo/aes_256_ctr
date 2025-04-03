library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.para.SBOX_ARR;
use work.para.byte;

entity sbox is
    port (
        data_in  : in  byte;
        data_out : out byte
    );
end entity sbox;

architecture behavioral of sbox is
begin
    data_out <= SBOX_ARR(to_integer(unsigned(data_in)));
end architecture behavioral;