#!/bin/bash

function DP1Active {
	! xrandr | grep "^DP1" | grep disconnected
}

function DP2Active {
	! xrandr | grep "^DP2" | grep disconnected
}

if DP1Active || DP2Active
then
	xra
fi
