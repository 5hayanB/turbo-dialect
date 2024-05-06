module comb_mem_d1 #(
    parameter WIDTH = 32,
    parameter SIZE = 16,
    parameter IDX_SIZE = 4
) (
   input wire                logic [IDX_SIZE-1:0] addr0,
   input wire                logic [ WIDTH-1:0] write_data,
   input wire                logic write_en,
   input wire                logic clk,
   input wire                logic reset,
   output logic [ WIDTH-1:0] read_data,
   output logic              done
);

  logic [WIDTH-1:0] mem[SIZE-1:0];

  /* verilator lint_off WIDTH */
  assign read_data = mem[addr0];

  always_ff @(posedge clk) begin
    if (reset)
      done <= '0;
    else if (write_en)
      done <= '1;
    else
      done <= '0;
  end

  always_ff @(posedge clk) begin
    if (!reset && write_en)
      mem[addr0] <= write_data;
  end

  // Check for out of bounds access
  `ifdef VERILATOR
    always_comb begin
      if (addr0 >= SIZE)
        $error(
          "comb_mem_d1: Out of bounds access\n",
          "addr0: %0d\n", addr0,
          "SIZE: %0d", SIZE
        );
    end
  `endif
endmodule

module comb_mem_d2 #(
    parameter WIDTH = 32,
    parameter D0_SIZE = 16,
    parameter D1_SIZE = 16,
    parameter D0_IDX_SIZE = 4,
    parameter D1_IDX_SIZE = 4
) (
   input wire                logic [D0_IDX_SIZE-1:0] addr0,
   input wire                logic [D1_IDX_SIZE-1:0] addr1,
   input wire                logic [ WIDTH-1:0] write_data,
   input wire                logic write_en,
   input wire                logic clk,
   input wire                logic reset,
   output logic [ WIDTH-1:0] read_data,
   output logic              done
);

  /* verilator lint_off WIDTH */
  logic [WIDTH-1:0] mem[D0_SIZE-1:0][D1_SIZE-1:0];

  assign read_data = mem[addr0][addr1];

  always_ff @(posedge clk) begin
    if (reset)
      done <= '0;
    else if (write_en)
      done <= '1;
    else
      done <= '0;
  end

  always_ff @(posedge clk) begin
    if (!reset && write_en)
      mem[addr0][addr1] <= write_data;
  end

  // Check for out of bounds access
  `ifdef VERILATOR
    always_comb begin
      if (addr0 >= D0_SIZE)
        $error(
          "comb_mem_d2: Out of bounds access\n",
          "addr0: %0d\n", addr0,
          "D0_SIZE: %0d", D0_SIZE
        );
      if (addr1 >= D1_SIZE)
        $error(
          "comb_mem_d2: Out of bounds access\n",
          "addr1: %0d\n", addr1,
          "D1_SIZE: %0d", D1_SIZE
        );
    end
  `endif
endmodule

module comb_mem_d3 #(
    parameter WIDTH = 32,
    parameter D0_SIZE = 16,
    parameter D1_SIZE = 16,
    parameter D2_SIZE = 16,
    parameter D0_IDX_SIZE = 4,
    parameter D1_IDX_SIZE = 4,
    parameter D2_IDX_SIZE = 4
) (
   input wire                logic [D0_IDX_SIZE-1:0] addr0,
   input wire                logic [D1_IDX_SIZE-1:0] addr1,
   input wire                logic [D2_IDX_SIZE-1:0] addr2,
   input wire                logic [ WIDTH-1:0] write_data,
   input wire                logic write_en,
   input wire                logic clk,
   input wire                logic reset,
   output logic [ WIDTH-1:0] read_data,
   output logic              done
);

  /* verilator lint_off WIDTH */
  logic [WIDTH-1:0] mem[D0_SIZE-1:0][D1_SIZE-1:0][D2_SIZE-1:0];

  assign read_data = mem[addr0][addr1][addr2];

  always_ff @(posedge clk) begin
    if (reset)
      done <= '0;
    else if (write_en)
      done <= '1;
    else
      done <= '0;
  end

  always_ff @(posedge clk) begin
    if (!reset && write_en)
      mem[addr0][addr1][addr2] <= write_data;
  end

  // Check for out of bounds access
  `ifdef VERILATOR
    always_comb begin
      if (addr0 >= D0_SIZE)
        $error(
          "comb_mem_d3: Out of bounds access\n",
          "addr0: %0d\n", addr0,
          "D0_SIZE: %0d", D0_SIZE
        );
      if (addr1 >= D1_SIZE)
        $error(
          "comb_mem_d3: Out of bounds access\n",
          "addr1: %0d\n", addr1,
          "D1_SIZE: %0d", D1_SIZE
        );
      if (addr2 >= D2_SIZE)
        $error(
          "comb_mem_d3: Out of bounds access\n",
          "addr2: %0d\n", addr2,
          "D2_SIZE: %0d", D2_SIZE
        );
    end
  `endif
endmodule

module comb_mem_d4 #(
    parameter WIDTH = 32,
    parameter D0_SIZE = 16,
    parameter D1_SIZE = 16,
    parameter D2_SIZE = 16,
    parameter D3_SIZE = 16,
    parameter D0_IDX_SIZE = 4,
    parameter D1_IDX_SIZE = 4,
    parameter D2_IDX_SIZE = 4,
    parameter D3_IDX_SIZE = 4
) (
   input wire                logic [D0_IDX_SIZE-1:0] addr0,
   input wire                logic [D1_IDX_SIZE-1:0] addr1,
   input wire                logic [D2_IDX_SIZE-1:0] addr2,
   input wire                logic [D3_IDX_SIZE-1:0] addr3,
   input wire                logic [ WIDTH-1:0] write_data,
   input wire                logic write_en,
   input wire                logic clk,
   input wire                logic reset,
   output logic [ WIDTH-1:0] read_data,
   output logic              done
);

  /* verilator lint_off WIDTH */
  logic [WIDTH-1:0] mem[D0_SIZE-1:0][D1_SIZE-1:0][D2_SIZE-1:0][D3_SIZE-1:0];

  assign read_data = mem[addr0][addr1][addr2][addr3];

  always_ff @(posedge clk) begin
    if (reset)
      done <= '0;
    else if (write_en)
      done <= '1;
    else
      done <= '0;
  end

  always_ff @(posedge clk) begin
    if (!reset && write_en)
      mem[addr0][addr1][addr2][addr3] <= write_data;
  end

  // Check for out of bounds access
  `ifdef VERILATOR
    always_comb begin
      if (addr0 >= D0_SIZE)
        $error(
          "comb_mem_d4: Out of bounds access\n",
          "addr0: %0d\n", addr0,
          "D0_SIZE: %0d", D0_SIZE
        );
      if (addr1 >= D1_SIZE)
        $error(
          "comb_mem_d4: Out of bounds access\n",
          "addr1: %0d\n", addr1,
          "D1_SIZE: %0d", D1_SIZE
        );
      if (addr2 >= D2_SIZE)
        $error(
          "comb_mem_d4: Out of bounds access\n",
          "addr2: %0d\n", addr2,
          "D2_SIZE: %0d", D2_SIZE
        );
      if (addr3 >= D3_SIZE)
        $error(
          "comb_mem_d4: Out of bounds access\n",
          "addr3: %0d\n", addr3,
          "D3_SIZE: %0d", D3_SIZE
        );
    end
  `endif
endmodule


/// This is mostly used for testing the static guarantees currently.
/// A realistic implementation would probably take four cycles.
module pipelined_mult #(
    parameter WIDTH = 32
) (
    input wire clk,
    input wire reset,
    // inputs
    input wire [WIDTH-1:0] left,
    input wire [WIDTH-1:0] right,
    // The input has been committed
    output wire [WIDTH-1:0] out
);

logic [WIDTH-1:0] buff0, buff1, buff2, buff3, tmp_prod;

assign out = buff3;
assign tmp_prod = left * right;

always_ff @(posedge clk) begin
    if (reset) begin
        buff0 <= 0;
        buff1 <= 0;
        buff2 <= 0;
        buff3 <= 0;
    end else begin
        buff0 <= tmp_prod;
        buff1 <= buff0;
        buff2 <= buff1;
        buff3 <= buff2;
    end
end

endmodule 

/// 
module pipelined_fp_smult #(
    parameter WIDTH = 32,
    parameter INT_WIDTH = 16,
    parameter FRAC_WIDTH = 16
)(
    input wire clk,
    input wire reset,
    // inputs
    input wire [WIDTH-1:0] left,
    input wire [WIDTH-1:0] right,
    // The input has been committed
    output wire [WIDTH-1:0] out
);

logic [WIDTH-1:0] lt, rt, buff0, buff1, buff2;
logic [(WIDTH << 1) - 1:0] tmp_prod;

assign out = buff2;
assign tmp_prod = $signed(
          { {WIDTH{lt[WIDTH-1]}}, lt} *
          { {WIDTH{rt[WIDTH-1]}}, rt}
        );

always_ff @(posedge clk) begin
    if (reset) begin
        lt <= 0;
        rt <= 0;
        buff0 <= 0;
        buff1 <= 0;
        buff2 <= 0;
    end else begin
        lt <= $signed(left);
        rt <= $signed(right);
        buff0 <= tmp_prod[(WIDTH << 1) - INT_WIDTH - 1 : WIDTH - INT_WIDTH];
        buff1 <= buff0;
        buff2 <= buff1;
    end
end

endmodule

/* verilator lint_off MULTITOP */
/// =================== Unsigned, Fixed Point =========================
module std_fp_add #(
    parameter WIDTH = 32,
    parameter INT_WIDTH = 16,
    parameter FRAC_WIDTH = 16
) (
    input  logic [WIDTH-1:0] left,
    input  logic [WIDTH-1:0] right,
    output logic [WIDTH-1:0] out
);
  assign out = left + right;
endmodule

module std_fp_sub #(
    parameter WIDTH = 32,
    parameter INT_WIDTH = 16,
    parameter FRAC_WIDTH = 16
) (
    input  logic [WIDTH-1:0] left,
    input  logic [WIDTH-1:0] right,
    output logic [WIDTH-1:0] out
);
  assign out = left - right;
endmodule

module std_fp_mult_pipe #(
    parameter WIDTH = 32,
    parameter INT_WIDTH = 16,
    parameter FRAC_WIDTH = 16,
    parameter SIGNED = 0
) (
    input  logic [WIDTH-1:0] left,
    input  logic [WIDTH-1:0] right,
    input  logic             go,
    input  logic             clk,
    input  logic             reset,
    output logic [WIDTH-1:0] out,
    output logic             done
);
  logic [WIDTH-1:0]          rtmp;
  logic [WIDTH-1:0]          ltmp;
  logic [(WIDTH << 1) - 1:0] out_tmp;
  // Buffer used to walk through the 3 cycles of the pipeline.
  logic done_buf[1:0];

  assign done = done_buf[1];

  assign out = out_tmp[(WIDTH << 1) - INT_WIDTH - 1 : WIDTH - INT_WIDTH];

  // If the done buffer is completely empty and go is high then execution
  // just started.
  logic start;
  assign start = go;

  // Start sending the done signal.
  always_ff @(posedge clk) begin
    if (start)
      done_buf[0] <= 1;
    else
      done_buf[0] <= 0;
  end

  // Push the done signal through the pipeline.
  always_ff @(posedge clk) begin
    if (go) begin
      done_buf[1] <= done_buf[0];
    end else begin
      done_buf[1] <= 0;
    end
  end

  // Register the inputs
  always_ff @(posedge clk) begin
    if (reset) begin
      rtmp <= 0;
      ltmp <= 0;
    end else if (go) begin
      if (SIGNED) begin
        rtmp <= $signed(right);
        ltmp <= $signed(left);
      end else begin
        rtmp <= right;
        ltmp <= left;
      end
    end else begin
      rtmp <= 0;
      ltmp <= 0;
    end

  end

  // Compute the output and save it into out_tmp
  always_ff @(posedge clk) begin
    if (reset) begin
      out_tmp <= 0;
    end else if (go) begin
      if (SIGNED) begin
        // In the first cycle, this performs an invalid computation because
        // ltmp and rtmp only get their actual values in cycle 1
        out_tmp <= $signed(
          { {WIDTH{ltmp[WIDTH-1]}}, ltmp} *
          { {WIDTH{rtmp[WIDTH-1]}}, rtmp}
        );
      end else begin
        out_tmp <= ltmp * rtmp;
      end
    end else begin
      out_tmp <= out_tmp;
    end
  end
endmodule

/* verilator lint_off WIDTH */
module std_fp_div_pipe #(
  parameter WIDTH = 32,
  parameter INT_WIDTH = 16,
  parameter FRAC_WIDTH = 16
) (
    input  logic             go,
    input  logic             clk,
    input  logic             reset,
    input  logic [WIDTH-1:0] left,
    input  logic [WIDTH-1:0] right,
    output logic [WIDTH-1:0] out_remainder,
    output logic [WIDTH-1:0] out_quotient,
    output logic             done
);
    localparam ITERATIONS = WIDTH + FRAC_WIDTH;

    logic [WIDTH-1:0] quotient, quotient_next;
    logic [WIDTH:0] acc, acc_next;
    logic [$clog2(ITERATIONS)-1:0] idx;
    logic start, running, finished, dividend_is_zero;

    assign start = go && !running;
    assign dividend_is_zero = start && left == 0;
    assign finished = idx == ITERATIONS - 1 && running;

    always_ff @(posedge clk) begin
      if (reset || finished || dividend_is_zero)
        running <= 0;
      else if (start)
        running <= 1;
      else
        running <= running;
    end

    always_comb begin
      if (acc >= {1'b0, right}) begin
        acc_next = acc - right;
        {acc_next, quotient_next} = {acc_next[WIDTH-1:0], quotient, 1'b1};
      end else begin
        {acc_next, quotient_next} = {acc, quotient} << 1;
      end
    end

    // `done` signaling
    always_ff @(posedge clk) begin
      if (dividend_is_zero || finished)
        done <= 1;
      else
        done <= 0;
    end

    always_ff @(posedge clk) begin
      if (running)
        idx <= idx + 1;
      else
        idx <= 0;
    end

    always_ff @(posedge clk) begin
      if (reset) begin
        out_quotient <= 0;
        out_remainder <= 0;
      end else if (start) begin
        out_quotient <= 0;
        out_remainder <= left;
      end else if (go == 0) begin
        out_quotient <= out_quotient;
        out_remainder <= out_remainder;
      end else if (dividend_is_zero) begin
        out_quotient <= 0;
        out_remainder <= 0;
      end else if (finished) begin
        out_quotient <= quotient_next;
        out_remainder <= out_remainder;
      end else begin
        out_quotient <= out_quotient;
        if (right <= out_remainder)
          out_remainder <= out_remainder - right;
        else
          out_remainder <= out_remainder;
      end
    end

    always_ff @(posedge clk) begin
      if (reset) begin
        acc <= 0;
        quotient <= 0;
      end else if (start) begin
        {acc, quotient} <= {{WIDTH{1'b0}}, left, 1'b0};
      end else begin
        acc <= acc_next;
        quotient <= quotient_next;
      end
    end
endmodule

module std_fp_gt #(
    parameter WIDTH = 32,
    parameter INT_WIDTH = 16,
    parameter FRAC_WIDTH = 16
) (
    input  logic [WIDTH-1:0] left,
    input  logic [WIDTH-1:0] right,
    output logic             out
);
  assign out = left > right;
endmodule

/// =================== Signed, Fixed Point =========================
module std_fp_sadd #(
    parameter WIDTH = 32,
    parameter INT_WIDTH = 16,
    parameter FRAC_WIDTH = 16
) (
    input  signed [WIDTH-1:0] left,
    input  signed [WIDTH-1:0] right,
    output signed [WIDTH-1:0] out
);
  assign out = $signed(left + right);
endmodule

module std_fp_ssub #(
    parameter WIDTH = 32,
    parameter INT_WIDTH = 16,
    parameter FRAC_WIDTH = 16
) (
    input  signed [WIDTH-1:0] left,
    input  signed [WIDTH-1:0] right,
    output signed [WIDTH-1:0] out
);

  assign out = $signed(left - right);
endmodule

module std_fp_smult_pipe #(
    parameter WIDTH = 32,
    parameter INT_WIDTH = 16,
    parameter FRAC_WIDTH = 16
) (
    input  [WIDTH-1:0]              left,
    input  [WIDTH-1:0]              right,
    input  logic                    reset,
    input  logic                    go,
    input  logic                    clk,
    output logic [WIDTH-1:0]        out,
    output logic                    done
);
  std_fp_mult_pipe #(
    .WIDTH(WIDTH),
    .INT_WIDTH(INT_WIDTH),
    .FRAC_WIDTH(FRAC_WIDTH),
    .SIGNED(1)
  ) comp (
    .clk(clk),
    .done(done),
    .reset(reset),
    .go(go),
    .left(left),
    .right(right),
    .out(out)
  );
endmodule

module std_fp_sdiv_pipe #(
    parameter WIDTH = 32,
    parameter INT_WIDTH = 16,
    parameter FRAC_WIDTH = 16
) (
    input                     clk,
    input                     go,
    input                     reset,
    input  signed [WIDTH-1:0] left,
    input  signed [WIDTH-1:0] right,
    output signed [WIDTH-1:0] out_quotient,
    output signed [WIDTH-1:0] out_remainder,
    output logic              done
);

  logic signed [WIDTH-1:0] left_abs, right_abs, comp_out_q, comp_out_r, right_save, out_rem_intermediate;

  // Registers to figure out how to transform outputs.
  logic different_signs, left_sign, right_sign;

  // Latch the value of control registers so that their available after
  // go signal becomes low.
  always_ff @(posedge clk) begin
    if (go) begin
      right_save <= right_abs;
      left_sign <= left[WIDTH-1];
      right_sign <= right[WIDTH-1];
    end else begin
      left_sign <= left_sign;
      right_save <= right_save;
      right_sign <= right_sign;
    end
  end

  assign right_abs = right[WIDTH-1] ? -right : right;
  assign left_abs = left[WIDTH-1] ? -left : left;

  assign different_signs = left_sign ^ right_sign;
  assign out_quotient = different_signs ? -comp_out_q : comp_out_q;

  // Remainder is computed as:
  //  t0 = |left| % |right|
  //  t1 = if left * right < 0 and t0 != 0 then |right| - t0 else t0
  //  rem = if right < 0 then -t1 else t1
  assign out_rem_intermediate = different_signs & |comp_out_r ? $signed(right_save - comp_out_r) : comp_out_r;
  assign out_remainder = right_sign ? -out_rem_intermediate : out_rem_intermediate;

  std_fp_div_pipe #(
    .WIDTH(WIDTH),
    .INT_WIDTH(INT_WIDTH),
    .FRAC_WIDTH(FRAC_WIDTH)
  ) comp (
    .reset(reset),
    .clk(clk),
    .done(done),
    .go(go),
    .left(left_abs),
    .right(right_abs),
    .out_quotient(comp_out_q),
    .out_remainder(comp_out_r)
  );
endmodule

module std_fp_sgt #(
    parameter WIDTH = 32,
    parameter INT_WIDTH = 16,
    parameter FRAC_WIDTH = 16
) (
    input  logic signed [WIDTH-1:0] left,
    input  logic signed [WIDTH-1:0] right,
    output logic signed             out
);
  assign out = $signed(left > right);
endmodule

module std_fp_slt #(
    parameter WIDTH = 32,
    parameter INT_WIDTH = 16,
    parameter FRAC_WIDTH = 16
) (
   input logic signed [WIDTH-1:0] left,
   input logic signed [WIDTH-1:0] right,
   output logic signed            out
);
  assign out = $signed(left < right);
endmodule

/// =================== Unsigned, Bitnum =========================
module std_mult_pipe #(
    parameter WIDTH = 32
) (
    input  logic [WIDTH-1:0] left,
    input  logic [WIDTH-1:0] right,
    input  logic             reset,
    input  logic             go,
    input  logic             clk,
    output logic [WIDTH-1:0] out,
    output logic             done
);
  std_fp_mult_pipe #(
    .WIDTH(WIDTH),
    .INT_WIDTH(WIDTH),
    .FRAC_WIDTH(0),
    .SIGNED(0)
  ) comp (
    .reset(reset),
    .clk(clk),
    .done(done),
    .go(go),
    .left(left),
    .right(right),
    .out(out)
  );
endmodule

module std_div_pipe #(
    parameter WIDTH = 32
) (
    input                    reset,
    input                    clk,
    input                    go,
    input        [WIDTH-1:0] left,
    input        [WIDTH-1:0] right,
    output logic [WIDTH-1:0] out_remainder,
    output logic [WIDTH-1:0] out_quotient,
    output logic             done
);

  logic [WIDTH-1:0] dividend;
  logic [(WIDTH-1)*2:0] divisor;
  logic [WIDTH-1:0] quotient;
  logic [WIDTH-1:0] quotient_msk;
  logic start, running, finished, dividend_is_zero;

  assign start = go && !running;
  assign finished = quotient_msk == 0 && running;
  assign dividend_is_zero = start && left == 0;

  always_ff @(posedge clk) begin
    // Early return if the divisor is zero.
    if (finished || dividend_is_zero)
      done <= 1;
    else
      done <= 0;
  end

  always_ff @(posedge clk) begin
    if (reset || finished || dividend_is_zero)
      running <= 0;
    else if (start)
      running <= 1;
    else
      running <= running;
  end

  // Outputs
  always_ff @(posedge clk) begin
    if (dividend_is_zero || start) begin
      out_quotient <= 0;
      out_remainder <= 0;
    end else if (finished) begin
      out_quotient <= quotient;
      out_remainder <= dividend;
    end else begin
      // Otherwise, explicitly latch the values.
      out_quotient <= out_quotient;
      out_remainder <= out_remainder;
    end
  end

  // Calculate the quotient mask.
  always_ff @(posedge clk) begin
    if (start)
      quotient_msk <= 1 << WIDTH - 1;
    else if (running)
      quotient_msk <= quotient_msk >> 1;
    else
      quotient_msk <= quotient_msk;
  end

  // Calculate the quotient.
  always_ff @(posedge clk) begin
    if (start)
      quotient <= 0;
    else if (divisor <= dividend)
      quotient <= quotient | quotient_msk;
    else
      quotient <= quotient;
  end

  // Calculate the dividend.
  always_ff @(posedge clk) begin
    if (start)
      dividend <= left;
    else if (divisor <= dividend)
      dividend <= dividend - divisor;
    else
      dividend <= dividend;
  end

  always_ff @(posedge clk) begin
    if (start) begin
      divisor <= right << WIDTH - 1;
    end else if (finished) begin
      divisor <= 0;
    end else begin
      divisor <= divisor >> 1;
    end
  end

  // Simulation self test against unsynthesizable implementation.
  `ifdef VERILATOR
    logic [WIDTH-1:0] l, r;
    always_ff @(posedge clk) begin
      if (go) begin
        l <= left;
        r <= right;
      end else begin
        l <= l;
        r <= r;
      end
    end

    always @(posedge clk) begin
      if (done && $unsigned(out_remainder) != $unsigned(l % r))
        $error(
          "\nstd_div_pipe (Remainder): Computed and golden outputs do not match!\n",
          "left: %0d", $unsigned(l),
          "  right: %0d\n", $unsigned(r),
          "expected: %0d", $unsigned(l % r),
          "  computed: %0d", $unsigned(out_remainder)
        );

      if (done && $unsigned(out_quotient) != $unsigned(l / r))
        $error(
          "\nstd_div_pipe (Quotient): Computed and golden outputs do not match!\n",
          "left: %0d", $unsigned(l),
          "  right: %0d\n", $unsigned(r),
          "expected: %0d", $unsigned(l / r),
          "  computed: %0d", $unsigned(out_quotient)
        );
    end
  `endif
