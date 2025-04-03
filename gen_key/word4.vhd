library ieee;
use ieee.std_logic_1164.all;
use work.para.word;

entity word4 is
    port (
        word_i_1 : in word;
        word_i_8 : in word;
        word_i : out word
    );
end entity word4;

architecture behavioral of word4 is
    signal res_sub : word;

    component subword is
        port (
            data_in : in word;
            data_out : out word
        );
    end component subword;
begin
    step_subword : subword port map (word_i_1, res_sub);

    word_i <= word_i_8 xor res_sub;
end architecture behavioral;