function init_state_machine()
{
	var machine =
	{
		state_list : ds_list_create(),
		curr_state_name : "",
		next_state_name : "",
		jump	: false,
		enter	: false,
		leave	: false
	}
	return machine;
}

function add_state(machine,new_state_name)
{
	ds_list_add(machine.state_list,new_state_name);
}

function set_init_state(machine,state_name)
{
	machine.curr_state_name = state_name;
	machine.enter = true;
}

function is_enter_state(machine)
{
	return machine.enter;
}
	
function is_leave_state(machine)
{
	return machine.leave;
}

function is_jump_state(machine)
{
	return machine.jump;
}

function enter_state(machine)
{
	machine.enter = false;
	machine.leave = false;
}

function leave_state(machine)
{
	machine.enter = true;
	machine.leave = false;
}

function set_next_state(machine,state_name)
{
	if ds_list_find_index(machine.state_list,state_name) == -1
	{
		show_debug_message("Jump State Error,target state does not exist")
	}
	else
	{
		machine.jump = true;
		machine.enter = false;
		machine.leave = true;
		machine.next_state_name = state_name;
	}
}
	
function jump_state(machine)
{
	machine.curr_state_name = machine.next_state_name;
	machine.jump = false;
	machine.enter = true;
	machine.leave = false;
}