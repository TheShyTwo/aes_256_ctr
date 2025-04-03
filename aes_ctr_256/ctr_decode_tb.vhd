library ieee;
use ieee.std_logic_1164.all;
use work.para.block_128;

entity ctr_decode_tb is
end entity ctr_decode_tb;

architecture behavioral of ctr_decode_tb is
    signal cipher_data : block_128;
    signal key : std_logic_vector(255 downto 0);
    signal nonce : std_logic_vector(63 downto 0);
    signal counter : std_logic_vector(63 downto 0);
    signal plain_data : block_128;

    component aes_ctr_256 is
        port (
            data_in : in block_128;
            key : in std_logic_vector(255 downto 0);
            nonce : in std_logic_vector(63 downto 0);
            counter : in std_logic_vector(63 downto 0);
            data_out : out block_128
        );
    end component aes_ctr_256;
begin
    dut : aes_ctr_256 port map (cipher_data, key, nonce, counter, plain_data);

    sim : process is
    begin
        wait for 10 ns;
        cipher_data <= x"4F5D5AF3379D5EBCE5E5B224197B77EF";
        key <= x"000102030405060708090A0B0C0D0E0F101112131415161718191A1B1C1D1E1F";
        nonce <= x"AC6D596B71722F49";
        counter <= x"0000000000000001";
        wait;
    end process sim;
end architecture behavioral;