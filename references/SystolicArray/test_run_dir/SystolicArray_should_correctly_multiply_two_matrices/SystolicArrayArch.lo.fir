FIRRTL version 1.1.0
circuit SystolicArrayArch :
  module PE :
    input clock : Clock
    input reset : UInt<1>
    input io_up : UInt<32>
    input io_down : UInt<32>
    input io_left : UInt<32>
    input io_right : UInt<32>
    input io_in : UInt<32>
    output io_out : UInt<32>

    node _io_out_T = mul(io_in, io_up) @[SystolicArch.scala 52:19]
    node _io_out_T_1 = mul(io_down, io_left) @[SystolicArch.scala 52:37]
    node _io_out_T_2 = add(_io_out_T, _io_out_T_1) @[SystolicArch.scala 52:27]
    node _io_out_T_3 = tail(_io_out_T_2, 1) @[SystolicArch.scala 52:27]
    node _io_out_T_4 = add(_io_out_T_3, io_right) @[SystolicArch.scala 52:47]
    node _io_out_T_5 = tail(_io_out_T_4, 1) @[SystolicArch.scala 52:47]
    io_out <= bits(_io_out_T_5, 31, 0) @[SystolicArch.scala 52:10]

  module SystolicArrayArch :
    input clock : Clock
    input reset : UInt<1>
    input io_input_0_0 : UInt<32>
    input io_input_0_1 : UInt<32>
    input io_input_1_0 : UInt<32>
    input io_input_1_1 : UInt<32>
    output io_output_0_0 : UInt<32>
    output io_output_0_1 : UInt<32>
    output io_output_1_0 : UInt<32>
    output io_output_1_1 : UInt<32>

    inst pes_0_0 of PE @[SystolicArch.scala 12:40]
    inst pes_0_1 of PE @[SystolicArch.scala 12:40]
    inst pes_1_0 of PE @[SystolicArch.scala 12:40]
    inst pes_1_1 of PE @[SystolicArch.scala 12:40]
    io_output_0_0 <= pes_0_0.io_out @[SystolicArch.scala 36:23]
    io_output_0_1 <= pes_0_1.io_out @[SystolicArch.scala 36:23]
    io_output_1_0 <= pes_1_0.io_out @[SystolicArch.scala 36:23]
    io_output_1_1 <= pes_1_1.io_out @[SystolicArch.scala 36:23]
    pes_0_0.clock <= clock
    pes_0_0.reset <= reset
    pes_0_0.io_up <= UInt<32>("h0") @[SystolicArch.scala 33:23]
    pes_0_0.io_down <= UInt<32>("h0") @[SystolicArch.scala 19:25]
    pes_0_0.io_left <= UInt<32>("h0") @[SystolicArch.scala 34:25]
    pes_0_0.io_right <= UInt<32>("h0") @[SystolicArch.scala 21:26]
    pes_0_0.io_in <= io_input_0_0 @[SystolicArch.scala 28:23]
    pes_0_1.clock <= clock
    pes_0_1.reset <= reset
    pes_0_1.io_up <= UInt<32>("h0") @[SystolicArch.scala 33:23]
    pes_0_1.io_down <= UInt<32>("h0") @[SystolicArch.scala 19:25]
    pes_0_1.io_left <= pes_0_0.io_right @[SystolicArch.scala 34:25]
    pes_0_1.io_right <= UInt<32>("h0") @[SystolicArch.scala 21:26]
    pes_0_1.io_in <= io_input_0_1 @[SystolicArch.scala 28:23]
    pes_1_0.clock <= clock
    pes_1_0.reset <= reset
    pes_1_0.io_up <= pes_0_0.io_down @[SystolicArch.scala 33:23]
    pes_1_0.io_down <= UInt<32>("h0") @[SystolicArch.scala 19:25]
    pes_1_0.io_left <= UInt<32>("h0") @[SystolicArch.scala 34:25]
    pes_1_0.io_right <= UInt<32>("h0") @[SystolicArch.scala 21:26]
    pes_1_0.io_in <= io_input_1_0 @[SystolicArch.scala 28:23]
    pes_1_1.clock <= clock
    pes_1_1.reset <= reset
    pes_1_1.io_up <= pes_0_1.io_down @[SystolicArch.scala 33:23]
    pes_1_1.io_down <= UInt<32>("h0") @[SystolicArch.scala 19:25]
    pes_1_1.io_left <= pes_1_0.io_right @[SystolicArch.scala 34:25]
    pes_1_1.io_right <= UInt<32>("h0") @[SystolicArch.scala 21:26]
    pes_1_1.io_in <= io_input_1_1 @[SystolicArch.scala 28:23]
