FIRRTL version 1.1.0
circuit SIMD :
  module SIMD :
    input clock : Clock
    input reset : UInt<1>
    input io_input_0 : UInt<8>
    input io_input_1 : UInt<8>
    input io_input_2 : UInt<8>
    input io_input_3 : UInt<8>
    output io_output_0 : UInt<8>
    output io_output_1 : UInt<8>
    output io_output_2 : UInt<8>
    output io_output_3 : UInt<8>
    input io_instruction : UInt<8>

    reg registers_0 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), registers_0) @[simd_arch.scala 12:22]
    reg registers_1 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), registers_1) @[simd_arch.scala 12:22]
    reg registers_2 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), registers_2) @[simd_arch.scala 12:22]
    reg registers_3 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), registers_3) @[simd_arch.scala 12:22]
    node _T = eq(io_instruction, UInt<1>("h0")) @[simd_arch.scala 15:25]
    node _registers_0_T = add(registers_0, io_input_0) @[simd_arch.scala 18:36]
    node _registers_0_T_1 = tail(_registers_0_T, 1) @[simd_arch.scala 18:36]
    node _GEN_0 = mux(_T, io_input_0, _registers_0_T_1) @[simd_arch.scala 15:34 16:20 18:20]
    node _T_1 = eq(io_instruction, UInt<1>("h0")) @[simd_arch.scala 15:25]
    node _registers_1_T = add(registers_1, io_input_1) @[simd_arch.scala 18:36]
    node _registers_1_T_1 = tail(_registers_1_T, 1) @[simd_arch.scala 18:36]
    node _GEN_1 = mux(_T_1, io_input_1, _registers_1_T_1) @[simd_arch.scala 15:34 16:20 18:20]
    node _T_2 = eq(io_instruction, UInt<1>("h0")) @[simd_arch.scala 15:25]
    node _registers_2_T = add(registers_2, io_input_2) @[simd_arch.scala 18:36]
    node _registers_2_T_1 = tail(_registers_2_T, 1) @[simd_arch.scala 18:36]
    node _GEN_2 = mux(_T_2, io_input_2, _registers_2_T_1) @[simd_arch.scala 15:34 16:20 18:20]
    node _T_3 = eq(io_instruction, UInt<1>("h0")) @[simd_arch.scala 15:25]
    node _registers_3_T = add(registers_3, io_input_3) @[simd_arch.scala 18:36]
    node _registers_3_T_1 = tail(_registers_3_T, 1) @[simd_arch.scala 18:36]
    node _GEN_3 = mux(_T_3, io_input_3, _registers_3_T_1) @[simd_arch.scala 15:34 16:20 18:20]
    io_output_0 <= registers_0 @[simd_arch.scala 22:13]
    io_output_1 <= registers_1 @[simd_arch.scala 22:13]
    io_output_2 <= registers_2 @[simd_arch.scala 22:13]
    io_output_3 <= registers_3 @[simd_arch.scala 22:13]
    registers_0 <= _GEN_0
    registers_1 <= _GEN_1
    registers_2 <= _GEN_2
    registers_3 <= _GEN_3
