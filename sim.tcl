


proc d {} {
vdel -all -lib basics
vdel -all -lib work

}

proc lib {} {
  vlib  basics
  #vcom  -work basics ../hdl/lib/basics/basics_pkg.vhd
  #vcom  -work basics ../hdl/lib/basics/*.vhd
  #vlog  -work basics ../hdl/lib/basics/*.v
  vlib work
}

proc com {} {


vlog ../hdl/*.v
vlog ../simulation/*.v

}

proc sim {} {

  vsim -t ps  -L work work.flipflop_tb
  
  

}



proc r {} {

 
  run 500 ns
}


proc q {} {

quit -sim
}

