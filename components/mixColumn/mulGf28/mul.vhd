library ieee;
use ieee.std_logic_1164.all;
use work.para.byte;

entity mul is
    port (
        byte_in : in byte;
        sel : in std_logic_vector(1 downto 0);
        byte_out : out byte
    );
end entity mul;

architecture behavioral of mul is

    signal byte_02, byte_03 : byte;
    component mul_02 is
        port (
            byte_in : in byte;
            byte_out : out byte
        );
    end component mul_02;

    component mul_03 is
        port (
            byte_in : in byte;
            byte_out : out byte
        );
    end component mul_03;
begin
    step_mul_02 : mul_02 port map (byte_in, byte_02);
    step_mul_03 : mul_03 port map (byte_in, byte_03);

    process (byte_in, sel, byte_02, byte_03) is
    begin
        case sel is
            when "01" => byte_out <= byte_in;
            when "10" => byte_out <= byte_02;
            when "11" => byte_out <= byte_03;
            when others => byte_out <= (others => 'X');
        end case;
    end process;

end architecture behavioral;