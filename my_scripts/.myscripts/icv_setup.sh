#!/bin/bash

# Create "design" and "testbench" directories in the current directory
mkdir -p design testbench

# Define the content for tb.v
cat << 'EOF' > testbench/tb.v
module tb;
reg INPUTS;
wire OUTPUTS;

module_name uut (inputs, outputs);

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0, tb);
end

endmodule
EOF

# Notify the user
echo "Folders 'design' and 'testbench' created, and 'tb.v' file added to 'testbench'."

