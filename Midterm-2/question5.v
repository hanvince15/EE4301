

module multiplier(
    input wire signed [7:0] M,  // Multiplicand
    input wire signed [7:0] Q,  // Multiplier
    output reg signed [7:0] A,  // Accumulator
    input wire [3:0] n,         // Counter
    output reg done            // Done
);

    localparam [2:0]
        S_START = 3'b000,
        S_INIT = 3'b001,
        S_CHECK_Q = 3'b010,
        S_SUBTRACT = 3'b011,
        S_ADD = 3'b100,
        S_SHIFT = 3'b101,
        S_CHECK_N = 3'b110,
        S_STOP = 3'b111;

    reg [2:0] state, next_state;
    always @(posedge clk) begin
        if (reset)
            state <= S_START;
        else
            state <= next_state;
    end

    // Output register to hold the result (Qres)
    reg signed [7:0] Qres;

    input wire clk, reset;

    always @* begin
        case (state)
            S_START: next_state = S_INIT;
            S_INIT: next_state = S_CHECK_Q;
            S_CHECK_Q: next_state = (Q[1:0] == 2'b10) ? S_SUBTRACT : S_ADD;
            S_SUBTRACT: next_state = S_SHIFT;
            S_ADD: next_state = S_SHIFT;
            S_SHIFT: next_state = S_CHECK_N;
            S_CHECK_N: next_state = (n == 4'b0000) ? S_STOP : S_CHECK_Q;
            S_STOP: next_state = S_STOP;
            default: next_state = S_START;
        endcase
    end

    always @(posedge clk) begin
        case (state)
            S_START: begin
                A <= 0;
                Qres <= 0;
                done <= 0;
            end
            S_INIT: begin
                A <= 0;
                Qres <= 0;
                done <= 0;
            end
            S_CHECK_Q: begin

            end
            S_SUBTRACT: begin
                A <= A - M;
            end
            S_ADD: begin
                A <= A + M;
            end
            S_SHIFT: begin
                {Q, Qres, A} <= {Q[0], A[7:1], Q[7]};
                n <= n - 1;
            end
            S_CHECK_N: begin

            end
            S_STOP: begin
                done <= 1;
            end
            default: begin

            end
        endcase
    end

endmodule