endmodule

/// =================== Signed, Bitnum =========================
module std_sadd #(
    parameter WIDTH = 32
) (
    input  signed [WIDTH-1:0] left,
    input  signed [WIDTH-1:0] right,
    output signed [WIDTH-1:0] out
);
  assign out = $signed(left + right);
endmodule

module std_ssub #(
    parameter WIDTH = 32
) (
    input  signed [WIDTH-1:0] left,
    input  signed [WIDTH-1:0] right,
    output signed [WIDTH-1:0] out
);
  assign out = $signed(left - right);
endmodule

module std_smult_pipe #(
    parameter WIDTH = 32
) (
    input  logic                    reset,
    input  logic                    go,
    input  logic                    clk,
    input  signed       [WIDTH-1:0] left,
    input  signed       [WIDTH-1:0] right,
    output logic signed [WIDTH-1:0] out,
    output logic                    done
);
  std_fp_mult_pipe #(
    .WIDTH(WIDTH),
    .INT_WIDTH(WIDTH),
    .FRAC_WIDTH(0),
    .SIGNED(1)
  ) comp (
    .reset(reset),
    .clk(clk),
    .done(done),
    .go(go),
    .left(left),
    .right(right),
    .out(out)
  );
endmodule

/* verilator lint_off WIDTH */
module std_sdiv_pipe #(
    parameter WIDTH = 32
) (
    input                           reset,
    input                           clk,
    input                           go,
    input  logic signed [WIDTH-1:0] left,
    input  logic signed [WIDTH-1:0] right,
    output logic signed [WIDTH-1:0] out_quotient,
    output logic signed [WIDTH-1:0] out_remainder,
    output logic                    done
);

  logic signed [WIDTH-1:0] left_abs, right_abs, comp_out_q, comp_out_r, right_save, out_rem_intermediate;

  // Registers to figure out how to transform outputs.
  logic different_signs, left_sign, right_sign;

  // Latch the value of control registers so that their available after
  // go signal becomes low.
  always_ff @(posedge clk) begin
    if (go) begin
      right_save <= right_abs;
      left_sign <= left[WIDTH-1];
      right_sign <= right[WIDTH-1];
    end else begin
      left_sign <= left_sign;
      right_save <= right_save;
      right_sign <= right_sign;
    end
  end

  assign right_abs = right[WIDTH-1] ? -right : right;
  assign left_abs = left[WIDTH-1] ? -left : left;

  assign different_signs = left_sign ^ right_sign;
  assign out_quotient = different_signs ? -comp_out_q : comp_out_q;

  // Remainder is computed as:
  //  t0 = |left| % |right|
  //  t1 = if left * right < 0 and t0 != 0 then |right| - t0 else t0
  //  rem = if right < 0 then -t1 else t1
  assign out_rem_intermediate = different_signs & |comp_out_r ? $signed(right_save - comp_out_r) : comp_out_r;
  assign out_remainder = right_sign ? -out_rem_intermediate : out_rem_intermediate;

  std_div_pipe #(
    .WIDTH(WIDTH)
  ) comp (
    .reset(reset),
    .clk(clk),
    .done(done),
    .go(go),
    .left(left_abs),
    .right(right_abs),
    .out_quotient(comp_out_q),
    .out_remainder(comp_out_r)
  );

  // Simulation self test against unsynthesizable implementation.
  `ifdef VERILATOR
    logic signed [WIDTH-1:0] l, r;
    always_ff @(posedge clk) begin
      if (go) begin
        l <= left;
        r <= right;
      end else begin
        l <= l;
        r <= r;
      end
    end

    always @(posedge clk) begin
      if (done && out_quotient != $signed(l / r))
        $error(
          "\nstd_sdiv_pipe (Quotient): Computed and golden outputs do not match!\n",
          "left: %0d", l,
          "  right: %0d\n", r,
          "expected: %0d", $signed(l / r),
          "  computed: %0d", $signed(out_quotient),
        );
      if (done && out_remainder != $signed(((l % r) + r) % r))
        $error(
          "\nstd_sdiv_pipe (Remainder): Computed and golden outputs do not match!\n",
          "left: %0d", l,
          "  right: %0d\n", r,
          "expected: %0d", $signed(((l % r) + r) % r),
          "  computed: %0d", $signed(out_remainder),
        );
    end
  `endif
endmodule

module std_sgt #(
    parameter WIDTH = 32
) (
    input  signed [WIDTH-1:0] left,
    input  signed [WIDTH-1:0] right,
    output signed             out
);
  assign out = $signed(left > right);
endmodule

module std_slt #(
    parameter WIDTH = 32
) (
    input  signed [WIDTH-1:0] left,
    input  signed [WIDTH-1:0] right,
    output signed             out
);
  assign out = $signed(left < right);
endmodule

module std_seq #(
    parameter WIDTH = 32
) (
    input  signed [WIDTH-1:0] left,
    input  signed [WIDTH-1:0] right,
    output signed             out
);
  assign out = $signed(left == right);
endmodule

module std_sneq #(
    parameter WIDTH = 32
) (
    input  signed [WIDTH-1:0] left,
    input  signed [WIDTH-1:0] right,
    output signed             out
);
  assign out = $signed(left != right);
endmodule

module std_sge #(
    parameter WIDTH = 32
) (
    input  signed [WIDTH-1:0] left,
    input  signed [WIDTH-1:0] right,
    output signed             out
);
  assign out = $signed(left >= right);
endmodule

module std_sle #(
    parameter WIDTH = 32
) (
    input  signed [WIDTH-1:0] left,
    input  signed [WIDTH-1:0] right,
    output signed             out
);
  assign out = $signed(left <= right);
endmodule

module std_slsh #(
    parameter WIDTH = 32
) (
    input  signed [WIDTH-1:0] left,
    input  signed [WIDTH-1:0] right,
    output signed [WIDTH-1:0] out
);
  assign out = left <<< right;
endmodule

module std_srsh #(
    parameter WIDTH = 32
) (
    input  signed [WIDTH-1:0] left,
    input  signed [WIDTH-1:0] right,
    output signed [WIDTH-1:0] out
);
  assign out = left >>> right;
endmodule

// Signed extension
module std_signext #(
  parameter IN_WIDTH  = 32,
  parameter OUT_WIDTH = 32
) (
  input wire logic [IN_WIDTH-1:0]  in,
  output logic     [OUT_WIDTH-1:0] out
);
  localparam EXTEND = OUT_WIDTH - IN_WIDTH;
  assign out = { {EXTEND {in[IN_WIDTH-1]}}, in};

  `ifdef VERILATOR
    always_comb begin
      if (IN_WIDTH > OUT_WIDTH)
        $error(
          "std_signext: Output width less than input width\n",
          "IN_WIDTH: %0d", IN_WIDTH,
          "OUT_WIDTH: %0d", OUT_WIDTH
        );
    end
  `endif
endmodule

/**
 * Core primitives for Calyx.
 * Implements core primitives used by the compiler.
 *
 * Conventions:
 * - All parameter names must be SNAKE_CASE and all caps.
 * - Port names must be snake_case, no caps.
 */

module std_slice #(
    parameter IN_WIDTH  = 32,
    parameter OUT_WIDTH = 32
) (
   input wire                   logic [ IN_WIDTH-1:0] in,
   output logic [OUT_WIDTH-1:0] out
);
  assign out = in[OUT_WIDTH-1:0];

  `ifdef VERILATOR
    always_comb begin
      if (IN_WIDTH < OUT_WIDTH)
        $error(
          "std_slice: Input width less than output width\n",
          "IN_WIDTH: %0d", IN_WIDTH,
          "OUT_WIDTH: %0d", OUT_WIDTH
        );
    end
  `endif
endmodule

module std_pad #(
    parameter IN_WIDTH  = 32,
    parameter OUT_WIDTH = 32
) (
   input wire logic [IN_WIDTH-1:0]  in,
   output logic     [OUT_WIDTH-1:0] out
);
  localparam EXTEND = OUT_WIDTH - IN_WIDTH;
  assign out = { {EXTEND {1'b0}}, in};

  `ifdef VERILATOR
    always_comb begin
      if (IN_WIDTH > OUT_WIDTH)
        $error(
          "std_pad: Output width less than input width\n",
          "IN_WIDTH: %0d", IN_WIDTH,
          "OUT_WIDTH: %0d", OUT_WIDTH
        );
    end
  `endif
endmodule

module std_cat #(
  parameter LEFT_WIDTH  = 32,
  parameter RIGHT_WIDTH = 32,
  parameter OUT_WIDTH = 64
) (
  input wire logic [LEFT_WIDTH-1:0] left,
  input wire logic [RIGHT_WIDTH-1:0] right,
  output logic [OUT_WIDTH-1:0] out
);
  assign out = {left, right};

  `ifdef VERILATOR
    always_comb begin
      if (LEFT_WIDTH + RIGHT_WIDTH != OUT_WIDTH)
        $error(
          "std_cat: Output width must equal sum of input widths\n",
          "LEFT_WIDTH: %0d", LEFT_WIDTH,
          "RIGHT_WIDTH: %0d", RIGHT_WIDTH,
          "OUT_WIDTH: %0d", OUT_WIDTH
        );
    end
  `endif
endmodule

module std_not #(
    parameter WIDTH = 32
) (
   input wire               logic [WIDTH-1:0] in,
   output logic [WIDTH-1:0] out
);
  assign out = ~in;
endmodule

module std_and #(
    parameter WIDTH = 32
) (
   input wire               logic [WIDTH-1:0] left,
   input wire               logic [WIDTH-1:0] right,
   output logic [WIDTH-1:0] out
);
  assign out = left & right;
endmodule

module std_or #(
    parameter WIDTH = 32
) (
   input wire               logic [WIDTH-1:0] left,
   input wire               logic [WIDTH-1:0] right,
   output logic [WIDTH-1:0] out
);
  assign out = left | right;
endmodule

module std_xor #(
    parameter WIDTH = 32
) (
   input wire               logic [WIDTH-1:0] left,
   input wire               logic [WIDTH-1:0] right,
   output logic [WIDTH-1:0] out
);
  assign out = left ^ right;
endmodule

module std_sub #(
    parameter WIDTH = 32
) (
   input wire               logic [WIDTH-1:0] left,
   input wire               logic [WIDTH-1:0] right,
   output logic [WIDTH-1:0] out
);
  assign out = left - right;
endmodule

module std_gt #(
    parameter WIDTH = 32
) (
   input wire   logic [WIDTH-1:0] left,
   input wire   logic [WIDTH-1:0] right,
   output logic out
);
  assign out = left > right;
endmodule

module std_lt #(
    parameter WIDTH = 32
) (
   input wire   logic [WIDTH-1:0] left,
   input wire   logic [WIDTH-1:0] right,
   output logic out
);
  assign out = left < right;
endmodule

module std_eq #(
    parameter WIDTH = 32
) (
   input wire   logic [WIDTH-1:0] left,
   input wire   logic [WIDTH-1:0] right,
   output logic out
);
  assign out = left == right;
endmodule

module std_neq #(
    parameter WIDTH = 32
) (
   input wire   logic [WIDTH-1:0] left,
   input wire   logic [WIDTH-1:0] right,
   output logic out
);
  assign out = left != right;
endmodule

module std_ge #(
    parameter WIDTH = 32
) (
    input wire   logic [WIDTH-1:0] left,
    input wire   logic [WIDTH-1:0] right,
    output logic out
);
  assign out = left >= right;
endmodule

module std_le #(
    parameter WIDTH = 32
) (
   input wire   logic [WIDTH-1:0] left,
   input wire   logic [WIDTH-1:0] right,
   output logic out
);
  assign out = left <= right;
endmodule

module std_lsh #(
    parameter WIDTH = 32
) (
   input wire               logic [WIDTH-1:0] left,
   input wire               logic [WIDTH-1:0] right,
   output logic [WIDTH-1:0] out
);
  assign out = left << right;
endmodule

module std_rsh #(
    parameter WIDTH = 32
) (
   input wire               logic [WIDTH-1:0] left,
   input wire               logic [WIDTH-1:0] right,
   output logic [WIDTH-1:0] out
);
  assign out = left >> right;
endmodule

/// this primitive is intended to be used
/// for lowering purposes (not in source programs)
module std_mux #(
    parameter WIDTH = 32
) (
   input wire               logic cond,
   input wire               logic [WIDTH-1:0] tru,
   input wire               logic [WIDTH-1:0] fal,
   output logic [WIDTH-1:0] out
);
  assign out = cond ? tru : fal;
endmodule

module std_bit_slice #(
    parameter IN_WIDTH = 32,
    parameter START_IDX = 0,
    parameter END_IDX = 31,
    parameter OUT_WIDTH = 32
)(
   input wire logic [IN_WIDTH-1:0] in,
   output logic [OUT_WIDTH-1:0] out
);
    assign out = in[END_IDX:START_IDX];

  `ifdef VERILATOR
    always_comb begin
      if (START_IDX < 0 || END_IDX > IN_WIDTH-1)
        $error(
          "std_bit_slice: Slice range out of bounds\n",
          "IN_WIDTH: %0d", IN_WIDTH,
          "START_IDX: %0d", START_IDX,
          "END_IDX: %0d", END_IDX,
        );
    end
  `endif

endmodule

module undef #(
    parameter WIDTH = 32
) (
   output logic [WIDTH-1:0] out
);
assign out = 'x;
endmodule

module std_const #(
    parameter WIDTH = 32,
    parameter VALUE = 32
) (
   output logic [WIDTH-1:0] out
);
assign out = VALUE;
endmodule

module std_wire #(
    parameter WIDTH = 32
) (
   input wire logic [WIDTH-1:0] in,
   output logic [WIDTH-1:0] out
);
assign out = in;
endmodule

module std_add #(
    parameter WIDTH = 32
) (
   input wire logic [WIDTH-1:0] left,
   input wire logic [WIDTH-1:0] right,
   output logic [WIDTH-1:0] out
);
assign out = left + right;
endmodule

module std_reg #(
    parameter WIDTH = 32
) (
   input wire logic [WIDTH-1:0] in,
   input wire logic write_en,
   input wire logic clk,
   input wire logic reset,
   output logic [WIDTH-1:0] out,
   output logic done
);
always_ff @(posedge clk) begin
    if (reset) begin
       out <= 0;
       done <= 0;
    end else if (write_en) begin
      out <= in;
      done <= 1'd1;
    end else done <= 1'd0;
  end
endmodule

module mac_pe(
  input logic [31:0] top,
  input logic [31:0] left,
  input logic mul_ready,
  output logic [31:0] out,
  input logic go,
  input logic clk,
  input logic reset,
  output logic done
);
// COMPONENT START: mac_pe
logic [31:0] acc_in;
logic acc_write_en;
logic acc_clk;
logic acc_reset;
logic [31:0] acc_out;
logic acc_done;
logic [31:0] adder_left;
logic [31:0] adder_right;
logic [31:0] adder_out;
logic mul_clk;
logic mul_reset;
logic [31:0] mul_left;
logic [31:0] mul_right;
logic [31:0] mul_out;
std_reg # (
    .WIDTH(32)
) acc (
    .clk(acc_clk),
    .done(acc_done),
    .in(acc_in),
    .out(acc_out),
    .reset(acc_reset),
    .write_en(acc_write_en)
);
std_fp_sadd # (
    .FRAC_WIDTH(16),
    .INT_WIDTH(16),
    .WIDTH(32)
) adder (
    .left(adder_left),
    .out(adder_out),
    .right(adder_right)
);
pipelined_fp_smult # (
    .FRAC_WIDTH(16),
    .INT_WIDTH(16),
    .WIDTH(32)
) mul (
    .clk(mul_clk),
    .left(mul_left),
    .out(mul_out),
    .reset(mul_reset),
    .right(mul_right)
);
wire _guard0 = 1;
wire _guard1 = go;
wire _guard2 = go;
wire _guard3 = go;
wire _guard4 = go;
wire _guard5 = go;
wire _guard6 = go;
assign acc_write_en =
  _guard1 ? mul_ready :
  1'd0;
assign acc_clk = clk;
assign acc_reset = reset;
assign acc_in = adder_out;
assign adder_left = acc_out;
assign adder_right = mul_out;
assign out = acc_out;
assign mul_clk = clk;
assign mul_left =
  _guard5 ? top :
  32'd0;
assign mul_reset = reset;
assign mul_right =
  _guard6 ? left :
  32'd0;
