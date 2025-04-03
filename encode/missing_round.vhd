library ieee;
use ieee.std_logic_1164.all;
use work.para.block_128;

entity missing_round is
    port (
        block_in : in block_128;
        keyround : in block_128;
        block_out : out block_128
    );
end entity missing_round;

architecture behavioral of missing_round is
    signal block_sub : block_128;
    signal block_shift : block_128;

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
begin
    step_subbyte : subbyte port map (block_in, block_sub);
    step_shiftrows : shiftrows port map (block_sub, block_shift);
    block_out <= block_shift xor keyround;  -- step addRoundKey;
end architecture behavioral;