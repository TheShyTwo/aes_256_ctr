library ieee;
use ieee.std_logic_1164.all;
use work.para.word;
use work.para.byte;
use work.para.Matrix_ax;

entity mixword is
    port (
        word_in : in word;
        word_out : out word
    );
end entity mixword;

architecture behavioral of mixword is
    component mulword is
        port (
            word_in : in word;
            row_ax : in byte;
            byte_out : out byte
        );
    end component mulword;
begin
    byte_0 : mulword port map (word_in, Matrix_ax(0), word_out(31 downto 24));
    byte_1 : mulword port map (word_in, Matrix_ax(1), word_out(23 downto 16));
    byte_2 : mulword port map (word_in, Matrix_ax(2), word_out(15 downto 8));
    byte_3 : mulword port map (word_in, Matrix_ax(3), word_out(7 downto 0));
end architecture behavioral;