// COMPONENT END: mac_pe
endmodule
module systolic_array_comp(
  input logic [31:0] depth,
  input logic [31:0] t0_read_data,
  input logic [31:0] t1_read_data,
  input logic [31:0] t2_read_data,
  input logic [31:0] t3_read_data,
  input logic [31:0] l0_read_data,
  input logic [31:0] l1_read_data,
  input logic [31:0] l2_read_data,
  input logic [31:0] l3_read_data,
  output logic [2:0] t0_addr0,
  output logic [2:0] t1_addr0,
  output logic [2:0] t2_addr0,
  output logic [2:0] t3_addr0,
  output logic [2:0] l0_addr0,
  output logic [2:0] l1_addr0,
  output logic [2:0] l2_addr0,
  output logic [2:0] l3_addr0,
  output logic r0_valid,
  output logic [31:0] r0_value,
  output logic [2:0] r0_idx,
  output logic r1_valid,
  output logic [31:0] r1_value,
  output logic [2:0] r1_idx,
  output logic r2_valid,
  output logic [31:0] r2_value,
  output logic [2:0] r2_idx,
  output logic r3_valid,
  output logic [31:0] r3_value,
  output logic [2:0] r3_idx,
  input logic go,
  input logic clk,
  input logic reset,
  output logic done
);
// COMPONENT START: systolic_array_comp
logic [31:0] iter_limit_in;
logic iter_limit_write_en;
logic iter_limit_clk;
logic iter_limit_reset;
logic [31:0] iter_limit_out;
logic iter_limit_done;
logic [31:0] iter_limit_add_left;
logic [31:0] iter_limit_add_right;
logic [31:0] iter_limit_add_out;
logic [31:0] idx_in;
logic idx_write_en;
logic idx_clk;
logic idx_reset;
logic [31:0] idx_out;
logic idx_done;
logic [31:0] lt_iter_limit_left;
logic [31:0] lt_iter_limit_right;
logic lt_iter_limit_out;
logic [31:0] depth_plus_0_left;
logic [31:0] depth_plus_0_right;
logic [31:0] depth_plus_0_out;
logic [31:0] depth_plus_1_left;
logic [31:0] depth_plus_1_right;
logic [31:0] depth_plus_1_out;
logic [31:0] depth_plus_2_left;
logic [31:0] depth_plus_2_right;
logic [31:0] depth_plus_2_out;
logic [31:0] depth_plus_3_left;
logic [31:0] depth_plus_3_right;
logic [31:0] depth_plus_3_out;
logic [31:0] depth_plus_5_left;
logic [31:0] depth_plus_5_right;
logic [31:0] depth_plus_5_out;
logic [31:0] depth_plus_6_left;
logic [31:0] depth_plus_6_right;
logic [31:0] depth_plus_6_out;
logic [31:0] depth_plus_7_left;
logic [31:0] depth_plus_7_right;
logic [31:0] depth_plus_7_out;
logic [31:0] depth_plus_8_left;
logic [31:0] depth_plus_8_right;
logic [31:0] depth_plus_8_out;
logic [31:0] depth_plus_9_left;
logic [31:0] depth_plus_9_right;
logic [31:0] depth_plus_9_out;
logic [31:0] depth_plus_10_left;
logic [31:0] depth_plus_10_right;
logic [31:0] depth_plus_10_out;
logic [31:0] depth_plus_11_left;
logic [31:0] depth_plus_11_right;
logic [31:0] depth_plus_11_out;
logic [31:0] index_eq_depth_plus_5_left;
logic [31:0] index_eq_depth_plus_5_right;
logic index_eq_depth_plus_5_out;
logic [31:0] index_eq_depth_plus_6_left;
logic [31:0] index_eq_depth_plus_6_right;
logic index_eq_depth_plus_6_out;
logic [31:0] index_eq_depth_plus_7_left;
logic [31:0] index_eq_depth_plus_7_right;
logic index_eq_depth_plus_7_out;
logic [31:0] index_eq_depth_plus_8_left;
logic [31:0] index_eq_depth_plus_8_right;
logic index_eq_depth_plus_8_out;
logic [31:0] index_eq_depth_plus_9_left;
logic [31:0] index_eq_depth_plus_9_right;
logic index_eq_depth_plus_9_out;
logic [31:0] index_eq_depth_plus_10_left;
logic [31:0] index_eq_depth_plus_10_right;
logic index_eq_depth_plus_10_out;
logic [31:0] index_eq_depth_plus_11_left;
logic [31:0] index_eq_depth_plus_11_right;
logic index_eq_depth_plus_11_out;
logic [31:0] index_ge_1_left;
logic [31:0] index_ge_1_right;
logic index_ge_1_out;
logic [31:0] index_ge_2_left;
logic [31:0] index_ge_2_right;
logic index_ge_2_out;
logic [31:0] index_ge_3_left;
logic [31:0] index_ge_3_right;
logic index_ge_3_out;
logic [31:0] index_ge_4_left;
logic [31:0] index_ge_4_right;
logic index_ge_4_out;
logic [31:0] index_ge_5_left;
logic [31:0] index_ge_5_right;
logic index_ge_5_out;
logic [31:0] index_ge_6_left;
logic [31:0] index_ge_6_right;
logic index_ge_6_out;
logic [31:0] index_ge_7_left;
logic [31:0] index_ge_7_right;
logic index_ge_7_out;
logic [31:0] index_ge_8_left;
logic [31:0] index_ge_8_right;
logic index_ge_8_out;
logic [31:0] index_ge_9_left;
logic [31:0] index_ge_9_right;
logic index_ge_9_out;
logic [31:0] index_ge_10_left;
logic [31:0] index_ge_10_right;
logic index_ge_10_out;
logic [31:0] index_ge_11_left;
logic [31:0] index_ge_11_right;
logic index_ge_11_out;
logic [31:0] index_lt_depth_plus_0_left;
logic [31:0] index_lt_depth_plus_0_right;
logic index_lt_depth_plus_0_out;
logic [31:0] index_lt_depth_plus_1_left;
logic [31:0] index_lt_depth_plus_1_right;
logic index_lt_depth_plus_1_out;
logic [31:0] index_lt_depth_plus_2_left;
logic [31:0] index_lt_depth_plus_2_right;
logic index_lt_depth_plus_2_out;
logic [31:0] index_lt_depth_plus_3_left;
logic [31:0] index_lt_depth_plus_3_right;
logic index_lt_depth_plus_3_out;
logic [31:0] index_lt_depth_plus_5_left;
logic [31:0] index_lt_depth_plus_5_right;
logic index_lt_depth_plus_5_out;
logic [31:0] index_lt_depth_plus_6_left;
logic [31:0] index_lt_depth_plus_6_right;
logic index_lt_depth_plus_6_out;
logic [31:0] index_lt_depth_plus_7_left;
logic [31:0] index_lt_depth_plus_7_right;
logic index_lt_depth_plus_7_out;
logic [31:0] index_lt_depth_plus_8_left;
logic [31:0] index_lt_depth_plus_8_right;
logic index_lt_depth_plus_8_out;
logic [31:0] index_lt_depth_plus_9_left;
logic [31:0] index_lt_depth_plus_9_right;
logic index_lt_depth_plus_9_out;
logic [31:0] index_lt_depth_plus_10_left;
logic [31:0] index_lt_depth_plus_10_right;
logic index_lt_depth_plus_10_out;
logic [31:0] index_lt_depth_plus_11_left;
logic [31:0] index_lt_depth_plus_11_right;
logic index_lt_depth_plus_11_out;
logic idx_between_1_depth_plus_1_comb_left;
logic idx_between_1_depth_plus_1_comb_right;
logic idx_between_1_depth_plus_1_comb_out;
logic idx_between_2_depth_plus_2_comb_left;
logic idx_between_2_depth_plus_2_comb_right;
logic idx_between_2_depth_plus_2_comb_out;
logic idx_between_3_depth_plus_3_comb_left;
logic idx_between_3_depth_plus_3_comb_right;
logic idx_between_3_depth_plus_3_comb_out;
logic idx_between_1_depth_plus_5_comb_left;
logic idx_between_1_depth_plus_5_comb_right;
logic idx_between_1_depth_plus_5_comb_out;
logic idx_between_2_depth_plus_6_comb_left;
logic idx_between_2_depth_plus_6_comb_right;
logic idx_between_2_depth_plus_6_comb_out;
logic idx_between_3_depth_plus_7_comb_left;
logic idx_between_3_depth_plus_7_comb_right;
logic idx_between_3_depth_plus_7_comb_out;
logic idx_between_4_depth_plus_8_comb_left;
logic idx_between_4_depth_plus_8_comb_right;
logic idx_between_4_depth_plus_8_comb_out;
logic idx_between_5_depth_plus_9_comb_left;
logic idx_between_5_depth_plus_9_comb_right;
logic idx_between_5_depth_plus_9_comb_out;
logic idx_between_6_depth_plus_10_comb_left;
logic idx_between_6_depth_plus_10_comb_right;
logic idx_between_6_depth_plus_10_comb_out;
logic idx_between_7_depth_plus_11_comb_left;
logic idx_between_7_depth_plus_11_comb_right;
logic idx_between_7_depth_plus_11_comb_out;
logic [31:0] pe_0_0_top;
logic [31:0] pe_0_0_left;
logic pe_0_0_mul_ready;
logic [31:0] pe_0_0_out;
logic pe_0_0_go;
logic pe_0_0_clk;
logic pe_0_0_reset;
logic pe_0_0_done;
logic [31:0] top_0_0_in;
logic top_0_0_write_en;
logic top_0_0_clk;
logic top_0_0_reset;
logic [31:0] top_0_0_out;
logic top_0_0_done;
logic [31:0] left_0_0_in;
logic left_0_0_write_en;
logic left_0_0_clk;
logic left_0_0_reset;
logic [31:0] left_0_0_out;
logic left_0_0_done;
logic [31:0] pe_0_1_top;
logic [31:0] pe_0_1_left;
logic pe_0_1_mul_ready;
logic [31:0] pe_0_1_out;
logic pe_0_1_go;
logic pe_0_1_clk;
logic pe_0_1_reset;
logic pe_0_1_done;
logic [31:0] top_0_1_in;
logic top_0_1_write_en;
logic top_0_1_clk;
logic top_0_1_reset;
logic [31:0] top_0_1_out;
logic top_0_1_done;
logic [31:0] left_0_1_in;
logic left_0_1_write_en;
logic left_0_1_clk;
logic left_0_1_reset;
logic [31:0] left_0_1_out;
logic left_0_1_done;
logic [31:0] pe_0_2_top;
logic [31:0] pe_0_2_left;
logic pe_0_2_mul_ready;
logic [31:0] pe_0_2_out;
logic pe_0_2_go;
logic pe_0_2_clk;
logic pe_0_2_reset;
logic pe_0_2_done;
logic [31:0] top_0_2_in;
logic top_0_2_write_en;
logic top_0_2_clk;
logic top_0_2_reset;
logic [31:0] top_0_2_out;
logic top_0_2_done;
logic [31:0] left_0_2_in;
logic left_0_2_write_en;
logic left_0_2_clk;
logic left_0_2_reset;
logic [31:0] left_0_2_out;
logic left_0_2_done;
logic [31:0] pe_0_3_top;
logic [31:0] pe_0_3_left;
logic pe_0_3_mul_ready;
logic [31:0] pe_0_3_out;
logic pe_0_3_go;
logic pe_0_3_clk;
logic pe_0_3_reset;
logic pe_0_3_done;
logic [31:0] top_0_3_in;
logic top_0_3_write_en;
logic top_0_3_clk;
logic top_0_3_reset;
logic [31:0] top_0_3_out;
logic top_0_3_done;
logic [31:0] left_0_3_in;
logic left_0_3_write_en;
logic left_0_3_clk;
logic left_0_3_reset;
logic [31:0] left_0_3_out;
logic left_0_3_done;
logic [31:0] pe_1_0_top;
logic [31:0] pe_1_0_left;
logic pe_1_0_mul_ready;
logic [31:0] pe_1_0_out;
logic pe_1_0_go;
logic pe_1_0_clk;
logic pe_1_0_reset;
logic pe_1_0_done;
logic [31:0] top_1_0_in;
logic top_1_0_write_en;
logic top_1_0_clk;
logic top_1_0_reset;
logic [31:0] top_1_0_out;
logic top_1_0_done;
logic [31:0] left_1_0_in;
logic left_1_0_write_en;
logic left_1_0_clk;
logic left_1_0_reset;
logic [31:0] left_1_0_out;
logic left_1_0_done;
logic [31:0] pe_1_1_top;
logic [31:0] pe_1_1_left;
logic pe_1_1_mul_ready;
logic [31:0] pe_1_1_out;
logic pe_1_1_go;
logic pe_1_1_clk;
logic pe_1_1_reset;
logic pe_1_1_done;
logic [31:0] top_1_1_in;
logic top_1_1_write_en;
logic top_1_1_clk;
logic top_1_1_reset;
logic [31:0] top_1_1_out;
logic top_1_1_done;
logic [31:0] left_1_1_in;
logic left_1_1_write_en;
logic left_1_1_clk;
logic left_1_1_reset;
logic [31:0] left_1_1_out;
logic left_1_1_done;
logic [31:0] pe_1_2_top;
logic [31:0] pe_1_2_left;
logic pe_1_2_mul_ready;
logic [31:0] pe_1_2_out;
logic pe_1_2_go;
logic pe_1_2_clk;
logic pe_1_2_reset;
logic pe_1_2_done;
logic [31:0] top_1_2_in;
logic top_1_2_write_en;
logic top_1_2_clk;
logic top_1_2_reset;
logic [31:0] top_1_2_out;
logic top_1_2_done;
logic [31:0] left_1_2_in;
logic left_1_2_write_en;
logic left_1_2_clk;
logic left_1_2_reset;
logic [31:0] left_1_2_out;
logic left_1_2_done;
logic [31:0] pe_1_3_top;
logic [31:0] pe_1_3_left;
logic pe_1_3_mul_ready;
logic [31:0] pe_1_3_out;
logic pe_1_3_go;
logic pe_1_3_clk;
logic pe_1_3_reset;
logic pe_1_3_done;
logic [31:0] top_1_3_in;
logic top_1_3_write_en;
logic top_1_3_clk;
logic top_1_3_reset;
logic [31:0] top_1_3_out;
logic top_1_3_done;
logic [31:0] left_1_3_in;
logic left_1_3_write_en;
logic left_1_3_clk;
logic left_1_3_reset;
logic [31:0] left_1_3_out;
logic left_1_3_done;
logic [31:0] pe_2_0_top;
logic [31:0] pe_2_0_left;
logic pe_2_0_mul_ready;
logic [31:0] pe_2_0_out;
logic pe_2_0_go;
logic pe_2_0_clk;
logic pe_2_0_reset;
logic pe_2_0_done;
logic [31:0] top_2_0_in;
logic top_2_0_write_en;
logic top_2_0_clk;
logic top_2_0_reset;
logic [31:0] top_2_0_out;
logic top_2_0_done;
logic [31:0] left_2_0_in;
logic left_2_0_write_en;
logic left_2_0_clk;
logic left_2_0_reset;
logic [31:0] left_2_0_out;
logic left_2_0_done;
logic [31:0] pe_2_1_top;
logic [31:0] pe_2_1_left;
logic pe_2_1_mul_ready;
logic [31:0] pe_2_1_out;
logic pe_2_1_go;
logic pe_2_1_clk;
logic pe_2_1_reset;
logic pe_2_1_done;
logic [31:0] top_2_1_in;
logic top_2_1_write_en;
logic top_2_1_clk;
logic top_2_1_reset;
logic [31:0] top_2_1_out;
logic top_2_1_done;
logic [31:0] left_2_1_in;
logic left_2_1_write_en;
logic left_2_1_clk;
logic left_2_1_reset;
logic [31:0] left_2_1_out;
logic left_2_1_done;
logic [31:0] pe_2_2_top;
logic [31:0] pe_2_2_left;
logic pe_2_2_mul_ready;
logic [31:0] pe_2_2_out;
logic pe_2_2_go;
logic pe_2_2_clk;
logic pe_2_2_reset;
logic pe_2_2_done;
logic [31:0] top_2_2_in;
logic top_2_2_write_en;
logic top_2_2_clk;
logic top_2_2_reset;
logic [31:0] top_2_2_out;
logic top_2_2_done;
logic [31:0] left_2_2_in;
logic left_2_2_write_en;
logic left_2_2_clk;
logic left_2_2_reset;
logic [31:0] left_2_2_out;
logic left_2_2_done;
logic [31:0] pe_2_3_top;
logic [31:0] pe_2_3_left;
logic pe_2_3_mul_ready;
logic [31:0] pe_2_3_out;
logic pe_2_3_go;
logic pe_2_3_clk;
logic pe_2_3_reset;
logic pe_2_3_done;
logic [31:0] top_2_3_in;
logic top_2_3_write_en;
logic top_2_3_clk;
logic top_2_3_reset;
logic [31:0] top_2_3_out;
logic top_2_3_done;
logic [31:0] left_2_3_in;
logic left_2_3_write_en;
logic left_2_3_clk;
logic left_2_3_reset;
logic [31:0] left_2_3_out;
logic left_2_3_done;
logic [31:0] pe_3_0_top;
logic [31:0] pe_3_0_left;
logic pe_3_0_mul_ready;
logic [31:0] pe_3_0_out;
logic pe_3_0_go;
logic pe_3_0_clk;
logic pe_3_0_reset;
logic pe_3_0_done;
logic [31:0] top_3_0_in;
logic top_3_0_write_en;
logic top_3_0_clk;
logic top_3_0_reset;
logic [31:0] top_3_0_out;
logic top_3_0_done;
logic [31:0] left_3_0_in;
logic left_3_0_write_en;
logic left_3_0_clk;
logic left_3_0_reset;
logic [31:0] left_3_0_out;
logic left_3_0_done;
logic [31:0] pe_3_1_top;
logic [31:0] pe_3_1_left;
logic pe_3_1_mul_ready;
logic [31:0] pe_3_1_out;
logic pe_3_1_go;
logic pe_3_1_clk;
logic pe_3_1_reset;
logic pe_3_1_done;
logic [31:0] top_3_1_in;
logic top_3_1_write_en;
logic top_3_1_clk;
logic top_3_1_reset;
logic [31:0] top_3_1_out;
logic top_3_1_done;
logic [31:0] left_3_1_in;
logic left_3_1_write_en;
logic left_3_1_clk;
logic left_3_1_reset;
logic [31:0] left_3_1_out;
logic left_3_1_done;
logic [31:0] pe_3_2_top;
logic [31:0] pe_3_2_left;
logic pe_3_2_mul_ready;
logic [31:0] pe_3_2_out;
logic pe_3_2_go;
logic pe_3_2_clk;
logic pe_3_2_reset;
logic pe_3_2_done;
logic [31:0] top_3_2_in;
logic top_3_2_write_en;
logic top_3_2_clk;
logic top_3_2_reset;
logic [31:0] top_3_2_out;
logic top_3_2_done;
logic [31:0] left_3_2_in;
logic left_3_2_write_en;
logic left_3_2_clk;
logic left_3_2_reset;
logic [31:0] left_3_2_out;
logic left_3_2_done;
logic [31:0] pe_3_3_top;
logic [31:0] pe_3_3_left;
logic pe_3_3_mul_ready;
logic [31:0] pe_3_3_out;
logic pe_3_3_go;
logic pe_3_3_clk;
logic pe_3_3_reset;
logic pe_3_3_done;
logic [31:0] top_3_3_in;
logic top_3_3_write_en;
logic top_3_3_clk;
logic top_3_3_reset;
logic [31:0] top_3_3_out;
logic top_3_3_done;
logic [31:0] left_3_3_in;
logic left_3_3_write_en;
logic left_3_3_clk;
logic left_3_3_reset;
logic [31:0] left_3_3_out;
logic left_3_3_done;
logic [31:0] idx_minus_0_left;
logic [31:0] idx_minus_0_right;
logic [31:0] idx_minus_0_out;
logic [31:0] idx_minus_0_res_in;
logic [2:0] idx_minus_0_res_out;
logic [31:0] idx_minus_1_left;
logic [31:0] idx_minus_1_right;
logic [31:0] idx_minus_1_out;
logic [31:0] idx_minus_1_res_in;
logic [2:0] idx_minus_1_res_out;
logic [31:0] idx_minus_2_left;
logic [31:0] idx_minus_2_right;
logic [31:0] idx_minus_2_out;
logic [31:0] idx_minus_2_res_in;
logic [2:0] idx_minus_2_res_out;
logic [31:0] idx_minus_3_left;
logic [31:0] idx_minus_3_right;
logic [31:0] idx_minus_3_out;
logic [31:0] idx_minus_3_res_in;
logic [2:0] idx_minus_3_res_out;
logic fsm_in;
logic fsm_write_en;
logic fsm_clk;
logic fsm_reset;
logic fsm_out;
logic fsm_done;
logic ud_out;
logic adder_left;
logic adder_right;
logic adder_out;
logic ud0_out;
logic adder0_left;
logic adder0_right;
logic adder0_out;
logic signal_reg_in;
logic signal_reg_write_en;
logic signal_reg_clk;
logic signal_reg_reset;
logic signal_reg_out;
logic signal_reg_done;
logic [1:0] fsm0_in;
logic fsm0_write_en;
logic fsm0_clk;
logic fsm0_reset;
logic [1:0] fsm0_out;
logic fsm0_done;
logic early_reset_static_par_go_in;
logic early_reset_static_par_go_out;
logic early_reset_static_par_done_in;
logic early_reset_static_par_done_out;
logic early_reset_static_par0_go_in;
logic early_reset_static_par0_go_out;
logic early_reset_static_par0_done_in;
logic early_reset_static_par0_done_out;
logic wrapper_early_reset_static_par_go_in;
logic wrapper_early_reset_static_par_go_out;
logic wrapper_early_reset_static_par_done_in;
logic wrapper_early_reset_static_par_done_out;
logic while_wrapper_early_reset_static_par0_go_in;
logic while_wrapper_early_reset_static_par0_go_out;
logic while_wrapper_early_reset_static_par0_done_in;
logic while_wrapper_early_reset_static_par0_done_out;
logic tdcc_go_in;
logic tdcc_go_out;
logic tdcc_done_in;
logic tdcc_done_out;
std_reg # (
    .WIDTH(32)
) iter_limit (
    .clk(iter_limit_clk),
    .done(iter_limit_done),
    .in(iter_limit_in),
    .out(iter_limit_out),
    .reset(iter_limit_reset),
    .write_en(iter_limit_write_en)
);
std_add # (
    .WIDTH(32)
) iter_limit_add (
    .left(iter_limit_add_left),
    .out(iter_limit_add_out),
    .right(iter_limit_add_right)
);
std_reg # (
    .WIDTH(32)
) idx (
    .clk(idx_clk),
    .done(idx_done),
    .in(idx_in),
    .out(idx_out),
    .reset(idx_reset),
    .write_en(idx_write_en)
);
std_lt # (
    .WIDTH(32)
) lt_iter_limit (
    .left(lt_iter_limit_left),
    .out(lt_iter_limit_out),
    .right(lt_iter_limit_right)
);
std_add # (
    .WIDTH(32)
) depth_plus_0 (
    .left(depth_plus_0_left),
    .out(depth_plus_0_out),
    .right(depth_plus_0_right)
);
std_add # (
    .WIDTH(32)
) depth_plus_1 (
    .left(depth_plus_1_left),
    .out(depth_plus_1_out),
    .right(depth_plus_1_right)
);
std_add # (
    .WIDTH(32)
) depth_plus_2 (
    .left(depth_plus_2_left),
    .out(depth_plus_2_out),
    .right(depth_plus_2_right)
);
std_add # (
    .WIDTH(32)
) depth_plus_3 (
    .left(depth_plus_3_left),
    .out(depth_plus_3_out),
    .right(depth_plus_3_right)
);
std_add # (
    .WIDTH(32)
) depth_plus_5 (
    .left(depth_plus_5_left),
    .out(depth_plus_5_out),
    .right(depth_plus_5_right)
);
std_add # (
    .WIDTH(32)
) depth_plus_6 (
    .left(depth_plus_6_left),
    .out(depth_plus_6_out),
    .right(depth_plus_6_right)
);
std_add # (
    .WIDTH(32)
) depth_plus_7 (
    .left(depth_plus_7_left),
    .out(depth_plus_7_out),
    .right(depth_plus_7_right)
);
std_add # (
    .WIDTH(32)
) depth_plus_8 (
    .left(depth_plus_8_left),
    .out(depth_plus_8_out),
    .right(depth_plus_8_right)
);
std_add # (
    .WIDTH(32)
) depth_plus_9 (
    .left(depth_plus_9_left),
    .out(depth_plus_9_out),
    .right(depth_plus_9_right)
);
std_add # (
    .WIDTH(32)
) depth_plus_10 (
    .left(depth_plus_10_left),
    .out(depth_plus_10_out),
    .right(depth_plus_10_right)
);
std_add # (
    .WIDTH(32)
) depth_plus_11 (
    .left(depth_plus_11_left),
    .out(depth_plus_11_out),
    .right(depth_plus_11_right)
);
std_eq # (
    .WIDTH(32)
) index_eq_depth_plus_5 (
    .left(index_eq_depth_plus_5_left),
    .out(index_eq_depth_plus_5_out),
    .right(index_eq_depth_plus_5_right)
);
std_eq # (
    .WIDTH(32)
) index_eq_depth_plus_6 (
    .left(index_eq_depth_plus_6_left),
    .out(index_eq_depth_plus_6_out),
    .right(index_eq_depth_plus_6_right)
);
std_eq # (
    .WIDTH(32)
) index_eq_depth_plus_7 (
    .left(index_eq_depth_plus_7_left),
    .out(index_eq_depth_plus_7_out),
    .right(index_eq_depth_plus_7_right)
);
std_eq # (
    .WIDTH(32)
) index_eq_depth_plus_8 (
    .left(index_eq_depth_plus_8_left),
    .out(index_eq_depth_plus_8_out),
    .right(index_eq_depth_plus_8_right)
);
std_eq # (
    .WIDTH(32)
) index_eq_depth_plus_9 (
    .left(index_eq_depth_plus_9_left),
    .out(index_eq_depth_plus_9_out),
    .right(index_eq_depth_plus_9_right)
);
std_eq # (
    .WIDTH(32)
) index_eq_depth_plus_10 (
    .left(index_eq_depth_plus_10_left),
    .out(index_eq_depth_plus_10_out),
    .right(index_eq_depth_plus_10_right)
);
std_eq # (
    .WIDTH(32)
) index_eq_depth_plus_11 (
    .left(index_eq_depth_plus_11_left),
    .out(index_eq_depth_plus_11_out),
    .right(index_eq_depth_plus_11_right)
);
std_ge # (
    .WIDTH(32)
) index_ge_1 (
    .left(index_ge_1_left),
    .out(index_ge_1_out),
    .right(index_ge_1_right)
);
std_ge # (
    .WIDTH(32)
) index_ge_2 (
    .left(index_ge_2_left),
    .out(index_ge_2_out),
    .right(index_ge_2_right)
);
std_ge # (
    .WIDTH(32)
) index_ge_3 (
    .left(index_ge_3_left),
    .out(index_ge_3_out),
    .right(index_ge_3_right)
);
std_ge # (
    .WIDTH(32)
) index_ge_4 (
    .left(index_ge_4_left),
    .out(index_ge_4_out),
    .right(index_ge_4_right)
);
std_ge # (
    .WIDTH(32)
) index_ge_5 (
    .left(index_ge_5_left),
    .out(index_ge_5_out),
    .right(index_ge_5_right)
);
std_ge # (
    .WIDTH(32)
) index_ge_6 (
    .left(index_ge_6_left),
    .out(index_ge_6_out),
    .right(index_ge_6_right)
);
std_ge # (
    .WIDTH(32)
) index_ge_7 (
    .left(index_ge_7_left),
    .out(index_ge_7_out),
    .right(index_ge_7_right)
);
std_ge # (
    .WIDTH(32)
) index_ge_8 (
    .left(index_ge_8_left),
    .out(index_ge_8_out),
    .right(index_ge_8_right)
);
std_ge # (
    .WIDTH(32)
) index_ge_9 (
    .left(index_ge_9_left),
    .out(index_ge_9_out),
    .right(index_ge_9_right)
);
std_ge # (
    .WIDTH(32)
) index_ge_10 (
    .left(index_ge_10_left),
    .out(index_ge_10_out),
    .right(index_ge_10_right)
);
std_ge # (
    .WIDTH(32)
) index_ge_11 (
    .left(index_ge_11_left),
    .out(index_ge_11_out),
    .right(index_ge_11_right)
);
std_lt # (
    .WIDTH(32)
) index_lt_depth_plus_0 (
    .left(index_lt_depth_plus_0_left),
    .out(index_lt_depth_plus_0_out),
    .right(index_lt_depth_plus_0_right)
);
std_lt # (
    .WIDTH(32)
) index_lt_depth_plus_1 (
    .left(index_lt_depth_plus_1_left),
    .out(index_lt_depth_plus_1_out),
    .right(index_lt_depth_plus_1_right)
);
std_lt # (
    .WIDTH(32)
) index_lt_depth_plus_2 (
    .left(index_lt_depth_plus_2_left),
    .out(index_lt_depth_plus_2_out),
    .right(index_lt_depth_plus_2_right)
);
std_lt # (
    .WIDTH(32)
) index_lt_depth_plus_3 (
    .left(index_lt_depth_plus_3_left),
    .out(index_lt_depth_plus_3_out),
    .right(index_lt_depth_plus_3_right)
);
std_lt # (
    .WIDTH(32)
) index_lt_depth_plus_5 (
    .left(index_lt_depth_plus_5_left),
    .out(index_lt_depth_plus_5_out),
    .right(index_lt_depth_plus_5_right)
);
std_lt # (
    .WIDTH(32)
) index_lt_depth_plus_6 (
    .left(index_lt_depth_plus_6_left),
    .out(index_lt_depth_plus_6_out),
    .right(index_lt_depth_plus_6_right)
);
std_lt # (
    .WIDTH(32)
) index_lt_depth_plus_7 (
    .left(index_lt_depth_plus_7_left),
    .out(index_lt_depth_plus_7_out),
    .right(index_lt_depth_plus_7_right)
);
std_lt # (
    .WIDTH(32)
) index_lt_depth_plus_8 (
    .left(index_lt_depth_plus_8_left),
    .out(index_lt_depth_plus_8_out),
    .right(index_lt_depth_plus_8_right)
);
std_lt # (
    .WIDTH(32)
) index_lt_depth_plus_9 (
    .left(index_lt_depth_plus_9_left),
    .out(index_lt_depth_plus_9_out),
    .right(index_lt_depth_plus_9_right)
);
std_lt # (
    .WIDTH(32)
) index_lt_depth_plus_10 (
    .left(index_lt_depth_plus_10_left),
    .out(index_lt_depth_plus_10_out),
    .right(index_lt_depth_plus_10_right)
);
std_lt # (
    .WIDTH(32)
) index_lt_depth_plus_11 (
    .left(index_lt_depth_plus_11_left),
    .out(index_lt_depth_plus_11_out),
    .right(index_lt_depth_plus_11_right)
);
std_and # (
    .WIDTH(1)
) idx_between_1_depth_plus_1_comb (
    .left(idx_between_1_depth_plus_1_comb_left),
    .out(idx_between_1_depth_plus_1_comb_out),
    .right(idx_between_1_depth_plus_1_comb_right)
);
std_and # (
    .WIDTH(1)
) idx_between_2_depth_plus_2_comb (
    .left(idx_between_2_depth_plus_2_comb_left),
    .out(idx_between_2_depth_plus_2_comb_out),
    .right(idx_between_2_depth_plus_2_comb_right)
);
std_and # (
    .WIDTH(1)
) idx_between_3_depth_plus_3_comb (
    .left(idx_between_3_depth_plus_3_comb_left),
    .out(idx_between_3_depth_plus_3_comb_out),
    .right(idx_between_3_depth_plus_3_comb_right)
);
std_and # (
    .WIDTH(1)
) idx_between_1_depth_plus_5_comb (
    .left(idx_between_1_depth_plus_5_comb_left),
    .out(idx_between_1_depth_plus_5_comb_out),
    .right(idx_between_1_depth_plus_5_comb_right)
);
std_and # (
    .WIDTH(1)
) idx_between_2_depth_plus_6_comb (
    .left(idx_between_2_depth_plus_6_comb_left),
    .out(idx_between_2_depth_plus_6_comb_out),
    .right(idx_between_2_depth_plus_6_comb_right)
);
std_and # (
    .WIDTH(1)
) idx_between_3_depth_plus_7_comb (
    .left(idx_between_3_depth_plus_7_comb_left),
    .out(idx_between_3_depth_plus_7_comb_out),
    .right(idx_between_3_depth_plus_7_comb_right)
);
std_and # (
    .WIDTH(1)
) idx_between_4_depth_plus_8_comb (
    .left(idx_between_4_depth_plus_8_comb_left),
    .out(idx_between_4_depth_plus_8_comb_out),
    .right(idx_between_4_depth_plus_8_comb_right)
);
std_and # (
    .WIDTH(1)
) idx_between_5_depth_plus_9_comb (
    .left(idx_between_5_depth_plus_9_comb_left),
    .out(idx_between_5_depth_plus_9_comb_out),
    .right(idx_between_5_depth_plus_9_comb_right)
);
std_and # (
    .WIDTH(1)
) idx_between_6_depth_plus_10_comb (
    .left(idx_between_6_depth_plus_10_comb_left),
    .out(idx_between_6_depth_plus_10_comb_out),
    .right(idx_between_6_depth_plus_10_comb_right)
);
std_and # (
    .WIDTH(1)
) idx_between_7_depth_plus_11_comb (
    .left(idx_between_7_depth_plus_11_comb_left),
    .out(idx_between_7_depth_plus_11_comb_out),
    .right(idx_between_7_depth_plus_11_comb_right)
);
mac_pe pe_0_0 (
    .clk(pe_0_0_clk),
    .done(pe_0_0_done),
    .go(pe_0_0_go),
    .left(pe_0_0_left),
    .mul_ready(pe_0_0_mul_ready),
    .out(pe_0_0_out),
    .reset(pe_0_0_reset),
    .top(pe_0_0_top)
);
std_reg # (
    .WIDTH(32)
) top_0_0 (
    .clk(top_0_0_clk),
    .done(top_0_0_done),
    .in(top_0_0_in),
    .out(top_0_0_out),
    .reset(top_0_0_reset),
    .write_en(top_0_0_write_en)
);
std_reg # (
    .WIDTH(32)
) left_0_0 (
    .clk(left_0_0_clk),
    .done(left_0_0_done),
    .in(left_0_0_in),
    .out(left_0_0_out),
    .reset(left_0_0_reset),
    .write_en(left_0_0_write_en)
);
mac_pe pe_0_1 (
    .clk(pe_0_1_clk),
    .done(pe_0_1_done),
    .go(pe_0_1_go),
    .left(pe_0_1_left),
    .mul_ready(pe_0_1_mul_ready),
    .out(pe_0_1_out),
    .reset(pe_0_1_reset),
    .top(pe_0_1_top)
);
std_reg # (
    .WIDTH(32)
) top_0_1 (
    .clk(top_0_1_clk),
    .done(top_0_1_done),
    .in(top_0_1_in),
    .out(top_0_1_out),
    .reset(top_0_1_reset),
    .write_en(top_0_1_write_en)
);
std_reg # (
    .WIDTH(32)
) left_0_1 (
    .clk(left_0_1_clk),
    .done(left_0_1_done),
    .in(left_0_1_in),
    .out(left_0_1_out),
    .reset(left_0_1_reset),
    .write_en(left_0_1_write_en)
);
mac_pe pe_0_2 (
    .clk(pe_0_2_clk),
    .done(pe_0_2_done),
    .go(pe_0_2_go),
    .left(pe_0_2_left),
    .mul_ready(pe_0_2_mul_ready),
    .out(pe_0_2_out),
    .reset(pe_0_2_reset),
    .top(pe_0_2_top)
);
std_reg # (
    .WIDTH(32)
) top_0_2 (
    .clk(top_0_2_clk),
    .done(top_0_2_done),
    .in(top_0_2_in),
    .out(top_0_2_out),
    .reset(top_0_2_reset),
    .write_en(top_0_2_write_en)
);
std_reg # (
    .WIDTH(32)
) left_0_2 (
    .clk(left_0_2_clk),
    .done(left_0_2_done),
    .in(left_0_2_in),
    .out(left_0_2_out),
    .reset(left_0_2_reset),
    .write_en(left_0_2_write_en)
);
mac_pe pe_0_3 (
    .clk(pe_0_3_clk),
    .done(pe_0_3_done),
    .go(pe_0_3_go),
    .left(pe_0_3_left),
    .mul_ready(pe_0_3_mul_ready),
    .out(pe_0_3_out),
    .reset(pe_0_3_reset),
    .top(pe_0_3_top)
);
std_reg # (
    .WIDTH(32)
) top_0_3 (
    .clk(top_0_3_clk),
    .done(top_0_3_done),
    .in(top_0_3_in),
    .out(top_0_3_out),
    .reset(top_0_3_reset),
    .write_en(top_0_3_write_en)
);
std_reg # (
    .WIDTH(32)
) left_0_3 (
    .clk(left_0_3_clk),
    .done(left_0_3_done),
    .in(left_0_3_in),
    .out(left_0_3_out),
    .reset(left_0_3_reset),
    .write_en(left_0_3_write_en)
);
mac_pe pe_1_0 (
    .clk(pe_1_0_clk),
    .done(pe_1_0_done),
    .go(pe_1_0_go),
    .left(pe_1_0_left),
    .mul_ready(pe_1_0_mul_ready),
    .out(pe_1_0_out),
    .reset(pe_1_0_reset),
    .top(pe_1_0_top)
);
std_reg # (
    .WIDTH(32)
) top_1_0 (
    .clk(top_1_0_clk),
    .done(top_1_0_done),
    .in(top_1_0_in),
    .out(top_1_0_out),
    .reset(top_1_0_reset),
    .write_en(top_1_0_write_en)
);
std_reg # (
    .WIDTH(32)
) left_1_0 (
    .clk(left_1_0_clk),
    .done(left_1_0_done),
    .in(left_1_0_in),
    .out(left_1_0_out),
    .reset(left_1_0_reset),
    .write_en(left_1_0_write_en)
);
mac_pe pe_1_1 (
    .clk(pe_1_1_clk),
    .done(pe_1_1_done),
    .go(pe_1_1_go),
    .left(pe_1_1_left),
    .mul_ready(pe_1_1_mul_ready),
    .out(pe_1_1_out),
    .reset(pe_1_1_reset),
    .top(pe_1_1_top)
);
std_reg # (
    .WIDTH(32)
) top_1_1 (
    .clk(top_1_1_clk),
    .done(top_1_1_done),
    .in(top_1_1_in),
    .out(top_1_1_out),
    .reset(top_1_1_reset),
    .write_en(top_1_1_write_en)
);
std_reg # (
    .WIDTH(32)
) left_1_1 (
    .clk(left_1_1_clk),
    .done(left_1_1_done),
    .in(left_1_1_in),
    .out(left_1_1_out),
    .reset(left_1_1_reset),
    .write_en(left_1_1_write_en)
);
mac_pe pe_1_2 (
    .clk(pe_1_2_clk),
    .done(pe_1_2_done),
    .go(pe_1_2_go),
    .left(pe_1_2_left),
    .mul_ready(pe_1_2_mul_ready),
    .out(pe_1_2_out),
    .reset(pe_1_2_reset),
    .top(pe_1_2_top)
);
std_reg # (
    .WIDTH(32)
) top_1_2 (
    .clk(top_1_2_clk),
    .done(top_1_2_done),
    .in(top_1_2_in),
    .out(top_1_2_out),
    .reset(top_1_2_reset),
    .write_en(top_1_2_write_en)
);
std_reg # (
    .WIDTH(32)
) left_1_2 (
    .clk(left_1_2_clk),
    .done(left_1_2_done),
    .in(left_1_2_in),
    .out(left_1_2_out),
    .reset(left_1_2_reset),
    .write_en(left_1_2_write_en)
);
mac_pe pe_1_3 (
    .clk(pe_1_3_clk),
    .done(pe_1_3_done),
    .go(pe_1_3_go),
    .left(pe_1_3_left),
    .mul_ready(pe_1_3_mul_ready),
    .out(pe_1_3_out),
    .reset(pe_1_3_reset),
    .top(pe_1_3_top)
);
std_reg # (
    .WIDTH(32)
) top_1_3 (
    .clk(top_1_3_clk),
    .done(top_1_3_done),
    .in(top_1_3_in),
    .out(top_1_3_out),
    .reset(top_1_3_reset),
    .write_en(top_1_3_write_en)
);
std_reg # (
    .WIDTH(32)
) left_1_3 (
    .clk(left_1_3_clk),
    .done(left_1_3_done),
    .in(left_1_3_in),
    .out(left_1_3_out),
    .reset(left_1_3_reset),
    .write_en(left_1_3_write_en)
);
mac_pe pe_2_0 (
    .clk(pe_2_0_clk),
    .done(pe_2_0_done),
    .go(pe_2_0_go),
    .left(pe_2_0_left),
    .mul_ready(pe_2_0_mul_ready),
    .out(pe_2_0_out),
    .reset(pe_2_0_reset),
    .top(pe_2_0_top)
);
std_reg # (
    .WIDTH(32)
) top_2_0 (
    .clk(top_2_0_clk),
    .done(top_2_0_done),
    .in(top_2_0_in),
    .out(top_2_0_out),
    .reset(top_2_0_reset),
    .write_en(top_2_0_write_en)
);
std_reg # (
    .WIDTH(32)
) left_2_0 (
    .clk(left_2_0_clk),
    .done(left_2_0_done),
    .in(left_2_0_in),
    .out(left_2_0_out),
    .reset(left_2_0_reset),
    .write_en(left_2_0_write_en)
);
mac_pe pe_2_1 (
    .clk(pe_2_1_clk),
    .done(pe_2_1_done),
    .go(pe_2_1_go),
    .left(pe_2_1_left),
    .mul_ready(pe_2_1_mul_ready),
    .out(pe_2_1_out),
    .reset(pe_2_1_reset),
    .top(pe_2_1_top)
);
std_reg # (
    .WIDTH(32)
) top_2_1 (
    .clk(top_2_1_clk),
    .done(top_2_1_done),
    .in(top_2_1_in),
    .out(top_2_1_out),
    .reset(top_2_1_reset),
    .write_en(top_2_1_write_en)
);
std_reg # (
    .WIDTH(32)
) left_2_1 (
    .clk(left_2_1_clk),
    .done(left_2_1_done),
    .in(left_2_1_in),
    .out(left_2_1_out),
    .reset(left_2_1_reset),
    .write_en(left_2_1_write_en)
);
mac_pe pe_2_2 (
    .clk(pe_2_2_clk),
    .done(pe_2_2_done),
    .go(pe_2_2_go),
    .left(pe_2_2_left),
    .mul_ready(pe_2_2_mul_ready),
    .out(pe_2_2_out),
    .reset(pe_2_2_reset),
    .top(pe_2_2_top)
);
std_reg # (
    .WIDTH(32)
) top_2_2 (
    .clk(top_2_2_clk),
    .done(top_2_2_done),
    .in(top_2_2_in),
    .out(top_2_2_out),
    .reset(top_2_2_reset),
    .write_en(top_2_2_write_en)
);
std_reg # (
    .WIDTH(32)
) left_2_2 (
    .clk(left_2_2_clk),
    .done(left_2_2_done),
    .in(left_2_2_in),
    .out(left_2_2_out),
    .reset(left_2_2_reset),
    .write_en(left_2_2_write_en)
);
mac_pe pe_2_3 (
    .clk(pe_2_3_clk),
    .done(pe_2_3_done),
    .go(pe_2_3_go),
    .left(pe_2_3_left),
    .mul_ready(pe_2_3_mul_ready),
    .out(pe_2_3_out),
    .reset(pe_2_3_reset),
    .top(pe_2_3_top)
);
std_reg # (
    .WIDTH(32)
) top_2_3 (
    .clk(top_2_3_clk),
    .done(top_2_3_done),
    .in(top_2_3_in),
    .out(top_2_3_out),
    .reset(top_2_3_reset),
    .write_en(top_2_3_write_en)
);
std_reg # (
    .WIDTH(32)
) left_2_3 (
    .clk(left_2_3_clk),
    .done(left_2_3_done),
    .in(left_2_3_in),
    .out(left_2_3_out),
    .reset(left_2_3_reset),
    .write_en(left_2_3_write_en)
);
mac_pe pe_3_0 (
    .clk(pe_3_0_clk),
    .done(pe_3_0_done),
    .go(pe_3_0_go),
    .left(pe_3_0_left),
    .mul_ready(pe_3_0_mul_ready),
    .out(pe_3_0_out),
    .reset(pe_3_0_reset),
    .top(pe_3_0_top)
);
std_reg # (
    .WIDTH(32)
) top_3_0 (
    .clk(top_3_0_clk),
    .done(top_3_0_done),
    .in(top_3_0_in),
    .out(top_3_0_out),
    .reset(top_3_0_reset),
    .write_en(top_3_0_write_en)
);
std_reg # (
    .WIDTH(32)
) left_3_0 (
    .clk(left_3_0_clk),
    .done(left_3_0_done),
    .in(left_3_0_in),
    .out(left_3_0_out),
    .reset(left_3_0_reset),
    .write_en(left_3_0_write_en)
);
mac_pe pe_3_1 (
    .clk(pe_3_1_clk),
    .done(pe_3_1_done),
    .go(pe_3_1_go),
    .left(pe_3_1_left),
    .mul_ready(pe_3_1_mul_ready),
    .out(pe_3_1_out),
    .reset(pe_3_1_reset),
    .top(pe_3_1_top)
);
std_reg # (
    .WIDTH(32)
) top_3_1 (
    .clk(top_3_1_clk),
    .done(top_3_1_done),
    .in(top_3_1_in),
    .out(top_3_1_out),
    .reset(top_3_1_reset),
    .write_en(top_3_1_write_en)
);
std_reg # (
    .WIDTH(32)
) left_3_1 (
    .clk(left_3_1_clk),
    .done(left_3_1_done),
    .in(left_3_1_in),
    .out(left_3_1_out),
    .reset(left_3_1_reset),
    .write_en(left_3_1_write_en)
);
mac_pe pe_3_2 (
    .clk(pe_3_2_clk),
    .done(pe_3_2_done),
    .go(pe_3_2_go),
    .left(pe_3_2_left),
    .mul_ready(pe_3_2_mul_ready),
    .out(pe_3_2_out),
    .reset(pe_3_2_reset),
    .top(pe_3_2_top)
);
std_reg # (
    .WIDTH(32)
) top_3_2 (
    .clk(top_3_2_clk),
    .done(top_3_2_done),
    .in(top_3_2_in),
    .out(top_3_2_out),
    .reset(top_3_2_reset),
    .write_en(top_3_2_write_en)
);
std_reg # (
    .WIDTH(32)
) left_3_2 (
    .clk(left_3_2_clk),
    .done(left_3_2_done),
    .in(left_3_2_in),
    .out(left_3_2_out),
    .reset(left_3_2_reset),
    .write_en(left_3_2_write_en)
);
mac_pe pe_3_3 (
    .clk(pe_3_3_clk),
    .done(pe_3_3_done),
    .go(pe_3_3_go),
    .left(pe_3_3_left),
    .mul_ready(pe_3_3_mul_ready),
    .out(pe_3_3_out),
    .reset(pe_3_3_reset),
    .top(pe_3_3_top)
);
std_reg # (
    .WIDTH(32)
) top_3_3 (
    .clk(top_3_3_clk),
    .done(top_3_3_done),
    .in(top_3_3_in),
    .out(top_3_3_out),
    .reset(top_3_3_reset),
    .write_en(top_3_3_write_en)
);
std_reg # (
    .WIDTH(32)
) left_3_3 (
    .clk(left_3_3_clk),
    .done(left_3_3_done),
    .in(left_3_3_in),
    .out(left_3_3_out),
    .reset(left_3_3_reset),
    .write_en(left_3_3_write_en)
);
std_sub # (
    .WIDTH(32)
) idx_minus_0 (
    .left(idx_minus_0_left),
    .out(idx_minus_0_out),
    .right(idx_minus_0_right)
);
std_slice # (
    .IN_WIDTH(32),
    .OUT_WIDTH(3)
) idx_minus_0_res (
    .in(idx_minus_0_res_in),
    .out(idx_minus_0_res_out)
);
std_sub # (
    .WIDTH(32)
) idx_minus_1 (
    .left(idx_minus_1_left),
    .out(idx_minus_1_out),
    .right(idx_minus_1_right)
);
std_slice # (
    .IN_WIDTH(32),
    .OUT_WIDTH(3)
) idx_minus_1_res (
    .in(idx_minus_1_res_in),
    .out(idx_minus_1_res_out)
);
std_sub # (
    .WIDTH(32)
) idx_minus_2 (
    .left(idx_minus_2_left),
    .out(idx_minus_2_out),
    .right(idx_minus_2_right)
);
std_slice # (
    .IN_WIDTH(32),
    .OUT_WIDTH(3)
) idx_minus_2_res (
    .in(idx_minus_2_res_in),
    .out(idx_minus_2_res_out)
);
std_sub # (
    .WIDTH(32)
) idx_minus_3 (
    .left(idx_minus_3_left),
    .out(idx_minus_3_out),
    .right(idx_minus_3_right)
);
std_slice # (
    .IN_WIDTH(32),
    .OUT_WIDTH(3)
) idx_minus_3_res (
    .in(idx_minus_3_res_in),
    .out(idx_minus_3_res_out)
);
std_reg # (
    .WIDTH(1)
) fsm (
    .clk(fsm_clk),
    .done(fsm_done),
    .in(fsm_in),
    .out(fsm_out),
    .reset(fsm_reset),
    .write_en(fsm_write_en)
);
undef # (
    .WIDTH(1)
) ud (
    .out(ud_out)
);
std_add # (
    .WIDTH(1)
) adder (
    .left(adder_left),
    .out(adder_out),
    .right(adder_right)
);
undef # (
    .WIDTH(1)
) ud0 (
    .out(ud0_out)
);
std_add # (
    .WIDTH(1)
) adder0 (
    .left(adder0_left),
    .out(adder0_out),
    .right(adder0_right)
);
std_reg # (
    .WIDTH(1)
) signal_reg (
    .clk(signal_reg_clk),
    .done(signal_reg_done),
    .in(signal_reg_in),
    .out(signal_reg_out),
    .reset(signal_reg_reset),
    .write_en(signal_reg_write_en)
);
std_reg # (
    .WIDTH(2)
) fsm0 (
    .clk(fsm0_clk),
    .done(fsm0_done),
    .in(fsm0_in),
    .out(fsm0_out),
    .reset(fsm0_reset),
    .write_en(fsm0_write_en)
);
std_wire # (
    .WIDTH(1)
) early_reset_static_par_go (
    .in(early_reset_static_par_go_in),
    .out(early_reset_static_par_go_out)
);
std_wire # (
    .WIDTH(1)
) early_reset_static_par_done (
    .in(early_reset_static_par_done_in),
    .out(early_reset_static_par_done_out)
);
std_wire # (
    .WIDTH(1)
) early_reset_static_par0_go (
    .in(early_reset_static_par0_go_in),
    .out(early_reset_static_par0_go_out)
);
std_wire # (
    .WIDTH(1)
) early_reset_static_par0_done (
    .in(early_reset_static_par0_done_in),
    .out(early_reset_static_par0_done_out)
);
std_wire # (
    .WIDTH(1)
) wrapper_early_reset_static_par_go (
    .in(wrapper_early_reset_static_par_go_in),
    .out(wrapper_early_reset_static_par_go_out)
);
std_wire # (
    .WIDTH(1)
) wrapper_early_reset_static_par_done (
    .in(wrapper_early_reset_static_par_done_in),
    .out(wrapper_early_reset_static_par_done_out)
);
std_wire # (
    .WIDTH(1)
) while_wrapper_early_reset_static_par0_go (
    .in(while_wrapper_early_reset_static_par0_go_in),
    .out(while_wrapper_early_reset_static_par0_go_out)
);
std_wire # (
    .WIDTH(1)
) while_wrapper_early_reset_static_par0_done (
    .in(while_wrapper_early_reset_static_par0_done_in),
    .out(while_wrapper_early_reset_static_par0_done_out)
);
std_wire # (
    .WIDTH(1)
) tdcc_go (
    .in(tdcc_go_in),
    .out(tdcc_go_out)
);
std_wire # (
    .WIDTH(1)
) tdcc_done (
    .in(tdcc_done_in),
    .out(tdcc_done_out)
);
wire _guard0 = 1;
wire _guard1 = early_reset_static_par_go_out;
wire _guard2 = early_reset_static_par_go_out;
wire _guard3 = idx_between_4_depth_plus_8_comb_out;
wire _guard4 = early_reset_static_par0_go_out;
wire _guard5 = _guard3 & _guard4;
wire _guard6 = idx_between_4_depth_plus_8_comb_out;
wire _guard7 = early_reset_static_par0_go_out;
wire _guard8 = _guard6 & _guard7;
wire _guard9 = idx_between_4_depth_plus_8_comb_out;
wire _guard10 = early_reset_static_par0_go_out;
wire _guard11 = _guard9 & _guard10;
wire _guard12 = idx_between_4_depth_plus_8_comb_out;
wire _guard13 = early_reset_static_par0_go_out;
wire _guard14 = _guard12 & _guard13;
wire _guard15 = idx_between_5_depth_plus_9_comb_out;
wire _guard16 = early_reset_static_par0_go_out;
wire _guard17 = _guard15 & _guard16;
wire _guard18 = idx_between_5_depth_plus_9_comb_out;
wire _guard19 = early_reset_static_par0_go_out;
wire _guard20 = _guard18 & _guard19;
wire _guard21 = idx_between_5_depth_plus_9_comb_out;
wire _guard22 = early_reset_static_par0_go_out;
wire _guard23 = _guard21 & _guard22;
wire _guard24 = idx_between_5_depth_plus_9_comb_out;
wire _guard25 = early_reset_static_par0_go_out;
wire _guard26 = _guard24 & _guard25;
wire _guard27 = idx_between_2_depth_plus_2_comb_out;
wire _guard28 = early_reset_static_par0_go_out;
wire _guard29 = _guard27 & _guard28;
wire _guard30 = tdcc_done_out;
wire _guard31 = index_eq_depth_plus_7_out;
wire _guard32 = index_eq_depth_plus_8_out;
wire _guard33 = _guard31 | _guard32;
wire _guard34 = index_eq_depth_plus_9_out;
wire _guard35 = _guard33 | _guard34;
wire _guard36 = index_eq_depth_plus_10_out;
wire _guard37 = _guard35 | _guard36;
wire _guard38 = early_reset_static_par0_go_out;
wire _guard39 = _guard37 & _guard38;
wire _guard40 = index_lt_depth_plus_0_out;
wire _guard41 = early_reset_static_par0_go_out;
wire _guard42 = _guard40 & _guard41;
wire _guard43 = index_eq_depth_plus_5_out;
wire _guard44 = index_eq_depth_plus_6_out;
wire _guard45 = _guard43 | _guard44;
wire _guard46 = index_eq_depth_plus_7_out;
wire _guard47 = _guard45 | _guard46;
wire _guard48 = index_eq_depth_plus_8_out;
wire _guard49 = _guard47 | _guard48;
wire _guard50 = early_reset_static_par0_go_out;
wire _guard51 = _guard49 & _guard50;
wire _guard52 = index_eq_depth_plus_10_out;
wire _guard53 = early_reset_static_par0_go_out;
wire _guard54 = _guard52 & _guard53;
wire _guard55 = index_eq_depth_plus_8_out;
wire _guard56 = early_reset_static_par0_go_out;
wire _guard57 = _guard55 & _guard56;
wire _guard58 = index_eq_depth_plus_9_out;
wire _guard59 = early_reset_static_par0_go_out;
wire _guard60 = _guard58 & _guard59;
wire _guard61 = index_eq_depth_plus_11_out;
wire _guard62 = early_reset_static_par0_go_out;
wire _guard63 = _guard61 & _guard62;
wire _guard64 = index_eq_depth_plus_10_out;
wire _guard65 = early_reset_static_par0_go_out;
wire _guard66 = _guard64 & _guard65;
wire _guard67 = index_eq_depth_plus_8_out;
wire _guard68 = early_reset_static_par0_go_out;
wire _guard69 = _guard67 & _guard68;
wire _guard70 = index_eq_depth_plus_9_out;
wire _guard71 = early_reset_static_par0_go_out;
wire _guard72 = _guard70 & _guard71;
wire _guard73 = index_eq_depth_plus_11_out;
wire _guard74 = early_reset_static_par0_go_out;
wire _guard75 = _guard73 & _guard74;
wire _guard76 = index_eq_depth_plus_6_out;
wire _guard77 = early_reset_static_par0_go_out;
wire _guard78 = _guard76 & _guard77;
wire _guard79 = index_eq_depth_plus_8_out;
wire _guard80 = early_reset_static_par0_go_out;
wire _guard81 = _guard79 & _guard80;
wire _guard82 = index_eq_depth_plus_7_out;
wire _guard83 = early_reset_static_par0_go_out;
wire _guard84 = _guard82 & _guard83;
wire _guard85 = index_eq_depth_plus_5_out;
wire _guard86 = early_reset_static_par0_go_out;
wire _guard87 = _guard85 & _guard86;
wire _guard88 = index_eq_depth_plus_8_out;
wire _guard89 = early_reset_static_par0_go_out;
wire _guard90 = _guard88 & _guard89;
wire _guard91 = index_eq_depth_plus_9_out;
wire _guard92 = early_reset_static_par0_go_out;
wire _guard93 = _guard91 & _guard92;
wire _guard94 = index_eq_depth_plus_6_out;
wire _guard95 = early_reset_static_par0_go_out;
wire _guard96 = _guard94 & _guard95;
wire _guard97 = index_eq_depth_plus_7_out;
wire _guard98 = early_reset_static_par0_go_out;
wire _guard99 = _guard97 & _guard98;
wire _guard100 = idx_between_1_depth_plus_1_comb_out;
wire _guard101 = early_reset_static_par0_go_out;
wire _guard102 = _guard100 & _guard101;
wire _guard103 = index_eq_depth_plus_8_out;
wire _guard104 = early_reset_static_par0_go_out;
wire _guard105 = _guard103 & _guard104;
wire _guard106 = index_eq_depth_plus_6_out;
wire _guard107 = early_reset_static_par0_go_out;
wire _guard108 = _guard106 & _guard107;
wire _guard109 = index_eq_depth_plus_7_out;
wire _guard110 = early_reset_static_par0_go_out;
wire _guard111 = _guard109 & _guard110;
wire _guard112 = index_eq_depth_plus_9_out;
wire _guard113 = early_reset_static_par0_go_out;
wire _guard114 = _guard112 & _guard113;
wire _guard115 = index_eq_depth_plus_9_out;
wire _guard116 = early_reset_static_par0_go_out;
wire _guard117 = _guard115 & _guard116;
wire _guard118 = index_eq_depth_plus_7_out;
wire _guard119 = early_reset_static_par0_go_out;
wire _guard120 = _guard118 & _guard119;
wire _guard121 = index_eq_depth_plus_8_out;
wire _guard122 = early_reset_static_par0_go_out;
wire _guard123 = _guard121 & _guard122;
wire _guard124 = index_eq_depth_plus_10_out;
wire _guard125 = early_reset_static_par0_go_out;
wire _guard126 = _guard124 & _guard125;
wire _guard127 = index_eq_depth_plus_6_out;
wire _guard128 = index_eq_depth_plus_7_out;
wire _guard129 = _guard127 | _guard128;
wire _guard130 = index_eq_depth_plus_8_out;
wire _guard131 = _guard129 | _guard130;
wire _guard132 = index_eq_depth_plus_9_out;
wire _guard133 = _guard131 | _guard132;
wire _guard134 = early_reset_static_par0_go_out;
wire _guard135 = _guard133 & _guard134;
wire _guard136 = index_eq_depth_plus_8_out;
wire _guard137 = index_eq_depth_plus_9_out;
wire _guard138 = _guard136 | _guard137;
wire _guard139 = index_eq_depth_plus_10_out;
wire _guard140 = _guard138 | _guard139;
wire _guard141 = index_eq_depth_plus_11_out;
wire _guard142 = _guard140 | _guard141;
wire _guard143 = early_reset_static_par0_go_out;
wire _guard144 = _guard142 & _guard143;
wire _guard145 = idx_between_3_depth_plus_3_comb_out;
wire _guard146 = early_reset_static_par0_go_out;
wire _guard147 = _guard145 & _guard146;
wire _guard148 = index_eq_depth_plus_7_out;
wire _guard149 = early_reset_static_par0_go_out;
wire _guard150 = _guard148 & _guard149;
wire _guard151 = index_eq_depth_plus_5_out;
wire _guard152 = early_reset_static_par0_go_out;
wire _guard153 = _guard151 & _guard152;
wire _guard154 = index_eq_depth_plus_6_out;
wire _guard155 = early_reset_static_par0_go_out;
wire _guard156 = _guard154 & _guard155;
wire _guard157 = index_eq_depth_plus_8_out;
wire _guard158 = early_reset_static_par0_go_out;
wire _guard159 = _guard157 & _guard158;
wire _guard160 = index_lt_depth_plus_0_out;
wire _guard161 = early_reset_static_par0_go_out;
wire _guard162 = _guard160 & _guard161;
wire _guard163 = idx_between_1_depth_plus_1_comb_out;
wire _guard164 = early_reset_static_par0_go_out;
wire _guard165 = _guard163 & _guard164;
wire _guard166 = index_eq_depth_plus_8_out;
wire _guard167 = early_reset_static_par0_go_out;
wire _guard168 = _guard166 & _guard167;
wire _guard169 = index_eq_depth_plus_10_out;
wire _guard170 = early_reset_static_par0_go_out;
wire _guard171 = _guard169 & _guard170;
wire _guard172 = index_eq_depth_plus_7_out;
wire _guard173 = early_reset_static_par0_go_out;
wire _guard174 = _guard172 & _guard173;
wire _guard175 = index_eq_depth_plus_9_out;
wire _guard176 = early_reset_static_par0_go_out;
wire _guard177 = _guard175 & _guard176;
wire _guard178 = idx_between_2_depth_plus_2_comb_out;
wire _guard179 = early_reset_static_par0_go_out;
wire _guard180 = _guard178 & _guard179;
wire _guard181 = idx_between_3_depth_plus_3_comb_out;
wire _guard182 = early_reset_static_par0_go_out;
wire _guard183 = _guard181 & _guard182;
wire _guard184 = early_reset_static_par_go_out;
wire _guard185 = early_reset_static_par0_go_out;
wire _guard186 = _guard184 | _guard185;
wire _guard187 = fsm_out != 1'd0;
wire _guard188 = early_reset_static_par_go_out;
wire _guard189 = _guard187 & _guard188;
wire _guard190 = fsm_out == 1'd0;
wire _guard191 = early_reset_static_par_go_out;
wire _guard192 = _guard190 & _guard191;
wire _guard193 = fsm_out == 1'd0;
wire _guard194 = early_reset_static_par0_go_out;
wire _guard195 = _guard193 & _guard194;
wire _guard196 = _guard192 | _guard195;
wire _guard197 = fsm_out != 1'd0;
wire _guard198 = early_reset_static_par0_go_out;
wire _guard199 = _guard197 & _guard198;
wire _guard200 = while_wrapper_early_reset_static_par0_go_out;
wire _guard201 = idx_between_2_depth_plus_6_comb_out;
wire _guard202 = early_reset_static_par0_go_out;
wire _guard203 = _guard201 & _guard202;
wire _guard204 = idx_between_2_depth_plus_6_comb_out;
wire _guard205 = early_reset_static_par0_go_out;
wire _guard206 = _guard204 & _guard205;
wire _guard207 = idx_between_2_depth_plus_6_comb_out;
wire _guard208 = early_reset_static_par0_go_out;
wire _guard209 = _guard207 & _guard208;
wire _guard210 = idx_between_2_depth_plus_6_comb_out;
wire _guard211 = early_reset_static_par0_go_out;
wire _guard212 = _guard210 & _guard211;
wire _guard213 = idx_between_2_depth_plus_6_comb_out;
wire _guard214 = early_reset_static_par0_go_out;
wire _guard215 = _guard213 & _guard214;
wire _guard216 = idx_between_2_depth_plus_6_comb_out;
wire _guard217 = early_reset_static_par0_go_out;
wire _guard218 = _guard216 & _guard217;
wire _guard219 = idx_between_2_depth_plus_6_comb_out;
wire _guard220 = early_reset_static_par0_go_out;
wire _guard221 = _guard219 & _guard220;
wire _guard222 = idx_between_2_depth_plus_6_comb_out;
wire _guard223 = early_reset_static_par0_go_out;
wire _guard224 = _guard222 & _guard223;
wire _guard225 = idx_between_1_depth_plus_1_comb_out;
wire _guard226 = early_reset_static_par0_go_out;
wire _guard227 = _guard225 & _guard226;
wire _guard228 = idx_between_1_depth_plus_1_comb_out;
wire _guard229 = early_reset_static_par0_go_out;
wire _guard230 = _guard228 & _guard229;
wire _guard231 = idx_between_2_depth_plus_2_comb_out;
wire _guard232 = early_reset_static_par0_go_out;
wire _guard233 = _guard231 & _guard232;
wire _guard234 = idx_between_2_depth_plus_2_comb_out;
wire _guard235 = early_reset_static_par0_go_out;
wire _guard236 = _guard234 & _guard235;
wire _guard237 = idx_between_6_depth_plus_10_comb_out;
wire _guard238 = early_reset_static_par0_go_out;
wire _guard239 = _guard237 & _guard238;
wire _guard240 = idx_between_6_depth_plus_10_comb_out;
wire _guard241 = early_reset_static_par0_go_out;
wire _guard242 = _guard240 & _guard241;
wire _guard243 = idx_between_6_depth_plus_10_comb_out;
wire _guard244 = early_reset_static_par0_go_out;
wire _guard245 = _guard243 & _guard244;
wire _guard246 = idx_between_6_depth_plus_10_comb_out;
wire _guard247 = early_reset_static_par0_go_out;
wire _guard248 = _guard246 & _guard247;
wire _guard249 = early_reset_static_par0_go_out;
wire _guard250 = early_reset_static_par_go_out;
wire _guard251 = early_reset_static_par_go_out;
wire _guard252 = early_reset_static_par0_go_out;
wire _guard253 = index_lt_depth_plus_0_out;
wire _guard254 = early_reset_static_par0_go_out;
wire _guard255 = _guard253 & _guard254;
wire _guard256 = index_lt_depth_plus_0_out;
wire _guard257 = early_reset_static_par0_go_out;
wire _guard258 = _guard256 & _guard257;
wire _guard259 = idx_between_4_depth_plus_8_comb_out;
wire _guard260 = early_reset_static_par0_go_out;
wire _guard261 = _guard259 & _guard260;
wire _guard262 = idx_between_4_depth_plus_8_comb_out;
wire _guard263 = early_reset_static_par0_go_out;
wire _guard264 = _guard262 & _guard263;
wire _guard265 = idx_between_4_depth_plus_8_comb_out;
wire _guard266 = early_reset_static_par0_go_out;
wire _guard267 = _guard265 & _guard266;
wire _guard268 = idx_between_4_depth_plus_8_comb_out;
wire _guard269 = early_reset_static_par0_go_out;
wire _guard270 = _guard268 & _guard269;
wire _guard271 = idx_between_4_depth_plus_8_comb_out;
wire _guard272 = early_reset_static_par0_go_out;
wire _guard273 = _guard271 & _guard272;
wire _guard274 = idx_between_4_depth_plus_8_comb_out;
wire _guard275 = early_reset_static_par0_go_out;
wire _guard276 = _guard274 & _guard275;
wire _guard277 = idx_between_4_depth_plus_8_comb_out;
wire _guard278 = early_reset_static_par0_go_out;
wire _guard279 = _guard277 & _guard278;
wire _guard280 = idx_between_4_depth_plus_8_comb_out;
wire _guard281 = early_reset_static_par0_go_out;
wire _guard282 = _guard280 & _guard281;
wire _guard283 = wrapper_early_reset_static_par_done_out;
wire _guard284 = ~_guard283;
wire _guard285 = fsm0_out == 2'd0;
wire _guard286 = _guard284 & _guard285;
wire _guard287 = tdcc_go_out;
wire _guard288 = _guard286 & _guard287;
wire _guard289 = idx_between_3_depth_plus_7_comb_out;
wire _guard290 = early_reset_static_par0_go_out;
wire _guard291 = _guard289 & _guard290;
wire _guard292 = idx_between_3_depth_plus_7_comb_out;
wire _guard293 = early_reset_static_par0_go_out;
wire _guard294 = _guard292 & _guard293;
wire _guard295 = idx_between_3_depth_plus_7_comb_out;
wire _guard296 = early_reset_static_par0_go_out;
wire _guard297 = _guard295 & _guard296;
wire _guard298 = idx_between_3_depth_plus_7_comb_out;
wire _guard299 = early_reset_static_par0_go_out;
wire _guard300 = _guard298 & _guard299;
wire _guard301 = fsm_out == 1'd0;
wire _guard302 = signal_reg_out;
wire _guard303 = _guard301 & _guard302;
wire _guard304 = idx_between_4_depth_plus_8_comb_out;
wire _guard305 = early_reset_static_par0_go_out;
wire _guard306 = _guard304 & _guard305;
wire _guard307 = idx_between_4_depth_plus_8_comb_out;
wire _guard308 = early_reset_static_par0_go_out;
wire _guard309 = _guard307 & _guard308;
wire _guard310 = idx_between_4_depth_plus_8_comb_out;
wire _guard311 = early_reset_static_par0_go_out;
wire _guard312 = _guard310 & _guard311;
wire _guard313 = idx_between_4_depth_plus_8_comb_out;
wire _guard314 = early_reset_static_par0_go_out;
wire _guard315 = _guard313 & _guard314;
wire _guard316 = idx_between_6_depth_plus_10_comb_out;
wire _guard317 = early_reset_static_par0_go_out;
wire _guard318 = _guard316 & _guard317;
wire _guard319 = idx_between_6_depth_plus_10_comb_out;
wire _guard320 = early_reset_static_par0_go_out;
wire _guard321 = _guard319 & _guard320;
wire _guard322 = idx_between_6_depth_plus_10_comb_out;
wire _guard323 = early_reset_static_par0_go_out;
wire _guard324 = _guard322 & _guard323;
wire _guard325 = idx_between_6_depth_plus_10_comb_out;
wire _guard326 = early_reset_static_par0_go_out;
wire _guard327 = _guard325 & _guard326;
wire _guard328 = idx_between_5_depth_plus_9_comb_out;
wire _guard329 = early_reset_static_par0_go_out;
wire _guard330 = _guard328 & _guard329;
wire _guard331 = idx_between_5_depth_plus_9_comb_out;
wire _guard332 = early_reset_static_par0_go_out;
wire _guard333 = _guard331 & _guard332;
wire _guard334 = idx_between_5_depth_plus_9_comb_out;
wire _guard335 = early_reset_static_par0_go_out;
wire _guard336 = _guard334 & _guard335;
wire _guard337 = idx_between_5_depth_plus_9_comb_out;
wire _guard338 = early_reset_static_par0_go_out;
wire _guard339 = _guard337 & _guard338;
wire _guard340 = fsm0_out == 2'd2;
wire _guard341 = fsm0_out == 2'd0;
wire _guard342 = wrapper_early_reset_static_par_done_out;
wire _guard343 = _guard341 & _guard342;
wire _guard344 = tdcc_go_out;
wire _guard345 = _guard343 & _guard344;
wire _guard346 = _guard340 | _guard345;
wire _guard347 = fsm0_out == 2'd1;
wire _guard348 = while_wrapper_early_reset_static_par0_done_out;
wire _guard349 = _guard347 & _guard348;
wire _guard350 = tdcc_go_out;
wire _guard351 = _guard349 & _guard350;
wire _guard352 = _guard346 | _guard351;
wire _guard353 = fsm0_out == 2'd0;
wire _guard354 = wrapper_early_reset_static_par_done_out;
wire _guard355 = _guard353 & _guard354;
wire _guard356 = tdcc_go_out;
wire _guard357 = _guard355 & _guard356;
wire _guard358 = fsm0_out == 2'd2;
wire _guard359 = fsm0_out == 2'd1;
wire _guard360 = while_wrapper_early_reset_static_par0_done_out;
wire _guard361 = _guard359 & _guard360;
wire _guard362 = tdcc_go_out;
wire _guard363 = _guard361 & _guard362;
wire _guard364 = early_reset_static_par_go_out;
wire _guard365 = early_reset_static_par0_go_out;
wire _guard366 = _guard364 | _guard365;
wire _guard367 = early_reset_static_par_go_out;
wire _guard368 = early_reset_static_par0_go_out;
wire _guard369 = idx_between_1_depth_plus_1_comb_out;
wire _guard370 = early_reset_static_par0_go_out;
wire _guard371 = _guard369 & _guard370;
wire _guard372 = idx_between_1_depth_plus_1_comb_out;
wire _guard373 = early_reset_static_par0_go_out;
wire _guard374 = _guard372 & _guard373;
wire _guard375 = idx_between_3_depth_plus_3_comb_out;
wire _guard376 = early_reset_static_par0_go_out;
wire _guard377 = _guard375 & _guard376;
wire _guard378 = idx_between_3_depth_plus_3_comb_out;
wire _guard379 = early_reset_static_par0_go_out;
wire _guard380 = _guard378 & _guard379;
wire _guard381 = early_reset_static_par0_go_out;
wire _guard382 = early_reset_static_par0_go_out;
wire _guard383 = idx_between_2_depth_plus_2_comb_out;
wire _guard384 = early_reset_static_par0_go_out;
wire _guard385 = _guard383 & _guard384;
wire _guard386 = idx_between_2_depth_plus_2_comb_out;
wire _guard387 = early_reset_static_par0_go_out;
wire _guard388 = _guard386 & _guard387;
wire _guard389 = fsm_out == 1'd0;
wire _guard390 = signal_reg_out;
wire _guard391 = _guard389 & _guard390;
wire _guard392 = fsm_out == 1'd0;
wire _guard393 = signal_reg_out;
wire _guard394 = ~_guard393;
wire _guard395 = _guard392 & _guard394;
wire _guard396 = wrapper_early_reset_static_par_go_out;
wire _guard397 = _guard395 & _guard396;
wire _guard398 = _guard391 | _guard397;
wire _guard399 = fsm_out == 1'd0;
wire _guard400 = signal_reg_out;
wire _guard401 = ~_guard400;
wire _guard402 = _guard399 & _guard401;
wire _guard403 = wrapper_early_reset_static_par_go_out;
wire _guard404 = _guard402 & _guard403;
wire _guard405 = fsm_out == 1'd0;
wire _guard406 = signal_reg_out;
wire _guard407 = _guard405 & _guard406;
wire _guard408 = idx_between_3_depth_plus_7_comb_out;
wire _guard409 = early_reset_static_par0_go_out;
wire _guard410 = _guard408 & _guard409;
wire _guard411 = idx_between_3_depth_plus_7_comb_out;
wire _guard412 = early_reset_static_par0_go_out;
wire _guard413 = _guard411 & _guard412;
wire _guard414 = idx_between_3_depth_plus_7_comb_out;
wire _guard415 = early_reset_static_par0_go_out;
wire _guard416 = _guard414 & _guard415;
wire _guard417 = idx_between_3_depth_plus_7_comb_out;
wire _guard418 = early_reset_static_par0_go_out;
wire _guard419 = _guard417 & _guard418;
wire _guard420 = idx_between_1_depth_plus_5_comb_out;
wire _guard421 = early_reset_static_par0_go_out;
wire _guard422 = _guard420 & _guard421;
wire _guard423 = idx_between_1_depth_plus_5_comb_out;
wire _guard424 = early_reset_static_par0_go_out;
wire _guard425 = _guard423 & _guard424;
wire _guard426 = idx_between_1_depth_plus_5_comb_out;
wire _guard427 = early_reset_static_par0_go_out;
wire _guard428 = _guard426 & _guard427;
wire _guard429 = idx_between_1_depth_plus_5_comb_out;
wire _guard430 = early_reset_static_par0_go_out;
wire _guard431 = _guard429 & _guard430;
wire _guard432 = idx_between_7_depth_plus_11_comb_out;
wire _guard433 = early_reset_static_par0_go_out;
wire _guard434 = _guard432 & _guard433;
wire _guard435 = idx_between_7_depth_plus_11_comb_out;
wire _guard436 = early_reset_static_par0_go_out;
wire _guard437 = _guard435 & _guard436;
wire _guard438 = idx_between_7_depth_plus_11_comb_out;
wire _guard439 = early_reset_static_par0_go_out;
wire _guard440 = _guard438 & _guard439;
wire _guard441 = idx_between_7_depth_plus_11_comb_out;
wire _guard442 = early_reset_static_par0_go_out;
wire _guard443 = _guard441 & _guard442;
wire _guard444 = fsm0_out == 2'd2;
wire _guard445 = idx_between_3_depth_plus_3_comb_out;
wire _guard446 = early_reset_static_par0_go_out;
wire _guard447 = _guard445 & _guard446;
wire _guard448 = idx_between_3_depth_plus_3_comb_out;
wire _guard449 = early_reset_static_par0_go_out;
wire _guard450 = _guard448 & _guard449;
wire _guard451 = wrapper_early_reset_static_par_go_out;
wire _guard452 = early_reset_static_par_go_out;
wire _guard453 = early_reset_static_par_go_out;
wire _guard454 = index_lt_depth_plus_0_out;
wire _guard455 = early_reset_static_par0_go_out;
wire _guard456 = _guard454 & _guard455;
wire _guard457 = index_lt_depth_plus_0_out;
wire _guard458 = early_reset_static_par0_go_out;
wire _guard459 = _guard457 & _guard458;
wire _guard460 = idx_between_3_depth_plus_7_comb_out;
wire _guard461 = early_reset_static_par0_go_out;
wire _guard462 = _guard460 & _guard461;
wire _guard463 = idx_between_3_depth_plus_7_comb_out;
wire _guard464 = early_reset_static_par0_go_out;
wire _guard465 = _guard463 & _guard464;
wire _guard466 = idx_between_3_depth_plus_7_comb_out;
wire _guard467 = early_reset_static_par0_go_out;
wire _guard468 = _guard466 & _guard467;
wire _guard469 = idx_between_3_depth_plus_7_comb_out;
wire _guard470 = early_reset_static_par0_go_out;
wire _guard471 = _guard469 & _guard470;
wire _guard472 = idx_between_5_depth_plus_9_comb_out;
wire _guard473 = early_reset_static_par0_go_out;
wire _guard474 = _guard472 & _guard473;
wire _guard475 = idx_between_5_depth_plus_9_comb_out;
wire _guard476 = early_reset_static_par0_go_out;
wire _guard477 = _guard475 & _guard476;
wire _guard478 = idx_between_5_depth_plus_9_comb_out;
wire _guard479 = early_reset_static_par0_go_out;
wire _guard480 = _guard478 & _guard479;
wire _guard481 = idx_between_5_depth_plus_9_comb_out;
wire _guard482 = early_reset_static_par0_go_out;
wire _guard483 = _guard481 & _guard482;
wire _guard484 = while_wrapper_early_reset_static_par0_done_out;
wire _guard485 = ~_guard484;
wire _guard486 = fsm0_out == 2'd1;
wire _guard487 = _guard485 & _guard486;
wire _guard488 = tdcc_go_out;
wire _guard489 = _guard487 & _guard488;
wire _guard490 = lt_iter_limit_out;
wire _guard491 = ~_guard490;
wire _guard492 = fsm_out == 1'd0;
wire _guard493 = _guard491 & _guard492;
assign idx_minus_1_left = idx_out;
assign idx_minus_1_right = 32'd1;
assign idx_minus_1_res_in = idx_minus_1_out;
assign adder_left =
  _guard1 ? fsm_out :
  1'd0;
