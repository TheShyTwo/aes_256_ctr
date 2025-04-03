library ieee;
use ieee.std_logic_1164.all;
use work.para.word;
use work.para.byte;

entity subword is
    port (
        data_in : in word;
        data_out : out word
    );
end entity subword;

architecture behavioral of subword is
    component sbox is
        port (
            data_in  : in  byte;
            data_out : out byte
        );
    end component sbox;
begin
    byte_0 : sbox port map (data_in(7 downto 0), data_out(7 downto 0));
    byte_1 : sbox port map (data_in(15 downto 8), data_out(15 downto 8));
    byte_2 : sbox port map (data_in(23 downto 16), data_out(23 downto 16));
    byte_3 : sbox port map (data_in(31 downto 24), data_out(31 downto 24));
end architecture behavioral;

