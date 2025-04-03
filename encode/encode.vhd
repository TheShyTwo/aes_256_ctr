library ieee;
use ieee.std_logic_1164.all;
use work.para.roundKeys;
use work.para.block_128;

entity encode is
    port (
        data_in : in block_128;
        key : in std_logic_vector(255 downto 0);
        data_out : out block_128
    );
end entity encode;

architecture behavioral of encode is
    type arr_blocks is array (0 to 13) of block_128;

    signal blocks : arr_blocks;
    signal keyrounds : roundKeys;

    component key_expansion is
        port (
            key_in : in std_logic_vector(255 downto 0);
            key_out : out roundKeys
        );
    end component key_expansion;

    component round is
        port (
            block_in : in block_128;
            keyround : in block_128;
            block_out : out block_128
        );
    end component round;

    component missing_round is
        port (
            block_in : in block_128;
            keyround : in block_128;
            block_out : out block_128
        );
    end component missing_round;
begin
    step_key_expansion : key_expansion port map (key, keyrounds);

    blocks(0) <= data_in xor keyrounds(0); -- Round 0
    
    Round_1to13 : for i in 1 to 13 generate
        Round_i : round port map (blocks(i-1), keyrounds(i), blocks(i));
    end generate Round_1to13;

    Round_14 : missing_round port map (blocks(13), keyrounds(14), data_out);
end architecture behavioral;