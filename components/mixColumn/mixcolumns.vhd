library ieee;
use ieee.std_logic_1164.all;
use work.para.word;
use work.para.block_128;

entity mixcolumns is
    port (
        block_in : in block_128;
        block_out : out block_128
    );
end entity mixcolumns;

architecture behavioral of mixcolumns is
    component mixword is
        port (
            word_in : in word;
            word_out : out word
        );
    end component mixword;
begin
    word_0 : mixword port map (block_in(127 downto 96), block_out(127 downto 96));
    word_1 : mixword port map (block_in(95 downto 64), block_out(95 downto 64));
    word_2 : mixword port map (block_in(63 downto 32), block_out(63 downto 32));
    word_3 : mixword port map (block_in(31 downto 0), block_out(31 downto 0));
end architecture behavioral;