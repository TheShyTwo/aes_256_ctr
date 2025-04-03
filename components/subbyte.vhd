library ieee;
use ieee.std_logic_1164.all;
use work.para.block_128;
use work.para.byte;

entity subbyte is
    port (
        block_in : in block_128;
        block_out : out block_128
    );
end entity subbyte;

architecture behavioral of subbyte is
    component sbox is
        port (
            data_in  : in  byte;
            data_out : out byte
        );
    end component sbox;
begin
    gen_loop : for i in 0 to 15 generate
        sub : sbox port map (block_in(8*i+7 downto 8*i), block_out(8*i+7 downto 8*i));
    end generate gen_loop;
end architecture behavioral;