assign adder_right = _guard2;
assign index_eq_depth_plus_6_left = idx_out;
assign index_eq_depth_plus_6_right = depth_plus_6_out;
assign index_eq_depth_plus_8_left = idx_out;
assign index_eq_depth_plus_8_right = depth_plus_8_out;
assign index_ge_8_left = idx_out;
assign index_ge_8_right = 32'd8;
assign index_lt_depth_plus_6_left = idx_out;
assign index_lt_depth_plus_6_right = depth_plus_6_out;
assign index_lt_depth_plus_9_left = idx_out;
assign index_lt_depth_plus_9_right = depth_plus_9_out;
assign left_0_3_write_en = 1'd1;
assign left_0_3_clk = clk;
assign left_0_3_reset = reset;
assign left_0_3_in = left_0_2_out;
assign top_1_0_write_en = 1'd1;
assign top_1_0_clk = clk;
assign top_1_0_reset = reset;
assign top_1_0_in = top_0_0_out;
assign pe_1_2_mul_ready =
  _guard5 ? index_ge_8_out :
  1'd0;
assign pe_1_2_clk = clk;
assign pe_1_2_top =
  _guard8 ? top_1_2_out :
  32'd0;
assign pe_1_2_left =
  _guard11 ? left_1_2_out :
  32'd0;
