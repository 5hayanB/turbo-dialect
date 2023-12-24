package systolic_architecture

import chisel3._
import chisel3.util._
import chiseltest._
import org.scalatest._

class SystolicArrayArchTest extends FreeSpec with ChiselScalatestTester{

  "SystolicArrayArch" in {
    test(new SystolicArrayArch(3, 3, new PE)) { dut =>
      // Input matrix values
    val inputMatrix = Array(
      Array(1, 2, 3),
      Array(4, 5, 6),
      Array(7, 8, 9)
      )

      // Initialize the expected output matrix
      val expectedOutput = Array.ofDim[Int](3, 3)

      // Apply input to the input ports and calculate expected output
      for (i <- 0 until 3) {
        for (j <- 0 until 3) {
          // Apply input to the input ports
          dut.io.input(i)(j).poke(inputMatrix(i)(j))

          // Calculate the expected output using the PE computation
          val upValue = if (i > 0) expectedOutput(i - 1)(j) else 0
          val leftValue = if (j > 0) expectedOutput(i)(j - 1) else 0
          expectedOutput(i)(j) = inputMatrix(i)(j) + upValue + leftValue
        }
      }

      // Wait for a few clock cycles (adjust as needed)
      dut.clock.step(5)

      // Check the output of the DUT against the expected value
      for (i <- 0 until 3) {
        for (j <- 0 until 3) {
          val actualValue = dut.io.output(i)(j).peek().litValue.toInt
          val expectedValue = expectedOutput(i)(j).U.litValue.toInt
          println(s"($i, $j) - Actual: $actualValue, Expected: $expectedValue")
          dut.io.output(i)(j).expect(expectedOutput(i)(j).U)
          
        }
      }
    }
  }
}
