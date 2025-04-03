library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.para.blocks_32;
use work.para.word;
use work.para.roundKeys;
use work.para.Rcon;

entity key_expansion is
    port (
        key_in : in std_logic_vector(255 downto 0);
        key_out : out roundKeys
    );
end entity key_expansion;

architecture rtl of key_expansion is

    signal words : blocks_32;

    component word4 is
        port (
            word_i_1 : in word;
            word_i_8 : in word;
            word_i : out word
        );
    end component word4;

    component word8 is
        port (
            word_i_1 : in word;
            word_i_8 : in word;
            rcon_i : in word;
            word_i : out word
        );
    end component word8;
begin
    words(0) <= key_in(255 downto 224);
    words(1) <= key_in(223 downto 192);
    words(2) <= key_in(191 downto 160);
    words(3) <= key_in(159 downto 128);
    words(4) <= key_in(127 downto 96);
    words(5) <= key_in(95 downto 64);
    words(6) <= key_in(63 downto 32);
    words(7) <= key_in(31 downto 0);

    loop_8to59 : for i in 8 to 59 generate
        mod_8_0 : if (i mod 8 = 0) generate
            step_word_8 : word8 port map (words(i-1), words(i-8), Rcon(i/8), words(i));
        end generate mod_8_0;

        mod_8_4 : if (i mod 8 = 4) generate
            step_word_4 : word4 port map (words(i-1), words(i-8), words(i));
        end generate mod_8_4;

        mod_others : if (i mod 8 /= 0 and i mod 8 /= 4) generate
            words(i) <= words(i-8) xor words(i-1);
        end generate mod_others;
    end generate loop_8to59;

    loop_0to15 : for i in 0 to 14 generate
        key_out(i)(127 downto 96) <= words(4*i);
        key_out(i)(95 downto 64) <= words(4*i+1);
        key_out(i)(63 downto 32) <= words(4*i+2);
        key_out(i)(31 downto 0) <= words(4*i+3);
    end generate loop_0to15;

end architecture rtl;