assign pe_1_2_go = _guard14;
assign pe_1_2_reset = reset;
assign pe_1_3_mul_ready =
  _guard17 ? index_ge_9_out :
  1'd0;
assign pe_1_3_clk = clk;
assign pe_1_3_top =
  _guard20 ? top_1_3_out :
  32'd0;
assign pe_1_3_left =
  _guard23 ? left_1_3_out :
  32'd0;
assign pe_1_3_go = _guard26;
assign pe_1_3_reset = reset;
assign left_1_3_write_en = 1'd1;
assign left_1_3_clk = clk;
assign left_1_3_reset = reset;
assign left_1_3_in = left_1_2_out;
assign t2_addr0 =
  _guard29 ? idx_minus_2_res_out :
  3'd0;
assign done = _guard30;
assign r2_valid = _guard39;
assign l0_addr0 =
  _guard42 ? idx_minus_0_res_out :
  3'd0;
assign r0_valid = _guard51;
assign r3_value =
  _guard54 ? pe_3_2_out :
  _guard57 ? pe_3_0_out :
  _guard60 ? pe_3_1_out :
  _guard63 ? pe_3_3_out :
  32'd0;
always_comb begin
  if(~$onehot0({_guard63, _guard60, _guard57, _guard54})) begin
    $fatal(2, "Multiple assignment to port `_this.r3_value'.");
