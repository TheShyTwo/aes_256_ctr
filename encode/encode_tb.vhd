library ieee;
use ieee.std_logic_1164.all;
use work.para.block_128;

entity encode_tb is
end entity encode_tb;

architecture behavioral of encode_tb is
    signal data_in : block_128;
    signal key : std_logic_vector(255 downto 0);
    signal data_out : block_128;
    
    component encode is
        port (
            data_in : in block_128;
            key : in std_logic_vector(255 downto 0);
            data_out : out block_128
        );
    end component encode;
begin
    dut : encode port map (data_in, key, data_out);

    sim : process is
    begin
        wait for 10 ns;
        data_in <= x"000102030405060708090A0B0C0D0E0F";
        key <= x"000102030405060708090A0B0C0D0E0F101112131415161718191A1B1C1D1E1F";
        wait;
    end process sim;
end architecture behavioral;