# Wrapper script for brainlogs windows 10/11
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
python "$ScriptDir\main.py" @args