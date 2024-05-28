import os
import calyx.builder as cb


def define_inputs(comp, inputs, debug):
    input_ports_map = {}
    for input_port in inputs:
        port = input_port.split(':')
        if '[' in port[0]:
            bracket_left = port[0].index('[')
            bracket_right = port[0].index(']')
            num = int(port[0][bracket_left+1: bracket_right])
            for i in range(num):
                port_name = f'{port[0][: bracket_left]}_{i}'
                input_ports_map[port_name] = comp.input(port_name, port[1])
        else:
            input_ports_map[port[0]] = comp.input(port[0], port[1])
    return input_ports_map


def define_outputs(comp, outputs, debug):
    output_ports_map = {}
    for output_port in outputs:
        port = output_port.split(':')
        if '[' in port[0]:
            bracket_left = port[0].index('[')
            bracket_right = port[0].index(']')
            num = int(port[0][bracket_left+1: bracket_right])
            for i in range(num):
                port_name = f'{port[0][: bracket_left]}_{i}'
                output_ports_map[port_name] = comp.output(port_name, port[1])
        else:
            output_ports_map[port[0]] = comp.output(port[0], port[1])
    return output_ports_map


def gen_calyx(module_name, inputs, outputs, user_id,
              debug):
    calyx_builder = cb.Builder()
    comp = calyx_builder.component(module_name)
    inputs = define_inputs(comp, inputs, debug)
    outputs = define_outputs(comp, outputs, debug)
    if debug:
        calyx_builder.program.emit()
    calyx_path = os.path.join('user_session', str(user_id))
    os.makedirs(calyx_path, exist_ok=True)
    with open(os.path.join(calyx_path, f'{module_name}.futil'), 'w', encoding='utf-8') as f:
        f.write(calyx_builder.program.doc())

