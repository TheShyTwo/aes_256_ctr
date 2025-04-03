library ieee;
use ieee.std_logic_1164.all;
use work.para.word;

entity word8 is
    port (
        word_i_1 : in word;
        word_i_8 : in word;
        rcon_i : in word;
        word_i : out word
    );
end entity word8;

architecture behavioral of word8 is

    signal res_rot : word;
    signal res_sub : word;

    component rotword is
        port (
            data_in : in word;
            data_out : out word
        );
    end component rotword;

    component subword is
        port (
            data_in : in word;
            data_out : out word
        );
    end component subword;
begin
    step_rotword : rotword port map (word_i_1, res_rot);
    step_subword : subword port map (res_rot, res_sub);

    word_i <= word_i_8 xor res_sub xor rcon_i;
end architecture behavioral;