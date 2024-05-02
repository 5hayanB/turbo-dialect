from llama_cpp import Llama, LlamaGrammar


grammar_file = '/home/5hayanB/repositories/my_repositories/github/turbo-dialect/ast-gen/grammar/compressed_ast.gbnf'
# grammar_file = '/home/5hayanB/repositories/other_repositories/github/llama.cpp/grammars/json.gbnf'
grammar = LlamaGrammar.from_file(file=grammar_file)

llm = Llama(model_path="/home/5hayanB/llms/codellama-13b.Q8_0/codellama-13b.Q8_0.gguf", n_ctx=2048)

response = llm(
    """A Decoder module decodes an instruction into several components.

There is one 32-bit instruction input port and 16 output ports which consists of 10 7-bit ports (opcode, funct7, R-Type, I-Type arithmetic, I-Type load, I-Type jalr, S-Type, B-Type, U-Type auipc, U-Type lui and J-Type IDs), 3 5-bit ports (rd, rs1 and rs2 addresses), a 3-bit funct3, and a 32-bit immediate.

The opcode is the 7 lowest bits of the instruction. rd address is the bits 11 to 7 only if the opcode is equal to either 51, 19, 3, 15, 103, 115, 23, 55 or 111, otherwise the opcode will be zero. funct3 is the bits 14 to 12 of the instruction only if the opcode is equal to either 51, 19, 3, 15, 103, 115, 35 or 99 otherwise funct3 will be zero. rs1 address is the bits 19 to 15 of the instruction only if the opcode is equal to 51, 19, 3, 15, 103, 115, 35 or 99 otherwise rs1 address will be zero. rs2 address is the bits 24 to 20 only if the opcode is equal to either 51, 35 or 99 otherwise rs2 address will be zero. funct7 is the upper 7 bits of the instruction only if the opcode is equal to 51 otherwise funct7 will be zero.

Immediate is one of 5 values. One value is bits 31 to 20 of the instruction only if the opcode is either 19, 3, 15, 103 or 115. Another value is bits 31 to 25 concatenated with bits 11 to 7 of the instruction only if the opcode is 35. Another value is bit 31, bit 7, bits 30 to 25 and bits 11 to 8 of the instruction and 1 bit zero all concatenated together only if the opcode is equal to 99. Another value is bits 31 to 12 of the instruction only if the opcode is equal to either 23 or 55. Another value is bit 31, bits 19 to 12, bit 20 and bits 30 to 21 of the instruction and 1 bit zero all concatenated together only if the opcode is equal to 111. Otherwise immediate will be zero.
""",
    grammar=grammar,
    max_tokens=-1,
    echo=True
)

print(response)

# output = llm(
#       "Q: Name the planets in the solar system? A: ", # Prompt
#       max_tokens=32, # Generate up to 32 tokens
#       stop=["Q:", "\n"], # Stop generating just before the model would generate a new question
#       echo=True # Echo the prompt back in the output
# ) # Generate a completion, can also call create_completion
# print(output)
