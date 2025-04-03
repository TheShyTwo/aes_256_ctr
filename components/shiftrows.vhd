library ieee;
use ieee.std_logic_1164.all;
use work.para.block_128;

entity shiftrows is
    port (
        block_in : in block_128;
        block_out : out block_128
    );
end entity shiftrows;

architecture behavioral of shiftrows is
begin
    -- Row 0 : No shift
    block_out(127 downto 120) <= block_in(127 downto 120);
    block_out(95 downto 88)   <= block_in(95 downto 88);
    block_out(63 downto 56)   <= block_in(63 downto 56);
    block_out(31 downto 24)   <= block_in(31 downto 24);

    -- Row 1: Left circular shift by 1 byte
    block_out(119 downto 112) <= block_in(87 downto 80);
    block_out(87 downto 80)   <= block_in(55 downto 48);
    block_out(55 downto 48)   <= block_in(23 downto 16);
    block_out(23 downto 16)   <= block_in(119 downto 112);

    -- Row 2: Left circular shift by 2 byte
    block_out(111 downto 104) <= block_in(47 downto 40);
    block_out(79 downto 72)   <= block_in(15 downto 8); 
    block_out(47 downto 40)   <= block_in(111 downto 104);
    block_out(15 downto 8)    <= block_in(79 downto 72);

    -- Row 3: Left circular shift by 3 byte
    block_out(103 downto 96)  <= block_in(7 downto 0);
    block_out(71 downto 64)   <= block_in(103 downto 96);
    block_out(39 downto 32)   <= block_in(71 downto 64);
    block_out(7 downto 0)     <= block_in(39 downto 32);
end architecture behavioral;