end
end
assign r3_idx =
  _guard66 ? 3'd2 :
  _guard69 ? 3'd0 :
  _guard72 ? 3'd1 :
  _guard75 ? 3'd3 :
  3'd0;
always_comb begin
  if(~$onehot0({_guard75, _guard72, _guard69, _guard66})) begin
    $fatal(2, "Multiple assignment to port `_this.r3_idx'.");
end
end
assign r0_value =
  _guard78 ? pe_0_1_out :
  _guard81 ? pe_0_3_out :
  _guard84 ? pe_0_2_out :
  _guard87 ? pe_0_0_out :
  32'd0;
always_comb begin
  if(~$onehot0({_guard87, _guard84, _guard81, _guard78})) begin
    $fatal(2, "Multiple assignment to port `_this.r0_value'.");
end
end
assign r1_value =
  _guard90 ? pe_1_2_out :
  _guard93 ? pe_1_3_out :
  _guard96 ? pe_1_0_out :
  _guard99 ? pe_1_1_out :
  32'd0;
always_comb begin
  if(~$onehot0({_guard99, _guard96, _guard93, _guard90})) begin
    $fatal(2, "Multiple assignment to port `_this.r1_value'.");
end
end
assign l1_addr0 =
  _guard102 ? idx_minus_1_res_out :
  3'd0;
assign r1_idx =
  _guard105 ? 3'd2 :
  _guard108 ? 3'd0 :
  _guard111 ? 3'd1 :
  _guard114 ? 3'd3 :
  3'd0;
always_comb begin
  if(~$onehot0({_guard114, _guard111, _guard108, _guard105})) begin
    $fatal(2, "Multiple assignment to port `_this.r1_idx'.");
end
end
assign r2_idx =
  _guard117 ? 3'd2 :
  _guard120 ? 3'd0 :
  _guard123 ? 3'd1 :
  _guard126 ? 3'd3 :
  3'd0;
always_comb begin
  if(~$onehot0({_guard126, _guard123, _guard120, _guard117})) begin
    $fatal(2, "Multiple assignment to port `_this.r2_idx'.");
end
end
assign r1_valid = _guard135;
assign r3_valid = _guard144;
assign l3_addr0 =
  _guard147 ? idx_minus_3_res_out :
  3'd0;
assign r0_idx =
  _guard150 ? 3'd2 :
  _guard153 ? 3'd0 :
  _guard156 ? 3'd1 :
  _guard159 ? 3'd3 :
  3'd0;
always_comb begin
  if(~$onehot0({_guard159, _guard156, _guard153, _guard150})) begin
    $fatal(2, "Multiple assignment to port `_this.r0_idx'.");
end
end
assign t0_addr0 =
  _guard162 ? idx_minus_0_res_out :
  3'd0;
assign t1_addr0 =
  _guard165 ? idx_minus_1_res_out :
  3'd0;
assign r2_value =
  _guard168 ? pe_2_1_out :
  _guard171 ? pe_2_3_out :
  _guard174 ? pe_2_0_out :
  _guard177 ? pe_2_2_out :
  32'd0;
always_comb begin
  if(~$onehot0({_guard177, _guard174, _guard171, _guard168})) begin
    $fatal(2, "Multiple assignment to port `_this.r2_value'.");
end
end
assign l2_addr0 =
  _guard180 ? idx_minus_2_res_out :
  3'd0;
assign t3_addr0 =
  _guard183 ? idx_minus_3_res_out :
  3'd0;
assign fsm_write_en = _guard186;
assign fsm_clk = clk;
assign fsm_reset = reset;
assign fsm_in =
  _guard189 ? adder_out :
  _guard196 ? 1'd0 :
  _guard199 ? adder0_out :
  1'd0;
always_comb begin
  if(~$onehot0({_guard199, _guard196, _guard189})) begin
    $fatal(2, "Multiple assignment to port `fsm.in'.");
end
end
assign early_reset_static_par0_go_in = _guard200;
assign depth_plus_10_left = depth;
assign depth_plus_10_right = 32'd10;
assign idx_between_3_depth_plus_7_comb_left = index_ge_3_out;
assign idx_between_3_depth_plus_7_comb_right = index_lt_depth_plus_7_out;
assign index_ge_3_left = idx_out;
assign index_ge_3_right = 32'd3;
assign pe_0_1_mul_ready =
  _guard203 ? index_ge_6_out :
  1'd0;
assign pe_0_1_clk = clk;
assign pe_0_1_top =
  _guard206 ? top_0_1_out :
  32'd0;
assign pe_0_1_left =
  _guard209 ? left_0_1_out :
  32'd0;
assign pe_0_1_go = _guard212;
assign pe_0_1_reset = reset;
assign left_1_2_write_en = 1'd1;
assign left_1_2_clk = clk;
assign left_1_2_reset = reset;
assign left_1_2_in = left_1_1_out;
assign left_2_2_write_en = 1'd1;
assign left_2_2_clk = clk;
assign left_2_2_reset = reset;
assign left_2_2_in = left_2_1_out;
assign depth_plus_5_left = depth;
assign depth_plus_5_right = 32'd5;
assign index_eq_depth_plus_10_left = idx_out;
assign index_eq_depth_plus_10_right = depth_plus_10_out;
assign index_lt_depth_plus_10_left = idx_out;
assign index_lt_depth_plus_10_right = depth_plus_10_out;
assign pe_1_0_mul_ready =
  _guard215 ? index_ge_6_out :
  1'd0;
assign pe_1_0_clk = clk;
assign pe_1_0_top =
  _guard218 ? top_1_0_out :
  32'd0;
assign pe_1_0_left =
  _guard221 ? left_1_0_out :
  32'd0;
assign pe_1_0_go = _guard224;
assign pe_1_0_reset = reset;
assign left_1_0_write_en = _guard227;
assign left_1_0_clk = clk;
assign left_1_0_reset = reset;
assign left_1_0_in = l1_read_data;
assign left_1_1_write_en = 1'd1;
assign left_1_1_clk = clk;
assign left_1_1_reset = reset;
assign left_1_1_in = left_1_0_out;
assign top_1_2_write_en = 1'd1;
assign top_1_2_clk = clk;
assign top_1_2_reset = reset;
assign top_1_2_in = top_0_2_out;
assign left_2_0_write_en = _guard233;
assign left_2_0_clk = clk;
assign left_2_0_reset = reset;
assign left_2_0_in = l2_read_data;
assign left_3_1_write_en = 1'd1;
assign left_3_1_clk = clk;
assign left_3_1_reset = reset;
assign left_3_1_in = left_3_0_out;
assign pe_3_2_mul_ready =
  _guard239 ? index_ge_10_out :
  1'd0;
assign pe_3_2_clk = clk;
assign pe_3_2_top =
  _guard242 ? top_3_2_out :
  32'd0;
assign pe_3_2_left =
  _guard245 ? left_3_2_out :
  32'd0;
assign pe_3_2_go = _guard248;
assign pe_3_2_reset = reset;
assign idx_minus_2_left = idx_out;
assign idx_minus_2_right = 32'd2;
assign iter_limit_add_left =
  _guard249 ? idx_out :
  _guard250 ? 32'd12 :
  'x;
always_comb begin
  if(~$onehot0({_guard250, _guard249})) begin
    $fatal(2, "Multiple assignment to port `iter_limit_add.left'.");
end
end
assign iter_limit_add_right =
  _guard251 ? depth :
  _guard252 ? 32'd1 :
  'x;
always_comb begin
  if(~$onehot0({_guard252, _guard251})) begin
    $fatal(2, "Multiple assignment to port `iter_limit_add.right'.");
end
end
assign depth_plus_1_left = depth;
assign depth_plus_1_right = 32'd1;
assign index_lt_depth_plus_8_left = idx_out;
assign index_lt_depth_plus_8_right = depth_plus_8_out;
assign idx_between_1_depth_plus_5_comb_left = index_ge_1_out;
assign idx_between_1_depth_plus_5_comb_right = index_lt_depth_plus_5_out;
assign idx_between_4_depth_plus_8_comb_left = index_ge_4_out;
assign idx_between_4_depth_plus_8_comb_right = index_lt_depth_plus_8_out;
assign left_0_0_write_en = _guard255;
assign left_0_0_clk = clk;
assign left_0_0_reset = reset;
assign left_0_0_in = l0_read_data;
assign pe_0_3_mul_ready =
  _guard261 ? index_ge_8_out :
  1'd0;
assign pe_0_3_clk = clk;
assign pe_0_3_top =
  _guard264 ? top_0_3_out :
  32'd0;
assign pe_0_3_left =
  _guard267 ? left_0_3_out :
  32'd0;
assign pe_0_3_go = _guard270;
assign pe_0_3_reset = reset;
assign top_1_3_write_en = 1'd1;
assign top_1_3_clk = clk;
assign top_1_3_reset = reset;
assign top_1_3_in = top_0_3_out;
assign left_2_3_write_en = 1'd1;
assign left_2_3_clk = clk;
assign left_2_3_reset = reset;
assign left_2_3_in = left_2_2_out;
assign pe_3_0_mul_ready =
  _guard273 ? index_ge_8_out :
  1'd0;
assign pe_3_0_clk = clk;
assign pe_3_0_top =
  _guard276 ? top_3_0_out :
  32'd0;
assign pe_3_0_left =
  _guard279 ? left_3_0_out :
  32'd0;
