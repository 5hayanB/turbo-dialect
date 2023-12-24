package systolic_architecture
import chisel3._
import chisel3.util._

class SystolicArrayArch(rows: Int, cols: Int, pe: => PE) extends Module {
  val io = IO(new Bundle {
    val input = Input(Vec(rows, Vec(cols, UInt(32.W))))
    val output = Output(Vec(rows, Vec(cols, UInt(32.W))))
  })

  // Create PEs and initialize them
  val pes = Seq.tabulate(rows, cols)((i, j) => {
    val peModule = Module(pe)
    peModule.io.in := 0.U
    peModule.io.up := 0.U
    peModule.io.down := 0.U
    peModule.io.left := 0.U
    peModule.io.right := 0.U
    peModule
  })

  // Counter for cycle information
  val counter = Counter(100000)

  // Connect the PEs in a systolic array fashion
  for (i <- 0 until rows) {
    for (j <- 0 until cols) {
      pes(i)(j).io.in := io.input(i)(j)

      val upValue = if (i > 0) pes(i - 1)(j).io.out else 0.U
      val leftValue = if (j > 0) pes(i)(j - 1).io.out else 0.U

      pes(i)(j).io.up := upValue
      pes(i)(j).io.left := leftValue

      printf(
        p"PE($i)($j) - In: ${io.input(i)(j)}, Up: $upValue, Left: $leftValue, Out: ${pes(i)(j).io.out}\n"
      )

      io.output(i)(j) := pes(i)(j).io.out
    }
  }

  // Print debug information
  printf(p"Cycle: ${counter.value}, Inputs: ")
  io.input.foreach(row => {
    row.foreach(elem => printf(s"${elem}, "))
    printf("\n")
  })
  printf("Outputs: ")
  io.output.foreach(row => {
    row.foreach(elem => printf(s"${elem}, "))
    printf("\n")
  })
  printf("PE Inputs: ")
  pes.foreach(row => {
    row.foreach(pe => printf(s"${pe.io.in}, "))
    printf("\n")
  })
  printf("PE Outputs: ")
  pes.foreach(row => {
    row.foreach(pe => printf(s"${pe.io.out}, "))
    printf("\n")
  })
}



class PE extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(32.W))
    val up = Input(UInt(32.W))
    val down = Input(UInt(32.W))
    val left = Input(UInt(32.W))
    val right = Input(UInt(32.W))
    val out = Output(UInt(32.W))
  })

  io.out := io.in + io.up + io.down + io.left + io.right
}

