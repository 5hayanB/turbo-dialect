import re
import calyx.builder as cb


def define_inputs(comp, inputs):
    input_ports_map = {}
    input_ports_list = inputs.split(',')
    for input_port in input_ports_list:
        port = input_port.split(':')
        if '[' in port[0]:
            pass
        else:
            input_ports_map[port[0]] = comp.input(port[0], port[1])


def gen_calyx(module_name, inputs, outputs):
    calyx_builder = cb.Builder()
    comp = calyx_builder.component(module_name)
    define_inputs(comp, inputs)

