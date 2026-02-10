#!/bin/bash

name="global"
func_a(){
	local var_name="local"
	echo "Local variable inside the function : $var_name"
}

func_b(){
	echo "Global/Regular variable inside another function : $name"
}

func_a
func_b
echo "Local variable outside the function : $loc_var"
echo "Global/Regular variable outside the function : $name"
