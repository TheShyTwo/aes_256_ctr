library ieee;
use ieee.std_logic_1164.all;
use work.para.word;
use work.para.byte;

entity mulword is
    port (
        word_in : in word;
        row_ax : in byte;
        byte_out : out byte
    );
end entity mulword;

architecture behavioral of mulword is

    signal word_temp : word;
    component mul is
        port (
            byte_in : in byte;
            sel : in std_logic_vector(1 downto 0);
            byte_out : out byte
        );
    end component mul;
begin
    byte_0 : mul port map (word_in(31 downto 24), row_ax(7 downto 6), word_temp(31 downto 24));
    byte_1 : mul port map (word_in(23 downto 16), row_ax(5 downto 4), word_temp(23 downto 16));
    byte_2 : mul port map (word_in(15 downto 8), row_ax(3 downto 2), word_temp(15 downto 8));
    byte_3 : mul port map (word_in(7 downto 0), row_ax(1 downto 0), word_temp(7 downto 0));

    byte_out <= word_temp(31 downto 24) xor word_temp(23 downto 16) xor word_temp(15 downto 8) xor word_temp(7 downto 0);

end architecture behavioral;