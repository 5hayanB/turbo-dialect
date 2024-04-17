package simd
import chisel3._
import chisel3.util._

class SIMD(width: Int, numElements: Int) extends Module {
  val io = IO(new Bundle {
    val input = Input(Vec(numElements, UInt(width.W)))
    val output = Output(Vec(numElements, UInt(width.W)))
    val instruction = Input(UInt(width.W))
  })

  val registers = Reg(Vec(numElements, UInt(width.W)))

  for (i <- 0 until numElements) {
    when(io.instruction === 0.U) {
      registers(i) := io.input(i)
    }.otherwise {
      registers(i) := registers(i) + io.input(i)
    }
  }

  io.output := registers
}
