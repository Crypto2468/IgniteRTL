# Ripple Carry Adder

## Purpose
The Ripple Carry Adder (RCA) is a multi-bit combinational digital adder built by cascading multiple 1-bit full adders in series. It is parameterized to support any desired operand bit-width.

## Features
- **Parameterized Width**: Supports any bit-width through the `WIDTH` parameter.
- **Regular Structure**: Simple layout suitable for standard cell auto-layout.
- **Generate Loop Logic**: Clean, loop-based definition for parameterized hardware generation.

## Inputs
| Port Name | Bit Width | Type | Description |
|-----------|-----------|------|-------------|
| `a`       | `WIDTH`   | input| First binary input vector |
| `b`       | `WIDTH`   | input| Second binary input vector |
| `cin`     | 1         | input| Carry-in input to the LSB stage |

## Outputs
| Port Name | Bit Width | Type | Description |
|-----------|-----------|------|-------------|
| `sum`     | `WIDTH`   | output| Sum output vector |
| `cout`    | 1         | output| Carry-out from the MSB stage |

## Working Principle
The Ripple Carry Adder operates on the same principal as manual decimal addition:
- The least significant bit (LSB) adds `a[0]`, `b[0]`, and `cin` to produce `sum[0]` and a carry-out `carry[1]`.
- This carry-out `carry[1]` is routed to the carry-in of the next stage ($i=1$), which adds `a[1]`, `b[1]`, and `carry[1]`.
- This serial propagation (rippling) continues until the most significant bit (MSB) produces `sum[WIDTH-1]` and the final `cout`.

### Propagation Delay
The critical path is determined by the carry propagation from LSB to MSB. For an $N$-bit adder, the worst-case delay is:
$$t_{\text{delay}} = (N-1) \cdot t_{\text{carry\_prop}} + t_{\text{sum\_generation}}$$
where $t_{\text{carry\_prop}}$ is the delay of carry-out from one stage to the next.

## Applications
- Low-power, low-speed arithmetic blocks.
- Non-critical timing paths in DSP and microcontrollers.
- Simple counter incrementers.

## Expected Simulation Behaviour
- Sum outputs are correct behavioral addition outputs.
- In waveform analysis, we expect to see the carry bits propagate sequentially from LSB to MSB.

## Future Improvements
- Implement fast carry adders (e.g. Carry Lookahead, Carry Select) for high-performance paths to eliminate the linear ($O(N)$) carry delay bottleneck.
