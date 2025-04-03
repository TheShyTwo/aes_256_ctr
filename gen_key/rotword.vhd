library ieee;
use ieee.std_logic_1164.all;
use work.para.word;

entity rotword is
    port (
        data_in : in word;
        data_out : out word
    );
end entity rotword;

architecture behavioral of rotword is
begin
    data_out(31 downto 24) <= data_in(23 downto 16);
    data_out(23 downto 16) <= data_in(15 downto 8);
    data_out(15 downto 8) <= data_in(7 downto 0);
    data_out(7 downto 0) <= data_in(31 downto 24);
end architecture behavioral;