assign pe_3_0_go = _guard282;
assign pe_3_0_reset = reset;
assign top_3_2_write_en = 1'd1;
assign top_3_2_clk = clk;
assign top_3_2_reset = reset;
assign top_3_2_in = top_2_2_out;
assign wrapper_early_reset_static_par_go_in = _guard288;
assign depth_plus_7_left = depth;
assign depth_plus_7_right = 32'd7;
assign index_ge_7_left = idx_out;
assign index_ge_7_right = 32'd7;
assign pe_0_2_mul_ready =
  _guard291 ? index_ge_7_out :
  1'd0;
assign pe_0_2_clk = clk;
assign pe_0_2_top =
  _guard294 ? top_0_2_out :
  32'd0;
assign pe_0_2_left =
  _guard297 ? left_0_2_out :
  32'd0;
assign pe_0_2_go = _guard300;
assign pe_0_2_reset = reset;
assign early_reset_static_par0_done_in = ud0_out;
assign wrapper_early_reset_static_par_done_in = _guard303;
assign tdcc_go_in = go;
assign lt_iter_limit_left = idx_out;
assign lt_iter_limit_right = iter_limit_out;
assign index_eq_depth_plus_5_left = idx_out;
assign index_eq_depth_plus_5_right = depth_plus_5_out;
assign pe_2_1_mul_ready =
  _guard306 ? index_ge_8_out :
  1'd0;
assign pe_2_1_clk = clk;
assign pe_2_1_top =
  _guard309 ? top_2_1_out :
  32'd0;
assign pe_2_1_left =
  _guard312 ? left_2_1_out :
  32'd0;
assign pe_2_1_go = _guard315;
assign pe_2_1_reset = reset;
assign pe_2_3_mul_ready =
  _guard318 ? index_ge_10_out :
  1'd0;
assign pe_2_3_clk = clk;
assign pe_2_3_top =
  _guard321 ? top_2_3_out :
  32'd0;
assign pe_2_3_left =
  _guard324 ? left_2_3_out :
  32'd0;
assign pe_2_3_go = _guard327;
assign pe_2_3_reset = reset;
assign pe_3_1_mul_ready =
  _guard330 ? index_ge_9_out :
  1'd0;
assign pe_3_1_clk = clk;
assign pe_3_1_top =
  _guard333 ? top_3_1_out :
  32'd0;
assign pe_3_1_left =
  _guard336 ? left_3_1_out :
  32'd0;
assign pe_3_1_go = _guard339;
assign pe_3_1_reset = reset;
assign idx_minus_2_res_in = idx_minus_2_out;
assign fsm0_write_en = _guard352;
assign fsm0_clk = clk;
assign fsm0_reset = reset;
assign fsm0_in =
  _guard357 ? 2'd1 :
  _guard358 ? 2'd0 :
  _guard363 ? 2'd2 :
  2'd0;
always_comb begin
  if(~$onehot0({_guard363, _guard358, _guard357})) begin
    $fatal(2, "Multiple assignment to port `fsm0.in'.");
end
end
assign idx_write_en = _guard366;
assign idx_clk = clk;
assign idx_reset = reset;
assign idx_in =
  _guard367 ? 32'd0 :
  _guard368 ? iter_limit_add_out :
  'x;
always_comb begin
  if(~$onehot0({_guard368, _guard367})) begin
    $fatal(2, "Multiple assignment to port `idx.in'.");
end
end
assign depth_plus_0_left = depth;
assign depth_plus_0_right = 32'd0;
assign depth_plus_8_left = depth;
assign depth_plus_8_right = 32'd8;
assign index_eq_depth_plus_11_left = idx_out;
assign index_eq_depth_plus_11_right = depth_plus_11_out;
assign index_lt_depth_plus_0_left = idx_out;
assign index_lt_depth_plus_0_right = depth_plus_0_out;
assign index_lt_depth_plus_3_left = idx_out;
assign index_lt_depth_plus_3_right = depth_plus_3_out;
assign idx_between_1_depth_plus_1_comb_left = index_ge_1_out;
assign idx_between_1_depth_plus_1_comb_right = index_lt_depth_plus_1_out;
assign idx_between_2_depth_plus_6_comb_left = index_ge_2_out;
assign idx_between_2_depth_plus_6_comb_right = index_lt_depth_plus_6_out;
assign top_2_0_write_en = 1'd1;
assign top_2_0_clk = clk;
assign top_2_0_reset = reset;
assign top_2_0_in = top_1_0_out;
assign top_3_0_write_en = 1'd1;
assign top_3_0_clk = clk;
assign top_3_0_reset = reset;
assign top_3_0_in = top_2_0_out;
assign top_3_1_write_en = 1'd1;
assign top_3_1_clk = clk;
assign top_3_1_reset = reset;
assign top_3_1_in = top_2_1_out;
assign idx_minus_0_res_in = idx_minus_0_out;
assign index_ge_1_left = idx_out;
assign index_ge_1_right = 32'd1;
assign index_ge_4_left = idx_out;
assign index_ge_4_right = 32'd4;
assign top_0_1_write_en = _guard371;
assign top_0_1_clk = clk;
assign top_0_1_reset = reset;
assign top_0_1_in = t1_read_data;
assign left_0_2_write_en = 1'd1;
assign left_0_2_clk = clk;
assign left_0_2_reset = reset;
assign left_0_2_in = left_0_1_out;
assign top_2_3_write_en = 1'd1;
assign top_2_3_clk = clk;
assign top_2_3_reset = reset;
assign top_2_3_in = top_1_3_out;
assign left_3_0_write_en = _guard377;
assign left_3_0_clk = clk;
assign left_3_0_reset = reset;
assign left_3_0_in = l3_read_data;
assign idx_minus_0_left = idx_out;
assign idx_minus_0_right = 32'd0;
assign adder0_left =
  _guard381 ? fsm_out :
  1'd0;
assign adder0_right = _guard382;
assign early_reset_static_par_done_in = ud_out;
assign depth_plus_3_left = depth;
assign depth_plus_3_right = 32'd3;
assign index_eq_depth_plus_7_left = idx_out;
assign index_eq_depth_plus_7_right = depth_plus_7_out;
assign index_ge_9_left = idx_out;
assign index_ge_9_right = 32'd9;
assign index_ge_11_left = idx_out;
assign index_ge_11_right = 32'd11;
assign top_0_2_write_en = _guard385;
assign top_0_2_clk = clk;
assign top_0_2_reset = reset;
assign top_0_2_in = t2_read_data;
assign top_1_1_write_en = 1'd1;
assign top_1_1_clk = clk;
assign top_1_1_reset = reset;
assign top_1_1_in = top_0_1_out;
assign left_3_2_write_en = 1'd1;
assign left_3_2_clk = clk;
assign left_3_2_reset = reset;
assign left_3_2_in = left_3_1_out;
assign signal_reg_write_en = _guard398;
assign signal_reg_clk = clk;
assign signal_reg_reset = reset;
assign signal_reg_in =
  _guard404 ? 1'd1 :
  _guard407 ? 1'd0 :
  1'd0;
always_comb begin
  if(~$onehot0({_guard407, _guard404})) begin
    $fatal(2, "Multiple assignment to port `signal_reg.in'.");
end
end
assign depth_plus_6_left = depth;
assign depth_plus_6_right = 32'd6;
assign depth_plus_9_left = depth;
assign depth_plus_9_right = 32'd9;
assign index_ge_2_left = idx_out;
assign index_ge_2_right = 32'd2;
assign index_lt_depth_plus_7_left = idx_out;
assign index_lt_depth_plus_7_right = depth_plus_7_out;
assign index_lt_depth_plus_11_left = idx_out;
assign index_lt_depth_plus_11_right = depth_plus_11_out;
assign idx_between_6_depth_plus_10_comb_left = index_ge_6_out;
assign idx_between_6_depth_plus_10_comb_right = index_lt_depth_plus_10_out;
assign pe_2_0_mul_ready =
  _guard410 ? index_ge_7_out :
  1'd0;
assign pe_2_0_clk = clk;
assign pe_2_0_top =
  _guard413 ? top_2_0_out :
  32'd0;
assign pe_2_0_left =
  _guard416 ? left_2_0_out :
  32'd0;
assign pe_2_0_go = _guard419;
assign pe_2_0_reset = reset;
assign left_2_1_write_en = 1'd1;
assign left_2_1_clk = clk;
assign left_2_1_reset = reset;
assign left_2_1_in = left_2_0_out;
assign top_2_2_write_en = 1'd1;
assign top_2_2_clk = clk;
assign top_2_2_reset = reset;
assign top_2_2_in = top_1_2_out;
assign depth_plus_2_left = depth;
assign depth_plus_2_right = 32'd2;
assign index_ge_5_left = idx_out;
assign index_ge_5_right = 32'd5;
assign index_ge_10_left = idx_out;
assign index_ge_10_right = 32'd10;
assign idx_between_2_depth_plus_2_comb_left = index_ge_2_out;
assign idx_between_2_depth_plus_2_comb_right = index_lt_depth_plus_2_out;
assign pe_0_0_mul_ready =
  _guard422 ? index_ge_5_out :
  1'd0;
assign pe_0_0_clk = clk;
assign pe_0_0_top =
  _guard425 ? top_0_0_out :
  32'd0;
assign pe_0_0_left =
  _guard428 ? left_0_0_out :
  32'd0;
assign pe_0_0_go = _guard431;
assign pe_0_0_reset = reset;
assign pe_3_3_mul_ready =
  _guard434 ? index_ge_11_out :
  1'd0;
assign pe_3_3_clk = clk;
assign pe_3_3_top =
  _guard437 ? top_3_3_out :
  32'd0;
assign pe_3_3_left =
  _guard440 ? left_3_3_out :
  32'd0;
assign pe_3_3_go = _guard443;
assign pe_3_3_reset = reset;
assign top_3_3_write_en = 1'd1;
assign top_3_3_clk = clk;
assign top_3_3_reset = reset;
assign top_3_3_in = top_2_3_out;
assign tdcc_done_in = _guard444;
assign index_ge_6_left = idx_out;
assign index_ge_6_right = 32'd6;
assign index_lt_depth_plus_5_left = idx_out;
assign index_lt_depth_plus_5_right = depth_plus_5_out;
assign idx_between_7_depth_plus_11_comb_left = index_ge_7_out;
assign idx_between_7_depth_plus_11_comb_right = index_lt_depth_plus_11_out;
assign top_0_3_write_en = _guard447;
assign top_0_3_clk = clk;
assign top_0_3_reset = reset;
assign top_0_3_in = t3_read_data;
assign top_2_1_write_en = 1'd1;
assign top_2_1_clk = clk;
assign top_2_1_reset = reset;
assign top_2_1_in = top_1_1_out;
assign left_3_3_write_en = 1'd1;
assign left_3_3_clk = clk;
assign left_3_3_reset = reset;
assign left_3_3_in = left_3_2_out;
assign early_reset_static_par_go_in = _guard451;
assign iter_limit_write_en = _guard452;
assign iter_limit_clk = clk;
assign iter_limit_reset = reset;
assign iter_limit_in = iter_limit_add_out;
assign depth_plus_11_left = depth;
assign depth_plus_11_right = 32'd11;
assign index_lt_depth_plus_2_left = idx_out;
assign index_lt_depth_plus_2_right = depth_plus_2_out;
assign top_0_0_write_en = _guard456;
assign top_0_0_clk = clk;
assign top_0_0_reset = reset;
assign top_0_0_in = t0_read_data;
assign pe_1_1_mul_ready =
  _guard462 ? index_ge_7_out :
  1'd0;
assign pe_1_1_clk = clk;
assign pe_1_1_top =
  _guard465 ? top_1_1_out :
  32'd0;
assign pe_1_1_left =
  _guard468 ? left_1_1_out :
  32'd0;
assign pe_1_1_go = _guard471;
assign pe_1_1_reset = reset;
assign idx_minus_3_res_in = idx_minus_3_out;
assign index_eq_depth_plus_9_left = idx_out;
assign index_eq_depth_plus_9_right = depth_plus_9_out;
assign index_lt_depth_plus_1_left = idx_out;
assign index_lt_depth_plus_1_right = depth_plus_1_out;
assign idx_between_3_depth_plus_3_comb_left = index_ge_3_out;
assign idx_between_3_depth_plus_3_comb_right = index_lt_depth_plus_3_out;
assign idx_between_5_depth_plus_9_comb_left = index_ge_5_out;
assign idx_between_5_depth_plus_9_comb_right = index_lt_depth_plus_9_out;
assign left_0_1_write_en = 1'd1;
assign left_0_1_clk = clk;
assign left_0_1_reset = reset;
assign left_0_1_in = left_0_0_out;
assign pe_2_2_mul_ready =
  _guard474 ? index_ge_9_out :
  1'd0;
assign pe_2_2_clk = clk;
assign pe_2_2_top =
  _guard477 ? top_2_2_out :
  32'd0;
assign pe_2_2_left =
  _guard480 ? left_2_2_out :
  32'd0;
assign pe_2_2_go = _guard483;
assign pe_2_2_reset = reset;
assign idx_minus_3_left = idx_out;
assign idx_minus_3_right = 32'd3;
assign while_wrapper_early_reset_static_par0_go_in = _guard489;
assign while_wrapper_early_reset_static_par0_done_in = _guard493;
// COMPONENT END: systolic_array_comp
endmodule
module default_post_op(
  input logic out_mem_0_done,
  input logic r0_valid,
  input logic [31:0] r0_value,
  input logic [2:0] r0_idx,
  input logic out_mem_1_done,
  input logic r1_valid,
  input logic [31:0] r1_value,
  input logic [2:0] r1_idx,
  input logic out_mem_2_done,
  input logic r2_valid,
  input logic [31:0] r2_value,
  input logic [2:0] r2_idx,
  input logic out_mem_3_done,
  input logic r3_valid,
  input logic [31:0] r3_value,
  input logic [2:0] r3_idx,
  output logic computation_done,
  output logic [2:0] out_mem_0_addr0,
  output logic [31:0] out_mem_0_write_data,
  output logic out_mem_0_write_en,
  output logic [2:0] out_mem_1_addr0,
  output logic [31:0] out_mem_1_write_data,
  output logic out_mem_1_write_en,
  output logic [2:0] out_mem_2_addr0,
  output logic [31:0] out_mem_2_write_data,
  output logic out_mem_2_write_en,
  output logic [2:0] out_mem_3_addr0,
  output logic [31:0] out_mem_3_write_data,
  output logic out_mem_3_write_en,
  input logic go,
  input logic clk,
  input logic reset,
  output logic done
);
// COMPONENT START: default_post_op
logic delay_reg_in;
logic delay_reg_write_en;
logic delay_reg_clk;
logic delay_reg_reset;
logic delay_reg_out;
logic delay_reg_done;
logic sig_reg_in;
logic sig_reg_write_en;
logic sig_reg_clk;
logic sig_reg_reset;
logic sig_reg_out;
logic sig_reg_done;
std_reg # (
    .WIDTH(1)
) delay_reg (
    .clk(delay_reg_clk),
    .done(delay_reg_done),
    .in(delay_reg_in),
    .out(delay_reg_out),
    .reset(delay_reg_reset),
    .write_en(delay_reg_write_en)
);
std_reg # (
    .WIDTH(1)
) sig_reg (
    .clk(sig_reg_clk),
    .done(sig_reg_done),
    .in(sig_reg_in),
    .out(sig_reg_out),
    .reset(sig_reg_reset),
    .write_en(sig_reg_write_en)
);
wire _guard0 = 1;
wire _guard1 = sig_reg_out;
wire _guard2 = go;
wire _guard3 = go;
wire _guard4 = go;
wire _guard5 = go;
wire _guard6 = delay_reg_done;
wire _guard7 = _guard5 & _guard6;
wire _guard8 = go;
wire _guard9 = go;
wire _guard10 = go;
wire _guard11 = go;
wire _guard12 = go;
wire _guard13 = go;
wire _guard14 = go;
wire _guard15 = go;
wire _guard16 = go;
wire _guard17 = go;
wire _guard18 = r3_valid;
wire _guard19 = r3_idx == 3'd3;
wire _guard20 = _guard18 & _guard19;
wire _guard21 = _guard17 & _guard20;
wire _guard22 = go;
wire _guard23 = go;
wire _guard24 = go;
wire _guard25 = ~_guard24;
assign done = _guard1;
assign out_mem_1_addr0 =
  _guard2 ? r1_idx :
  3'd0;
assign out_mem_0_write_data =
  _guard3 ? r0_value :
  32'd0;
assign out_mem_3_write_data =
  _guard4 ? r3_value :
  32'd0;
assign computation_done = _guard7;
assign out_mem_2_write_data =
  _guard8 ? r2_value :
  32'd0;
assign out_mem_1_write_data =
  _guard9 ? r1_value :
  32'd0;
assign out_mem_1_write_en =
  _guard10 ? r1_valid :
  1'd0;
assign out_mem_0_write_en =
  _guard11 ? r0_valid :
  1'd0;
assign out_mem_2_write_en =
  _guard12 ? r2_valid :
  1'd0;
assign out_mem_3_write_en =
  _guard13 ? r3_valid :
  1'd0;
assign out_mem_0_addr0 =
  _guard14 ? r0_idx :
  3'd0;
assign out_mem_3_addr0 =
  _guard15 ? r3_idx :
  3'd0;
assign out_mem_2_addr0 =
  _guard16 ? r2_idx :
  3'd0;
assign delay_reg_write_en = _guard21;
assign delay_reg_clk = clk;
assign delay_reg_reset = reset;
assign delay_reg_in = 1'd1;
assign sig_reg_write_en = 1'd1;
assign sig_reg_clk = clk;
assign sig_reg_reset = reset;
assign sig_reg_in =
  _guard23 ? 1'd1 :
  _guard25 ? 1'd0 :
  1'd0;
always_comb begin
  if(~$onehot0({_guard25, _guard23})) begin
    $fatal(2, "Multiple assignment to port `sig_reg.in'.");
end
end
// COMPONENT END: default_post_op
endmodule
module main(
  input logic go,
  input logic clk,
  input logic reset,
  output logic done
);
// COMPONENT START: main
string DATA;
int CODE;
initial begin
    CODE = $value$plusargs("DATA=%s", DATA);
    $display("DATA (path to meminit files): %s", DATA);
    $readmemh({DATA, "/t0.dat"}, t0.mem);
    $readmemh({DATA, "/t1.dat"}, t1.mem);
    $readmemh({DATA, "/t2.dat"}, t2.mem);
    $readmemh({DATA, "/t3.dat"}, t3.mem);
    $readmemh({DATA, "/l0.dat"}, l0.mem);
    $readmemh({DATA, "/l1.dat"}, l1.mem);
    $readmemh({DATA, "/l2.dat"}, l2.mem);
    $readmemh({DATA, "/l3.dat"}, l3.mem);
    $readmemh({DATA, "/out_mem_0.dat"}, out_mem_0.mem);
    $readmemh({DATA, "/out_mem_1.dat"}, out_mem_1.mem);
    $readmemh({DATA, "/out_mem_2.dat"}, out_mem_2.mem);
    $readmemh({DATA, "/out_mem_3.dat"}, out_mem_3.mem);
end
final begin
    $writememh({DATA, "/t0.out"}, t0.mem);
    $writememh({DATA, "/t1.out"}, t1.mem);
    $writememh({DATA, "/t2.out"}, t2.mem);
    $writememh({DATA, "/t3.out"}, t3.mem);
    $writememh({DATA, "/l0.out"}, l0.mem);
    $writememh({DATA, "/l1.out"}, l1.mem);
    $writememh({DATA, "/l2.out"}, l2.mem);
    $writememh({DATA, "/l3.out"}, l3.mem);
    $writememh({DATA, "/out_mem_0.out"}, out_mem_0.mem);
    $writememh({DATA, "/out_mem_1.out"}, out_mem_1.mem);
    $writememh({DATA, "/out_mem_2.out"}, out_mem_2.mem);
    $writememh({DATA, "/out_mem_3.out"}, out_mem_3.mem);
