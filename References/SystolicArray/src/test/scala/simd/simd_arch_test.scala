package simd
import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec

class SIMDTest extends FreeSpec with ChiselScalatestTester {
    "SIMD" in {
        test(new SIMD(width = 10, numElements = 4)) { c =>
            c.io.instruction.poke(1.U)

            
            c.io.input(0).poke(3.U)
            c.io.input(1).poke(4.U)
            c.io.input(2).poke(1.U)
            c.io.input(3).poke(10.U)

            
            c.clock.step(2)

            
            println("Output values after one 2 cycles:")
            println("Output 0: " + c.io.output(0).peek().litValue())
            println("Output 1: " + c.io.output(1).peek().litValue())
            println("Output 2: " + c.io.output(2).peek().litValue())
            println("Output 3: " + c.io.output(3).peek().litValue())

            c.io.instruction.poke(0.U)

            c.clock.step(3)

            
            println("Output values after setting instruction to 0:")
            println("Output 0: " + c.io.output(0).peek().litValue())
            println("Output 1: " + c.io.output(1).peek().litValue())
            println("Output 2: " + c.io.output(2).peek().litValue())
            println("Output 3: " + c.io.output(3).peek().litValue())
        }
    }
}
