library ieee;
use ieee.std_logic_1164.all;
use work.para.byte;

entity mul_03 is
    port (
        byte_in : in byte;
        byte_out : out byte
    );
end entity mul_03;

architecture behavioral of mul_03 is
    signal byte_02 : byte;

    component mul_02 is
        port (
            byte_in : in byte;
            byte_out : out byte
        );
    end component mul_02;
begin
    step_mul_02 : mul_02 port map (byte_in, byte_02);
    byte_out <= byte_02 xor byte_in;
end architecture behavioral;