end
logic [31:0] systolic_array_component_depth;
logic [31:0] systolic_array_component_t0_read_data;
logic [31:0] systolic_array_component_t1_read_data;
logic [31:0] systolic_array_component_t2_read_data;
logic [31:0] systolic_array_component_t3_read_data;
logic [31:0] systolic_array_component_l0_read_data;
logic [31:0] systolic_array_component_l1_read_data;
logic [31:0] systolic_array_component_l2_read_data;
logic [31:0] systolic_array_component_l3_read_data;
logic [2:0] systolic_array_component_t0_addr0;
logic [2:0] systolic_array_component_t1_addr0;
logic [2:0] systolic_array_component_t2_addr0;
logic [2:0] systolic_array_component_t3_addr0;
logic [2:0] systolic_array_component_l0_addr0;
logic [2:0] systolic_array_component_l1_addr0;
logic [2:0] systolic_array_component_l2_addr0;
logic [2:0] systolic_array_component_l3_addr0;
logic systolic_array_component_r0_valid;
logic [31:0] systolic_array_component_r0_value;
logic [2:0] systolic_array_component_r0_idx;
logic systolic_array_component_r1_valid;
logic [31:0] systolic_array_component_r1_value;
logic [2:0] systolic_array_component_r1_idx;
logic systolic_array_component_r2_valid;
logic [31:0] systolic_array_component_r2_value;
logic [2:0] systolic_array_component_r2_idx;
logic systolic_array_component_r3_valid;
logic [31:0] systolic_array_component_r3_value;
logic [2:0] systolic_array_component_r3_idx;
logic systolic_array_component_go;
logic systolic_array_component_clk;
logic systolic_array_component_reset;
logic systolic_array_component_done;
logic post_op_component_out_mem_0_done;
logic post_op_component_r0_valid;
logic [31:0] post_op_component_r0_value;
logic [2:0] post_op_component_r0_idx;
logic post_op_component_out_mem_1_done;
logic post_op_component_r1_valid;
logic [31:0] post_op_component_r1_value;
logic [2:0] post_op_component_r1_idx;
logic post_op_component_out_mem_2_done;
logic post_op_component_r2_valid;
logic [31:0] post_op_component_r2_value;
logic [2:0] post_op_component_r2_idx;
logic post_op_component_out_mem_3_done;
logic post_op_component_r3_valid;
logic [31:0] post_op_component_r3_value;
logic [2:0] post_op_component_r3_idx;
logic post_op_component_computation_done;
logic [2:0] post_op_component_out_mem_0_addr0;
logic [31:0] post_op_component_out_mem_0_write_data;
logic post_op_component_out_mem_0_write_en;
logic [2:0] post_op_component_out_mem_1_addr0;
logic [31:0] post_op_component_out_mem_1_write_data;
logic post_op_component_out_mem_1_write_en;
logic [2:0] post_op_component_out_mem_2_addr0;
logic [31:0] post_op_component_out_mem_2_write_data;
logic post_op_component_out_mem_2_write_en;
logic [2:0] post_op_component_out_mem_3_addr0;
logic [31:0] post_op_component_out_mem_3_write_data;
logic post_op_component_out_mem_3_write_en;
logic post_op_component_go;
logic post_op_component_clk;
logic post_op_component_reset;
logic post_op_component_done;
logic [2:0] t0_addr0;
logic [31:0] t0_write_data;
logic t0_write_en;
logic t0_clk;
logic t0_reset;
logic [31:0] t0_read_data;
logic t0_done;
logic [2:0] t1_addr0;
logic [31:0] t1_write_data;
logic t1_write_en;
logic t1_clk;
logic t1_reset;
logic [31:0] t1_read_data;
logic t1_done;
logic [2:0] t2_addr0;
logic [31:0] t2_write_data;
logic t2_write_en;
logic t2_clk;
logic t2_reset;
logic [31:0] t2_read_data;
logic t2_done;
logic [2:0] t3_addr0;
logic [31:0] t3_write_data;
logic t3_write_en;
logic t3_clk;
logic t3_reset;
logic [31:0] t3_read_data;
logic t3_done;
logic [2:0] l0_addr0;
logic [31:0] l0_write_data;
logic l0_write_en;
logic l0_clk;
logic l0_reset;
logic [31:0] l0_read_data;
logic l0_done;
logic [2:0] l1_addr0;
logic [31:0] l1_write_data;
logic l1_write_en;
logic l1_clk;
logic l1_reset;
logic [31:0] l1_read_data;
logic l1_done;
logic [2:0] l2_addr0;
logic [31:0] l2_write_data;
logic l2_write_en;
logic l2_clk;
logic l2_reset;
logic [31:0] l2_read_data;
logic l2_done;
logic [2:0] l3_addr0;
logic [31:0] l3_write_data;
logic l3_write_en;
logic l3_clk;
logic l3_reset;
logic [31:0] l3_read_data;
logic l3_done;
logic [2:0] out_mem_0_addr0;
logic [31:0] out_mem_0_write_data;
logic out_mem_0_write_en;
logic out_mem_0_clk;
logic out_mem_0_reset;
logic [31:0] out_mem_0_read_data;
logic out_mem_0_done;
logic [2:0] out_mem_1_addr0;
logic [31:0] out_mem_1_write_data;
logic out_mem_1_write_en;
logic out_mem_1_clk;
logic out_mem_1_reset;
logic [31:0] out_mem_1_read_data;
logic out_mem_1_done;
logic [2:0] out_mem_2_addr0;
logic [31:0] out_mem_2_write_data;
logic out_mem_2_write_en;
logic out_mem_2_clk;
logic out_mem_2_reset;
logic [31:0] out_mem_2_read_data;
logic out_mem_2_done;
logic [2:0] out_mem_3_addr0;
logic [31:0] out_mem_3_write_data;
logic out_mem_3_write_en;
logic out_mem_3_clk;
logic out_mem_3_reset;
logic [31:0] out_mem_3_read_data;
logic out_mem_3_done;
logic systolic_done_in;
logic systolic_done_write_en;
logic systolic_done_clk;
logic systolic_done_reset;
logic systolic_done_out;
logic systolic_done_done;
logic systolic_done_wire_in;
logic systolic_done_wire_out;
logic perform_computation_go_in;
logic perform_computation_go_out;
logic perform_computation_done_in;
logic perform_computation_done_out;
systolic_array_comp systolic_array_component (
    .clk(systolic_array_component_clk),
    .depth(systolic_array_component_depth),
    .done(systolic_array_component_done),
    .go(systolic_array_component_go),
    .l0_addr0(systolic_array_component_l0_addr0),
    .l0_read_data(systolic_array_component_l0_read_data),
    .l1_addr0(systolic_array_component_l1_addr0),
    .l1_read_data(systolic_array_component_l1_read_data),
    .l2_addr0(systolic_array_component_l2_addr0),
    .l2_read_data(systolic_array_component_l2_read_data),
    .l3_addr0(systolic_array_component_l3_addr0),
    .l3_read_data(systolic_array_component_l3_read_data),
    .r0_idx(systolic_array_component_r0_idx),
    .r0_valid(systolic_array_component_r0_valid),
    .r0_value(systolic_array_component_r0_value),
    .r1_idx(systolic_array_component_r1_idx),
    .r1_valid(systolic_array_component_r1_valid),
    .r1_value(systolic_array_component_r1_value),
    .r2_idx(systolic_array_component_r2_idx),
    .r2_valid(systolic_array_component_r2_valid),
    .r2_value(systolic_array_component_r2_value),
    .r3_idx(systolic_array_component_r3_idx),
    .r3_valid(systolic_array_component_r3_valid),
    .r3_value(systolic_array_component_r3_value),
    .reset(systolic_array_component_reset),
    .t0_addr0(systolic_array_component_t0_addr0),
    .t0_read_data(systolic_array_component_t0_read_data),
    .t1_addr0(systolic_array_component_t1_addr0),
    .t1_read_data(systolic_array_component_t1_read_data),
    .t2_addr0(systolic_array_component_t2_addr0),
    .t2_read_data(systolic_array_component_t2_read_data),
    .t3_addr0(systolic_array_component_t3_addr0),
    .t3_read_data(systolic_array_component_t3_read_data)
);
default_post_op post_op_component (
    .clk(post_op_component_clk),
    .computation_done(post_op_component_computation_done),
    .done(post_op_component_done),
    .go(post_op_component_go),
    .out_mem_0_addr0(post_op_component_out_mem_0_addr0),
    .out_mem_0_done(post_op_component_out_mem_0_done),
    .out_mem_0_write_data(post_op_component_out_mem_0_write_data),
    .out_mem_0_write_en(post_op_component_out_mem_0_write_en),
    .out_mem_1_addr0(post_op_component_out_mem_1_addr0),
    .out_mem_1_done(post_op_component_out_mem_1_done),
    .out_mem_1_write_data(post_op_component_out_mem_1_write_data),
    .out_mem_1_write_en(post_op_component_out_mem_1_write_en),
    .out_mem_2_addr0(post_op_component_out_mem_2_addr0),
    .out_mem_2_done(post_op_component_out_mem_2_done),
    .out_mem_2_write_data(post_op_component_out_mem_2_write_data),
    .out_mem_2_write_en(post_op_component_out_mem_2_write_en),
    .out_mem_3_addr0(post_op_component_out_mem_3_addr0),
    .out_mem_3_done(post_op_component_out_mem_3_done),
    .out_mem_3_write_data(post_op_component_out_mem_3_write_data),
    .out_mem_3_write_en(post_op_component_out_mem_3_write_en),
    .r0_idx(post_op_component_r0_idx),
    .r0_valid(post_op_component_r0_valid),
    .r0_value(post_op_component_r0_value),
    .r1_idx(post_op_component_r1_idx),
    .r1_valid(post_op_component_r1_valid),
    .r1_value(post_op_component_r1_value),
    .r2_idx(post_op_component_r2_idx),
    .r2_valid(post_op_component_r2_valid),
    .r2_value(post_op_component_r2_value),
    .r3_idx(post_op_component_r3_idx),
    .r3_valid(post_op_component_r3_valid),
    .r3_value(post_op_component_r3_value),
    .reset(post_op_component_reset)
);
comb_mem_d1 # (
    .IDX_SIZE(3),
    .SIZE(4),
    .WIDTH(32)
) t0 (
    .addr0(t0_addr0),
    .clk(t0_clk),
    .done(t0_done),
    .read_data(t0_read_data),
    .reset(t0_reset),
    .write_data(t0_write_data),
    .write_en(t0_write_en)
);
comb_mem_d1 # (
    .IDX_SIZE(3),
    .SIZE(4),
    .WIDTH(32)
) t1 (
    .addr0(t1_addr0),
    .clk(t1_clk),
    .done(t1_done),
    .read_data(t1_read_data),
    .reset(t1_reset),
    .write_data(t1_write_data),
    .write_en(t1_write_en)
);
comb_mem_d1 # (
    .IDX_SIZE(3),
    .SIZE(4),
    .WIDTH(32)
) t2 (
    .addr0(t2_addr0),
    .clk(t2_clk),
    .done(t2_done),
    .read_data(t2_read_data),
    .reset(t2_reset),
    .write_data(t2_write_data),
    .write_en(t2_write_en)
);
comb_mem_d1 # (
    .IDX_SIZE(3),
    .SIZE(4),
    .WIDTH(32)
) t3 (
    .addr0(t3_addr0),
    .clk(t3_clk),
    .done(t3_done),
    .read_data(t3_read_data),
    .reset(t3_reset),
    .write_data(t3_write_data),
    .write_en(t3_write_en)
);
comb_mem_d1 # (
    .IDX_SIZE(3),
    .SIZE(4),
    .WIDTH(32)
) l0 (
    .addr0(l0_addr0),
    .clk(l0_clk),
    .done(l0_done),
    .read_data(l0_read_data),
    .reset(l0_reset),
    .write_data(l0_write_data),
    .write_en(l0_write_en)
);
comb_mem_d1 # (
    .IDX_SIZE(3),
    .SIZE(4),
    .WIDTH(32)
) l1 (
    .addr0(l1_addr0),
    .clk(l1_clk),
    .done(l1_done),
    .read_data(l1_read_data),
    .reset(l1_reset),
    .write_data(l1_write_data),
    .write_en(l1_write_en)
);
comb_mem_d1 # (
    .IDX_SIZE(3),
    .SIZE(4),
    .WIDTH(32)
) l2 (
    .addr0(l2_addr0),
    .clk(l2_clk),
    .done(l2_done),
    .read_data(l2_read_data),
    .reset(l2_reset),
    .write_data(l2_write_data),
    .write_en(l2_write_en)
);
comb_mem_d1 # (
    .IDX_SIZE(3),
    .SIZE(4),
    .WIDTH(32)
) l3 (
    .addr0(l3_addr0),
    .clk(l3_clk),
    .done(l3_done),
    .read_data(l3_read_data),
    .reset(l3_reset),
    .write_data(l3_write_data),
    .write_en(l3_write_en)
);
comb_mem_d1 # (
    .IDX_SIZE(3),
    .SIZE(4),
    .WIDTH(32)
) out_mem_0 (
    .addr0(out_mem_0_addr0),
    .clk(out_mem_0_clk),
    .done(out_mem_0_done),
    .read_data(out_mem_0_read_data),
    .reset(out_mem_0_reset),
    .write_data(out_mem_0_write_data),
    .write_en(out_mem_0_write_en)
);
comb_mem_d1 # (
    .IDX_SIZE(3),
    .SIZE(4),
    .WIDTH(32)
) out_mem_1 (
    .addr0(out_mem_1_addr0),
    .clk(out_mem_1_clk),
    .done(out_mem_1_done),
    .read_data(out_mem_1_read_data),
    .reset(out_mem_1_reset),
    .write_data(out_mem_1_write_data),
    .write_en(out_mem_1_write_en)
);
comb_mem_d1 # (
    .IDX_SIZE(3),
    .SIZE(4),
    .WIDTH(32)
) out_mem_2 (
    .addr0(out_mem_2_addr0),
    .clk(out_mem_2_clk),
    .done(out_mem_2_done),
    .read_data(out_mem_2_read_data),
    .reset(out_mem_2_reset),
    .write_data(out_mem_2_write_data),
    .write_en(out_mem_2_write_en)
);
comb_mem_d1 # (
    .IDX_SIZE(3),
    .SIZE(4),
    .WIDTH(32)
) out_mem_3 (
    .addr0(out_mem_3_addr0),
    .clk(out_mem_3_clk),
    .done(out_mem_3_done),
    .read_data(out_mem_3_read_data),
    .reset(out_mem_3_reset),
    .write_data(out_mem_3_write_data),
    .write_en(out_mem_3_write_en)
);
std_reg # (
    .WIDTH(1)
) systolic_done (
    .clk(systolic_done_clk),
    .done(systolic_done_done),
    .in(systolic_done_in),
    .out(systolic_done_out),
    .reset(systolic_done_reset),
    .write_en(systolic_done_write_en)
);
std_wire # (
    .WIDTH(1)
) systolic_done_wire (
    .in(systolic_done_wire_in),
    .out(systolic_done_wire_out)
);
std_wire # (
    .WIDTH(1)
) perform_computation_go (
    .in(perform_computation_go_in),
    .out(perform_computation_go_out)
);
std_wire # (
    .WIDTH(1)
) perform_computation_done (
    .in(perform_computation_done_in),
    .out(perform_computation_done_out)
);
wire _guard0 = 1;
wire _guard1 = perform_computation_go_out;
wire _guard2 = perform_computation_go_out;
wire _guard3 = perform_computation_done_out;
wire _guard4 = systolic_array_component_done;
wire _guard5 = perform_computation_go_out;
wire _guard6 = _guard4 & _guard5;
wire _guard7 = systolic_array_component_done;
wire _guard8 = perform_computation_go_out;
wire _guard9 = _guard7 & _guard8;
wire _guard10 = systolic_array_component_done;
wire _guard11 = systolic_done_out;
wire _guard12 = _guard10 | _guard11;
wire _guard13 = perform_computation_go_out;
wire _guard14 = _guard12 & _guard13;
wire _guard15 = perform_computation_go_out;
wire _guard16 = perform_computation_go_out;
wire _guard17 = perform_computation_go_out;
wire _guard18 = perform_computation_go_out;
wire _guard19 = perform_computation_go_out;
wire _guard20 = perform_computation_go_out;
wire _guard21 = perform_computation_go_out;
wire _guard22 = perform_computation_go_out;
wire _guard23 = perform_computation_go_out;
wire _guard24 = perform_computation_go_out;
wire _guard25 = perform_computation_go_out;
wire _guard26 = perform_computation_go_out;
wire _guard27 = perform_computation_go_out;
wire _guard28 = perform_computation_go_out;
wire _guard29 = perform_computation_go_out;
wire _guard30 = perform_computation_go_out;
wire _guard31 = perform_computation_go_out;
wire _guard32 = perform_computation_go_out;
wire _guard33 = perform_computation_go_out;
wire _guard34 = perform_computation_go_out;
wire _guard35 = perform_computation_go_out;
wire _guard36 = perform_computation_go_out;
wire _guard37 = perform_computation_go_out;
wire _guard38 = perform_computation_go_out;
wire _guard39 = perform_computation_go_out;
wire _guard40 = perform_computation_go_out;
wire _guard41 = perform_computation_go_out;
wire _guard42 = perform_computation_go_out;
wire _guard43 = perform_computation_go_out;
wire _guard44 = perform_computation_go_out;
wire _guard45 = perform_computation_go_out;
wire _guard46 = perform_computation_go_out;
wire _guard47 = perform_computation_go_out;
wire _guard48 = perform_computation_go_out;
wire _guard49 = perform_computation_go_out;
wire _guard50 = systolic_done_wire_out;
wire _guard51 = ~_guard50;
wire _guard52 = perform_computation_go_out;
wire _guard53 = _guard51 & _guard52;
wire _guard54 = perform_computation_go_out;
wire _guard55 = perform_computation_go_out;
wire _guard56 = perform_computation_go_out;
wire _guard57 = perform_computation_go_out;
wire _guard58 = perform_computation_go_out;
wire _guard59 = perform_computation_go_out;
wire _guard60 = perform_computation_go_out;
wire _guard61 = perform_computation_go_out;
wire _guard62 = perform_computation_go_out;
assign l1_write_en = 1'd0;
assign l1_clk = clk;
assign l1_addr0 =
  _guard1 ? systolic_array_component_l1_addr0 :
  3'd0;
assign l1_reset = reset;
assign l2_write_en = 1'd0;
assign l2_clk = clk;
assign l2_addr0 =
  _guard2 ? systolic_array_component_l2_addr0 :
  3'd0;
assign l2_reset = reset;
assign done = _guard3;
assign systolic_done_write_en = _guard6;
assign systolic_done_clk = clk;
assign systolic_done_reset = reset;
assign systolic_done_in = 1'd1;
assign systolic_done_wire_in = _guard14;
assign t2_write_en = 1'd0;
assign t2_clk = clk;
assign t2_addr0 =
  _guard15 ? systolic_array_component_t2_addr0 :
  3'd0;
assign t2_reset = reset;
assign l0_write_en = 1'd0;
assign l0_clk = clk;
assign l0_addr0 =
  _guard16 ? systolic_array_component_l0_addr0 :
  3'd0;
assign l0_reset = reset;
assign t1_write_en = 1'd0;
assign t1_clk = clk;
assign t1_addr0 =
  _guard17 ? systolic_array_component_t1_addr0 :
  3'd0;
assign t1_reset = reset;
assign out_mem_3_write_en =
  _guard18 ? post_op_component_out_mem_3_write_en :
  1'd0;
assign out_mem_3_clk = clk;
assign out_mem_3_addr0 =
  _guard19 ? post_op_component_out_mem_3_addr0 :
  3'd0;
assign out_mem_3_reset = reset;
assign out_mem_3_write_data = post_op_component_out_mem_3_write_data;
assign post_op_component_r2_valid =
  _guard21 ? systolic_array_component_r2_valid :
  1'd0;
assign post_op_component_r0_valid =
  _guard22 ? systolic_array_component_r0_valid :
  1'd0;
assign post_op_component_r3_value =
  _guard23 ? systolic_array_component_r3_value :
  32'd0;
assign post_op_component_r3_idx =
  _guard24 ? systolic_array_component_r3_idx :
  3'd0;
assign post_op_component_out_mem_3_done =
  _guard25 ? out_mem_3_done :
  1'd0;
assign post_op_component_r0_value =
  _guard26 ? systolic_array_component_r0_value :
  32'd0;
assign post_op_component_r1_value =
  _guard27 ? systolic_array_component_r1_value :
  32'd0;
assign post_op_component_clk = clk;
assign post_op_component_r1_idx =
  _guard28 ? systolic_array_component_r1_idx :
  3'd0;
assign post_op_component_r2_idx =
  _guard29 ? systolic_array_component_r2_idx :
  3'd0;
assign post_op_component_out_mem_0_done =
  _guard30 ? out_mem_0_done :
  1'd0;
assign post_op_component_out_mem_2_done =
  _guard31 ? out_mem_2_done :
  1'd0;
assign post_op_component_r1_valid =
  _guard32 ? systolic_array_component_r1_valid :
  1'd0;
assign post_op_component_r3_valid =
  _guard33 ? systolic_array_component_r3_valid :
  1'd0;
assign post_op_component_go = _guard34;
assign post_op_component_reset = reset;
assign post_op_component_r0_idx =
  _guard35 ? systolic_array_component_r0_idx :
  3'd0;
assign post_op_component_r2_value =
  _guard36 ? systolic_array_component_r2_value :
  32'd0;
assign post_op_component_out_mem_1_done =
  _guard37 ? out_mem_1_done :
  1'd0;
assign l3_write_en = 1'd0;
assign l3_clk = clk;
assign l3_addr0 =
  _guard38 ? systolic_array_component_l3_addr0 :
  3'd0;
assign l3_reset = reset;
assign perform_computation_done_in = post_op_component_computation_done;
assign perform_computation_go_in = go;
assign t0_write_en = 1'd0;
assign t0_clk = clk;
assign t0_addr0 =
  _guard39 ? systolic_array_component_t0_addr0 :
  3'd0;
assign t0_reset = reset;
assign t3_write_en = 1'd0;
assign t3_clk = clk;
assign t3_addr0 =
  _guard40 ? systolic_array_component_t3_addr0 :
  3'd0;
assign t3_reset = reset;
assign out_mem_1_write_en =
  _guard41 ? post_op_component_out_mem_1_write_en :
  1'd0;
assign out_mem_1_clk = clk;
assign out_mem_1_addr0 =
  _guard42 ? post_op_component_out_mem_1_addr0 :
  3'd0;
assign out_mem_1_reset = reset;
assign out_mem_1_write_data = post_op_component_out_mem_1_write_data;
assign systolic_array_component_l1_read_data =
  _guard44 ? l1_read_data :
  32'd0;
assign systolic_array_component_l2_read_data =
  _guard45 ? l2_read_data :
  32'd0;
assign systolic_array_component_l3_read_data =
  _guard46 ? l3_read_data :
  32'd0;
assign systolic_array_component_depth =
  _guard47 ? 32'd4 :
  32'd0;
assign systolic_array_component_clk = clk;
assign systolic_array_component_t3_read_data =
  _guard48 ? t3_read_data :
  32'd0;
assign systolic_array_component_l0_read_data =
  _guard49 ? l0_read_data :
  32'd0;
assign systolic_array_component_go = _guard53;
assign systolic_array_component_reset = reset;
assign systolic_array_component_t1_read_data =
  _guard54 ? t1_read_data :
  32'd0;
assign systolic_array_component_t0_read_data =
  _guard55 ? t0_read_data :
  32'd0;
assign systolic_array_component_t2_read_data =
  _guard56 ? t2_read_data :
  32'd0;
assign out_mem_0_write_en =
  _guard57 ? post_op_component_out_mem_0_write_en :
  1'd0;
assign out_mem_0_clk = clk;
assign out_mem_0_addr0 =
  _guard58 ? post_op_component_out_mem_0_addr0 :
  3'd0;
assign out_mem_0_reset = reset;
assign out_mem_0_write_data = post_op_component_out_mem_0_write_data;
assign out_mem_2_write_en =
  _guard60 ? post_op_component_out_mem_2_write_en :
  1'd0;
assign out_mem_2_clk = clk;
assign out_mem_2_addr0 =
  _guard61 ? post_op_component_out_mem_2_addr0 :
  3'd0;
assign out_mem_2_reset = reset;
assign out_mem_2_write_data = post_op_component_out_mem_2_write_data;
// COMPONENT END: main
endmodule

