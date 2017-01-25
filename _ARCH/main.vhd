library ieee ;
  use ieee.std_logic_1164.all ;
  use ieee.numeric_std.all ;

entity main is
  port (
  clock: in std_logic;
  Z,N: out std_logic
  ) ;
end entity ; -- main

architecture arch of main is
  component alu is
    port (
    control: in std_logic_vector(3 downto 0) ;
    dataOne,
    dataTwo: in std_logic_vector(31 downto 0);
    dataOut: out std_logic_vector(31 downto 0);
    Z,
    N: out std_logic
    ) ;
  end component ; -- alu
  component REG_FILE is
    port (
    clk,RegWrite: in std_logic;
    ReadRegister1,
    ReadRegister2,
    WriteRegister:  in std_logic_vector(4 downto 0);
    WriteData:    in std_logic_vector(31 downto 0);
    ReadData1,
    ReadData2:    out std_logic_vector(31 downto 0)
    ) ;
  end component ; -- REG_FILE
  component sync_ram is
    port (
      clock:    in  std_logic;
      MemWrite:   in  std_logic;
      Address:  in  std_logic_vector(31 downto 0);
      WriteData:  in  std_logic_vector(31 downto 0);
      ReadData: out std_logic_vector(31 downto 0)
    );
  end component;
  component control is
    port (
      i:  in std_logic_vector(5 downto 0);
      o:  out std_logic_vector(8 downto 0)
    ) ;
  end component ;
  component alu_control is
    port (
      i:  in std_logic_vector(1 downto 0);
      fun:  in  std_logic_vector(5 downto 0);
      o:  out std_logic_vector(3 downto 0)
    ) ;
  end component ; -- alu_control
  component full_nadder is
    generic(n: integer:= 32);
    port(
      X,Y:  in std_logic_vector(n-1 downto 0);
      Sub:  in std_logic;
      Cout: out std_logic;
      O:  out std_logic_vector(n-1 downto 0)
    );
  end component; -- adder for PC and Branching.
  component shift_left is
    port (
      i:  in std_logic_vector(31 downto 0);
      o:  out std_logic_vector(31 downto 0)
    ) ;
  end component ; -- shift_left
  component sign_extender is
    port(
      sixteen:  in std_logic_vector(15 downto 0);
      thirtytwo:  out std_logic_vector(31 downto 0)
    );
  end component; -- sign extender for Immediate values.
  component mux IS
  port ( 
    s:  IN std_logic; 
    a,b:  IN std_logic_vector(31 downto 0); 
    f:    out std_logic_vector(31 downto 0)
    ); 
  end component; -- for multiple mulitplixers around the circuit.
  component mux_regDst IS
  port ( 
    s:  IN std_logic; 
    a,b:  IN std_logic_vector(4 downto 0); 
    f:    out std_logic_vector(4 downto 0)
    ); 
  end component; -- for multiple mulitplixers around the circuit.
  component Reg is
    port(
      clk:  in std_logic;
      D:  in std_logic_vector(31 downto 0);
      Q:  out std_logic_vector(31 downto 0)
    );
  end component; -- PC Register
  component andGate is
  port (
  clk: in std_logic;
  en: in std_logic;
  we: in std_logic;
  o: out std_logic
  ) ;
end component ; -- andGate

  signal branch_address: std_logic_vector(31 downto 0);
  signal instruction_address: std_logic_vector(31 downto 0);
  signal instruction: std_logic_vector(31 downto 0);
  signal Write_Data: std_logic_vector(31 downto 0);
  signal ReadData1: std_logic_vector(31 downto 0);
  signal ReadData2: std_logic_vector(31 downto 0);
  signal ext_immediate: std_logic_vector(31 downto 0);
  signal ALU_RESULT: std_logic_vector(31 downto 0);
  signal MemData: std_logic_vector(31 downto 0);
  signal Alu_src2: std_logic_vector(31 downto 0);

  alias op_code : std_logic_vector(5 downto 0) is instruction(31 downto 26);
  alias Read_Register_1 : std_logic_vector(4 downto 0) is  instruction(25 downto 21);
  alias Read_Register_2 : std_logic_vector(4 downto 0) is  instruction(20 downto 16);
  alias Read_Register_3 : std_logic_vector(4 downto 0) is  instruction(15 downto 11);
  alias immediate : std_logic_vector(15 downto 0) is  instruction(15 downto 0);
  alias funct : std_logic_vector(5 downto 0) is  instruction(5 downto 0);

  signal Write_Register: std_logic_vector(4 downto 0);

  signal control_signals : std_logic_vector(8 downto 0);
  alias RegDst : std_logic is control_signals(8);
  alias ALUsrc : std_logic is control_signals(7);
  alias MemtoReg : std_logic is control_signals(6);
  alias RegWrite : std_logic is control_signals(5);
  alias MemRead : std_logic is control_signals(4);
  alias MemWrite : std_logic is control_signals(3);
  alias Branch : std_logic is control_signals(2);
  alias ALUOp : std_logic_vector(1 downto 0) is control_signals(1 downto 0);

  signal alu_control_signals : std_logic_vector(3 downto 0);

  signal zflag : std_logic;
  signal branchControl : std_logic;


begin
  ProgramCounter: Reg port map (clock,branch_address,instruction_address);
  InstructionMemory: sync_ram port map ('1','0',instruction_address,(others=>'0'),instruction);

  ControlUnit: control port map (op_code,control_signals);

  MuxRegDst: mux_regDst port map (RegDst,Read_Register_2,Read_Register_3,Write_Register);

  Registers: REG_FILE port map (clock,
    RegWrite,
    Read_Register_1,Read_Register_2,
    Write_Register,
    Write_Data,
    ReadData1,ReadData2
  );
  
  signExtender: sign_extender port map (immediate,ext_immediate);
  MuxALUsrc: mux port map (ALUsrc,ReadData2,ext_immediate,Alu_src2);

  ALUConrolUnit: alu_control port map(ALUOp,funct,alu_control_signals);

  Main_ALU: alu port map(alu_control_signals,ReadData1,Alu_src2,ALU_RESULT,zflag,N);

  DataMemory: sync_ram port map(clock,MemWrite,ALU_RESULT,ReadData2,MemData);
  MuxMemtoReg: mux port map(MemtoReg,ALU_RESULT,MemData,Write_Data);

  AndBranchZero: andGate port map ('1',Branch,zflag,branchControl);

end architecture ; -- arch