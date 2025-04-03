library ieee;
use ieee.std_logic_1164.all;
use work.para.block_128;

entity round is
    port (
        block_in : in block_128;
        keyround : in block_128;
        block_out : out block_128
    );
end entity round;

architecture behavioral of round is
    signal block_sub : block_128;
    signal block_shift : block_128;
    signal block_mix : block_128;

    component subbyte is
        port (
            block_in : in block_128;
            block_out : out block_128
        );
    end component subbyte;
    
    component shiftrows is
        port (
            block_in : in block_128;
            block_out : out block_128
        );
    end component shiftrows;

    component mixcolumns is
        port (
            block_in : in block_128;
            block_out : out block_128
        );
    end component mixcolumns;
begin
    step_subbyte : subbyte port map (block_in, block_sub);
    step_shiftrows : shiftrows port map (block_sub, block_shift);
    step_mixcolumns : mixcolumns port map (block_shift, block_mix);
    block_out <= block_mix xor keyround;  -- step AddRoundKey
end architecture behavioral;