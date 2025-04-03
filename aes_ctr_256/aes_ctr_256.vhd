library ieee;
use ieee.std_logic_1164.all;
use work.para.block_128;

entity aes_ctr_256 is
    port (
        data_in : in block_128;
        key : in std_logic_vector(255 downto 0);
        nonce : in std_logic_vector(63 downto 0);
        counter : in std_logic_vector(63 downto 0);
        data_out : out block_128
    );
end entity aes_ctr_256;

architecture rtl of aes_ctr_256 is
    signal input, output : block_128;
    component encode is
        port (
            data_in : in block_128;
            key : in std_logic_vector(255 downto 0);
            data_out : out block_128
        );
    end component encode;
begin
    input <= nonce & counter;

    step_encode : encode port map (input, key, output);

    data_out <= data_in xor output;
end architecture rtl;